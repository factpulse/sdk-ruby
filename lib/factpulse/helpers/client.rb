# frozen_string_literal: true
require 'net/http'; require 'json'; require 'base64'; require 'uri'; require 'securerandom'

module FactPulse
  module Helpers
    # Credentials Chorus Pro pour le mode Zero-Trust.
    # Ces credentials sont passés dans chaque requête et ne sont jamais stockés côté serveur.
    class ChorusProCredentials
      attr_reader :piste_client_id, :piste_client_secret, :chorus_pro_login, :chorus_pro_password, :sandbox
      def initialize(piste_client_id:, piste_client_secret:, chorus_pro_login:, chorus_pro_password:, sandbox: true)
        @piste_client_id, @piste_client_secret = piste_client_id, piste_client_secret
        @chorus_pro_login, @chorus_pro_password, @sandbox = chorus_pro_login, chorus_pro_password, sandbox
      end
      def to_h
        { 'piste_client_id' => @piste_client_id, 'piste_client_secret' => @piste_client_secret,
          'chorus_pro_login' => @chorus_pro_login, 'chorus_pro_password' => @chorus_pro_password, 'sandbox' => @sandbox }
      end
    end

    # Credentials AFNOR PDP pour le mode Zero-Trust.
    # Ces credentials sont passés dans chaque requête et ne sont jamais stockés côté serveur.
    class AFNORCredentials
      attr_reader :client_id, :client_secret, :flow_service_url
      def initialize(client_id:, client_secret:, flow_service_url:)
        @client_id, @client_secret, @flow_service_url = client_id, client_secret, flow_service_url
      end
      def to_h
        { 'client_id' => @client_id, 'client_secret' => @client_secret, 'flow_service_url' => @flow_service_url }
      end
    end

    # Helpers pour créer des montants totaux simplifiés.
    module MontantHelpers
      def self.montant(value)
        return '0.00' if value.nil?
        return format('%.2f', value) if value.is_a?(Numeric)
        value.is_a?(String) ? value : '0.00'
      end

      def self.montant_total(ht, tva, ttc, a_payer, remise_ttc: nil, motif_remise: nil, acompte: nil)
        result = {
          'montantHtTotal' => montant(ht), 'montantTva' => montant(tva),
          'montantTtcTotal' => montant(ttc), 'montantAPayer' => montant(a_payer)
        }
        result['montantRemiseGlobaleTtc'] = montant(remise_ttc) if remise_ttc
        result['motifRemiseGlobaleTtc'] = motif_remise if motif_remise
        result['acompte'] = montant(acompte) if acompte
        result
      end

      def self.ligne_de_poste(numero, denomination, quantite, montant_unitaire_ht, montant_ligne_ht,
                              taux_tva: '20.00', categorie_tva: 'S', unite: 'C62', **options)
        result = {
          'numero' => numero, 'denomination' => denomination,
          'quantite' => montant(quantite), 'montantUnitaireHt' => montant(montant_unitaire_ht),
          'montantTotalLigneHt' => montant(montant_ligne_ht), 'tauxTva' => montant(taux_tva),
          'categorieTva' => categorie_tva, 'unite' => unite
        }
        result['reference'] = options[:reference] if options[:reference]
        result['montantTvaLigne'] = montant(options[:montant_tva_ligne]) if options[:montant_tva_ligne]
        result['montantRemiseHt'] = montant(options[:montant_remise_ht]) if options[:montant_remise_ht]
        result['codeRaisonReduction'] = options[:code_raison_reduction] if options[:code_raison_reduction]
        result['raisonReduction'] = options[:raison_reduction] if options[:raison_reduction]
        result['motifExoneration'] = options[:motif_exoneration] if options[:motif_exoneration]
        result['dateDebutPeriode'] = options[:date_debut_periode] if options[:date_debut_periode]
        result['dateFinPeriode'] = options[:date_fin_periode] if options[:date_fin_periode]
        result['description'] = options[:description] if options[:description]
        result
      end

      def self.ligne_de_tva(taux, base_ht, montant_tva, categorie: 'S', motif_exoneration: nil)
        result = {
          'tauxTva' => montant(taux), 'montantBaseHt' => montant(base_ht),
          'montantTva' => montant(montant_tva), 'categorieTva' => categorie
        }
        result['motifExoneration'] = motif_exoneration if motif_exoneration
        result
      end
    end

    class FactPulseClient
      attr_reader :chorus_credentials, :afnor_credentials

      def initialize(email:, password:, api_url: nil, client_uid: nil, chorus_credentials: nil, afnor_credentials: nil,
                     polling_interval: nil, polling_timeout: nil, max_retries: nil)
        @email, @password = email, password; @api_url = (api_url || 'https://factpulse.fr').chomp('/')
        @client_uid, @polling_interval, @polling_timeout, @max_retries = client_uid, polling_interval || 2000, polling_timeout || 120000, max_retries || 1
        @chorus_credentials, @afnor_credentials = chorus_credentials, afnor_credentials
        @access_token = @refresh_token = @token_expires_at = nil
      end

      def chorus_credentials_for_api; @chorus_credentials&.to_h; end
      def afnor_credentials_for_api; @afnor_credentials&.to_h; end
      # Alias plus courts
      def get_chorus_pro_credentials; chorus_credentials_for_api; end
      def get_afnor_credentials; afnor_credentials_for_api; end

      def ensure_authenticated(force_refresh: false)
        now = (Time.now.to_f * 1000).to_i
        if force_refresh || @access_token.nil? || (@token_expires_at && now >= @token_expires_at)
          payload = { 'username' => @email, 'password' => @password }; payload['client_uid'] = @client_uid if @client_uid
          response = http_post(URI("#{@api_url}/api/token/"), payload)
          raise FactPulseAuthError, "Auth failed" unless response.is_a?(Net::HTTPSuccess)
          tokens = JSON.parse(response.body); @access_token, @refresh_token = tokens['access'], tokens['refresh']
          @token_expires_at = now + (28 * 60 * 1000)
        end
      end

      def reset_auth; @access_token = @refresh_token = @token_expires_at = nil; end

      def poll_task(task_id, timeout: nil, interval: nil)
        timeout_ms, interval_ms = timeout || @polling_timeout, interval || @polling_interval
        start_time, current_interval = (Time.now.to_f * 1000).to_i, interval_ms.to_f
        loop do
          raise FactPulsePollingTimeout.new(task_id, timeout_ms) if (Time.now.to_f * 1000).to_i - start_time > timeout_ms
          ensure_authenticated; response = http_get(URI("#{@api_url}/api/v1/traitement/taches/#{task_id}/statut"))
          reset_auth and next if response.code == '401'
          data = JSON.parse(response.body)
          return data['resultat'] || {} if data['statut'] == 'SUCCESS'
          if data['statut'] == 'FAILURE'
            r = data['resultat'] || {}
            raise FactPulseValidationError.new("Task #{task_id} failed: #{r['message_erreur'] || '?'}", (r['erreurs'] || []).map { |e| ValidationErrorDetail.from_hash(e) })
          end
          sleep(current_interval / 1000.0); current_interval = [current_interval * 1.5, 10000].min
        end
      end

      def self.format_montant(m); MontantHelpers.montant(m); end

      # Génère une facture Factur-X à partir d'un dict/hash et d'un PDF source.
      # Accepte un Hash, un String JSON, ou tout objet avec une méthode to_h/to_hash.
      # @param facture_data [Hash, String, Object] Données de la facture
      # @param pdf_source [String, File] Chemin vers le PDF source ou objet File
      # @param profil [String] Profil Factur-X (MINIMUM, BASIC, EN16931, EXTENDED)
      # @param format_sortie [String] Format de sortie (pdf, xml, both)
      # @param sync [Boolean] Mode synchrone (true) ou asynchrone (false)
      # @param timeout [Integer, nil] Timeout en ms pour le polling
      # @return [String] Contenu binaire du PDF généré
      def generer_facturx(facture_data, pdf_source, profil: 'EN16931', format_sortie: 'pdf', sync: true, timeout: nil)
        # Conversion des données en JSON string
        json_data = case facture_data
                    when String then facture_data
                    when Hash then JSON.generate(facture_data)
                    else
                      if facture_data.respond_to?(:to_h)
                        JSON.generate(facture_data.to_h)
                      elsif facture_data.respond_to?(:to_hash)
                        JSON.generate(facture_data.to_hash)
                      else
                        raise FactPulseValidationError.new("Type de données non supporté: #{facture_data.class}")
                      end
                    end

        # Lecture du PDF source
        pdf_content = case pdf_source
                      when String then File.binread(pdf_source)
                      when File then pdf_source.read
                      else
                        if pdf_source.respond_to?(:read)
                          pdf_source.read
                        else
                          raise FactPulseValidationError.new("Type de PDF non supporté: #{pdf_source.class}")
                        end
                      end
        pdf_filename = pdf_source.is_a?(String) ? File.basename(pdf_source) : 'facture.pdf'

        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/traitement/generer-facture")

        # Construire la requête multipart
        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = []

        # Champ donnees_facture
        body << "--#{boundary}\r\n"
        body << "Content-Disposition: form-data; name=\"donnees_facture\"\r\n\r\n"
        body << "#{json_data}\r\n"

        # Champ profil
        body << "--#{boundary}\r\n"
        body << "Content-Disposition: form-data; name=\"profil\"\r\n\r\n"
        body << "#{profil}\r\n"

        # Champ format_sortie
        body << "--#{boundary}\r\n"
        body << "Content-Disposition: form-data; name=\"format_sortie\"\r\n\r\n"
        body << "#{format_sortie}\r\n"

        # Champ source_pdf (fichier)
        body << "--#{boundary}\r\n"
        body << "Content-Disposition: form-data; name=\"source_pdf\"; filename=\"#{pdf_filename}\"\r\n"
        body << "Content-Type: application/pdf\r\n\r\n"
        body << pdf_content
        body << "\r\n"

        body << "--#{boundary}--\r\n"
        body_str = body.join

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.read_timeout = 120

        request = Net::HTTP::Post.new(uri)
        request['Authorization'] = "Bearer #{@access_token}"
        request['Content-Type'] = "multipart/form-data; boundary=#{boundary}"
        request.body = body_str

        response = http.request(request)

        if response.code == '401'
          reset_auth
          ensure_authenticated
          request['Authorization'] = "Bearer #{@access_token}"
          response = http.request(request)
        end

        unless response.is_a?(Net::HTTPSuccess)
          error_data = JSON.parse(response.body) rescue { 'detail' => response.body }
          raise FactPulseValidationError.new("Erreur API: #{error_data['detail'] || response.body}")
        end

        data = JSON.parse(response.body)

        if sync && data['id_tache']
          result = poll_task(data['id_tache'], timeout: timeout)
          if result['contenu_b64']
            require 'base64'
            return Base64.decode64(result['contenu_b64'])
          elsif result['contenu_xml']
            return result['contenu_xml']
          end
          raise FactPulseValidationError.new("Résultat inattendu: #{result.keys.join(', ')}")
        end

        data
      end

      private
      def http_post(uri, payload)
        Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = uri.scheme == 'https'; h.read_timeout = 30 }
          .request(Net::HTTP::Post.new(uri).tap { |r| r['Content-Type'] = 'application/json'; r.body = JSON.generate(payload) })
      end
      def http_get(uri)
        Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = uri.scheme == 'https'; h.read_timeout = 30 }
          .request(Net::HTTP::Get.new(uri).tap { |r| r['Authorization'] = "Bearer #{@access_token}" })
      end
    end
  end
end
