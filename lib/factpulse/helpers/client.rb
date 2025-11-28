# frozen_string_literal: true
require 'net/http'; require 'json'; require 'base64'; require 'uri'; require 'securerandom'; require 'digest'; require 'tempfile'

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
    # L'API FactPulse utilise ces credentials pour s'authentifier auprès de la PDP AFNOR.
    class AFNORCredentials
      attr_reader :flow_service_url, :token_url, :client_id, :client_secret, :directory_service_url
      def initialize(flow_service_url:, token_url:, client_id:, client_secret:, directory_service_url: nil)
        @flow_service_url, @token_url = flow_service_url, token_url
        @client_id, @client_secret, @directory_service_url = client_id, client_secret, directory_service_url
      end
      def to_h
        result = { 'flow_service_url' => @flow_service_url, 'token_url' => @token_url,
                   'client_id' => @client_id, 'client_secret' => @client_secret }
        result['directory_service_url'] = @directory_service_url if @directory_service_url
        result
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

      # Crée une ligne de poste (aligné sur LigneDePoste de models.py).
      def self.ligne_de_poste(numero, denomination, quantite, montant_unitaire_ht, montant_total_ligne_ht,
                              taux_tva: '20.00', categorie_tva: 'S', unite: 'FORFAIT', **options)
        result = {
          'numero' => numero, 'denomination' => denomination,
          'quantite' => montant(quantite), 'montantUnitaireHt' => montant(montant_unitaire_ht),
          'montantTotalLigneHt' => montant(montant_total_ligne_ht), 'tauxTvaManuel' => montant(taux_tva),
          'categorieTva' => categorie_tva, 'unite' => unite
        }
        result['reference'] = options[:reference] if options[:reference]
        result['montantRemiseHt'] = montant(options[:montant_remise_ht]) if options[:montant_remise_ht]
        result['codeRaisonReduction'] = options[:code_raison_reduction] if options[:code_raison_reduction]
        result['raisonReduction'] = options[:raison_reduction] if options[:raison_reduction]
        result['dateDebutPeriode'] = options[:date_debut_periode] if options[:date_debut_periode]
        result['dateFinPeriode'] = options[:date_fin_periode] if options[:date_fin_periode]
        result
      end

      # Crée une ligne de TVA (aligné sur LigneDeTVA de models.py).
      def self.ligne_de_tva(taux_manuel, montant_base_ht, montant_tva, categorie: 'S')
        {
          'tauxManuel' => montant(taux_manuel), 'montantBaseHt' => montant(montant_base_ht),
          'montantTva' => montant(montant_tva), 'categorie' => categorie
        }
      end

      # Crée une adresse postale pour l'API FactPulse.
      def self.adresse_postale(ligne1, code_postal, ville, pays: 'FR', ligne2: nil, ligne3: nil)
        result = { 'ligneUn' => ligne1, 'codePostal' => code_postal, 'nomVille' => ville, 'paysCodeIso' => pays }
        result['ligneDeux'] = ligne2 if ligne2
        result['ligneTrois'] = ligne3 if ligne3
        result
      end

      # Crée une adresse électronique. scheme_id: "0009"=SIREN, "0225"=SIRET
      def self.adresse_electronique(identifiant, scheme_id: '0009')
        { 'identifiant' => identifiant, 'schemeId' => scheme_id }
      end

      # Calcule le numéro TVA intracommunautaire français depuis un SIREN.
      def self.calculer_tva_intra(siren)
        return nil if siren.nil? || siren.length != 9 || !siren.match?(/^\d+$/)
        cle = (12 + 3 * (siren.to_i % 97)) % 97
        format('FR%02d%s', cle, siren)
      end

      # Crée un fournisseur (émetteur) avec auto-calcul SIREN, TVA intracommunautaire et adresses.
      def self.fournisseur(nom, siret, adresse_ligne1, code_postal, ville, **options)
        siren = options[:siren] || (siret.length == 14 ? siret[0, 9] : nil)
        numero_tva_intra = options[:numero_tva_intra] || (siren ? calculer_tva_intra(siren) : nil)
        result = {
          'nom' => nom, 'idFournisseur' => options[:id_fournisseur] || 0, 'siret' => siret,
          'adresseElectronique' => adresse_electronique(siret, scheme_id: '0225'),
          'adressePostale' => adresse_postale(adresse_ligne1, code_postal, ville, pays: options[:pays] || 'FR', ligne2: options[:adresse_ligne2])
        }
        result['siren'] = siren if siren
        result['numeroTvaIntra'] = numero_tva_intra if numero_tva_intra
        result['iban'] = options[:iban] if options[:iban]
        result['idServiceFournisseur'] = options[:code_service] if options[:code_service]
        result['codeCoordonneeBancairesFournisseur'] = options[:code_coordonnees_bancaires] if options[:code_coordonnees_bancaires]
        result
      end

      # Crée un destinataire (client) avec auto-calcul SIREN et adresses.
      def self.destinataire(nom, siret, adresse_ligne1, code_postal, ville, **options)
        siren = options[:siren] || (siret.length == 14 ? siret[0, 9] : nil)
        result = {
          'nom' => nom, 'siret' => siret,
          'adresseElectronique' => adresse_electronique(siret, scheme_id: '0225'),
          'adressePostale' => adresse_postale(adresse_ligne1, code_postal, ville, pays: options[:pays] || 'FR', ligne2: options[:adresse_ligne2])
        }
        result['siren'] = siren if siren
        result['codeServiceExecutant'] = options[:code_service_executant] if options[:code_service_executant]
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
        body = build_multipart_body(boundary, [
          { name: 'donnees_facture', content: json_data },
          { name: 'profil', content: profil },
          { name: 'format_sortie', content: format_sortie },
          { name: 'source_pdf', content: pdf_content, filename: pdf_filename, content_type: 'application/pdf' }
        ])

        response = http_multipart_post(uri, body, boundary)

        if response.code == '401'
          reset_auth; ensure_authenticated; response = http_multipart_post(uri, body, boundary)
        end

        unless response.is_a?(Net::HTTPSuccess)
          error_data = JSON.parse(response.body) rescue { 'detail' => response.body }
          raise FactPulseValidationError.new("Erreur API: #{error_data['detail'] || response.body}")
        end

        data = JSON.parse(response.body)

        if sync && data['id_tache']
          result = poll_task(data['id_tache'], timeout: timeout)
          if result['contenu_b64']
            return Base64.decode64(result['contenu_b64'])
          elsif result['contenu_xml']
            return result['contenu_xml']
          end
          raise FactPulseValidationError.new("Résultat inattendu: #{result.keys.join(', ')}")
        end

        data
      end

      # =========================================================================
      # AFNOR PDP - Authentication et helpers internes
      # =========================================================================

      private def get_afnor_credentials_internal
        return @afnor_credentials if @afnor_credentials

        ensure_authenticated
        response = http_get(URI("#{@api_url}/api/v1/afnor/credentials"))
        raise FactPulseAuthError, "Failed to get AFNOR credentials" unless response.is_a?(Net::HTTPSuccess)
        creds = JSON.parse(response.body)
        AFNORCredentials.new(
          flow_service_url: creds['flow_service_url'],
          token_url: creds['token_url'],
          client_id: creds['client_id'],
          client_secret: creds['client_secret'],
          directory_service_url: creds['directory_service_url']
        )
      end

      private def get_afnor_token_and_url
        credentials = get_afnor_credentials_internal
        uri = URI("#{@api_url}/api/v1/afnor/oauth/token")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        request = Net::HTTP::Post.new(uri)
        request['X-PDP-Token-URL'] = credentials.token_url
        request.set_form_data(
          'grant_type' => 'client_credentials',
          'client_id' => credentials.client_id,
          'client_secret' => credentials.client_secret
        )
        response = http.request(request)
        raise FactPulseAuthError, "AFNOR OAuth2 failed" unless response.is_a?(Net::HTTPSuccess)
        token_data = JSON.parse(response.body)
        raise FactPulseAuthError, "Invalid AFNOR OAuth2 response" unless token_data['access_token']
        { token: token_data['access_token'], pdp_base_url: credentials.flow_service_url }
      end

      private def make_afnor_request(method, endpoint, json_data: nil, multipart: nil)
        token_info = get_afnor_token_and_url
        uri = URI("#{@api_url}/api/v1/afnor#{endpoint}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.read_timeout = 60

        request = case method.upcase
                  when 'GET' then Net::HTTP::Get.new(uri)
                  when 'POST' then Net::HTTP::Post.new(uri)
                  else raise "Unsupported method: #{method}"
                  end

        request['Authorization'] = "Bearer #{token_info[:token]}"
        request['X-PDP-Base-URL'] = token_info[:pdp_base_url]

        if multipart
          boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
          request['Content-Type'] = "multipart/form-data; boundary=#{boundary}"
          request.body = build_multipart_body(boundary, multipart)
        elsif json_data
          request['Content-Type'] = 'application/json'
          request.body = JSON.generate(json_data)
        end

        response = http.request(request)
        raise FactPulseValidationError.new("AFNOR error: #{response.code} - #{response.body}") unless response.is_a?(Net::HTTPSuccess)

        content_type = response['Content-Type'] || ''
        if content_type.include?('application/json')
          JSON.parse(response.body) rescue {}
        else
          { '_raw' => response.body }
        end
      end

      # ==================== AFNOR Flow Service ====================

      # Soumet une facture à une PDP via l'API AFNOR.
      def soumettre_facture_afnor(pdf_path, flow_name, **options)
        pdf_content = File.binread(pdf_path)
        sha256 = Digest::SHA256.hexdigest(pdf_content)

        flow_info = {
          'name' => flow_name,
          'flowSyntax' => options[:flow_syntax] || 'CII',
          'flowProfile' => options[:flow_profile] || 'EN16931',
          'sha256' => sha256
        }
        flow_info['trackingId'] = options[:tracking_id] if options[:tracking_id]

        make_afnor_request('POST', '/flow/v1/flows', multipart: [
          { name: 'file', content: pdf_content, filename: File.basename(pdf_path), content_type: 'application/pdf' },
          { name: 'flowInfo', content: JSON.generate(flow_info), content_type: 'application/json' }
        ])
      end

      # Recherche des flux de facturation AFNOR.
      def rechercher_flux_afnor(**criteria)
        search_body = {
          'offset' => criteria[:offset] || 0,
          'limit' => criteria[:limit] || 25,
          'where' => {}
        }
        search_body['where']['trackingId'] = criteria[:tracking_id] if criteria[:tracking_id]
        search_body['where']['status'] = criteria[:status] if criteria[:status]

        make_afnor_request('POST', '/flow/v1/flows/search', json_data: search_body)
      end

      # Télécharge le fichier PDF d'un flux AFNOR.
      def telecharger_flux_afnor(flow_id)
        result = make_afnor_request('GET', "/flow/v1/flows/#{flow_id}")
        result['_raw'] || ''
      end

      # Vérifie la disponibilité du Flow Service AFNOR.
      def healthcheck_afnor
        make_afnor_request('GET', '/flow/v1/healthcheck')
      end

      # ==================== AFNOR Directory ====================

      # Recherche une entreprise par SIRET dans l'annuaire AFNOR.
      def rechercher_siret_afnor(siret)
        make_afnor_request('GET', "/directory/siret/#{siret}")
      end

      # Recherche une entreprise par SIREN dans l'annuaire AFNOR.
      def rechercher_siren_afnor(siren)
        make_afnor_request('GET', "/directory/siren/#{siren}")
      end

      # Liste les codes de routage disponibles pour un SIREN.
      def lister_codes_routage_afnor(siren)
        make_afnor_request('GET', "/directory/siren/#{siren}/routing-codes")
      end

      # =========================================================================
      # Chorus Pro
      # =========================================================================

      private def make_chorus_request(method, endpoint, json_data = nil)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/chorus-pro#{endpoint}")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.read_timeout = 60

        body = json_data || {}
        body['credentials'] = @chorus_credentials.to_h if @chorus_credentials

        request = case method.upcase
                  when 'GET' then Net::HTTP::Get.new(uri)
                  when 'POST' then Net::HTTP::Post.new(uri)
                  else raise "Unsupported method: #{method}"
                  end

        request['Authorization'] = "Bearer #{@access_token}"
        request['Content-Type'] = 'application/json'
        request.body = JSON.generate(body) if body.any?

        response = http.request(request)
        raise FactPulseValidationError.new("Chorus Pro error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # Recherche des structures sur Chorus Pro.
      def rechercher_structure_chorus(identifiant_structure: nil, raison_sociale: nil, type_identifiant: 'SIRET', restreindre_privees: true)
        body = { 'restreindre_structures_privees' => restreindre_privees }
        body['identifiant_structure'] = identifiant_structure if identifiant_structure
        body['raison_sociale_structure'] = raison_sociale if raison_sociale
        body['type_identifiant_structure'] = type_identifiant if type_identifiant

        make_chorus_request('POST', '/structures/rechercher', body)
      end

      # Consulte les détails d'une structure Chorus Pro.
      def consulter_structure_chorus(id_structure_cpp)
        make_chorus_request('POST', '/structures/consulter', { 'id_structure_cpp' => id_structure_cpp })
      end

      # Obtient l'ID Chorus Pro d'une structure depuis son SIRET.
      def obtenir_id_chorus_depuis_siret(siret, type_identifiant: 'SIRET')
        make_chorus_request('POST', '/structures/obtenir-id-depuis-siret', { 'siret' => siret, 'type_identifiant' => type_identifiant })
      end

      # Liste les services d'une structure Chorus Pro.
      def lister_services_structure_chorus(id_structure_cpp)
        make_chorus_request('GET', "/structures/#{id_structure_cpp}/services")
      end

      # Soumet une facture à Chorus Pro.
      def soumettre_facture_chorus(facture_data)
        make_chorus_request('POST', '/factures/soumettre', facture_data)
      end

      # Consulte le statut d'une facture Chorus Pro.
      def consulter_facture_chorus(identifiant_facture_cpp)
        make_chorus_request('POST', '/factures/consulter', { 'identifiant_facture_cpp' => identifiant_facture_cpp })
      end

      # =========================================================================
      # Validation
      # =========================================================================

      # Valide un PDF Factur-X.
      def valider_pdf_facturx(pdf_path, profil: 'EN16931')
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/traitement/valider-pdf-facturx")
        pdf_content = File.binread(pdf_path)

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, [
          { name: 'fichier_pdf', content: pdf_content, filename: File.basename(pdf_path), content_type: 'application/pdf' },
          { name: 'profil', content: profil }
        ])

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Validation error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # Valide un XML Factur-X.
      def valider_xml_facturx(xml_content, profil: 'EN16931')
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/traitement/valider-xml")

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, [
          { name: 'fichier_xml', content: xml_content, filename: 'facture.xml', content_type: 'application/xml' },
          { name: 'profil', content: profil }
        ])

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Validation error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # Valide la signature d'un PDF signé.
      def valider_signature_pdf(pdf_path)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/traitement/valider-signature-pdf")
        pdf_content = File.binread(pdf_path)

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, [
          { name: 'fichier_pdf', content: pdf_content, filename: File.basename(pdf_path), content_type: 'application/pdf' }
        ])

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Validation error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # =========================================================================
      # Signature
      # =========================================================================

      # Signe un PDF avec le certificat configuré côté serveur.
      def signer_pdf(pdf_path, **options)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/traitement/signer-pdf")
        pdf_content = File.binread(pdf_path)

        parts = [
          { name: 'fichier_pdf', content: pdf_content, filename: File.basename(pdf_path), content_type: 'application/pdf' },
          { name: 'use_pades_lt', content: (options[:use_pades_lt] ? 'true' : 'false') },
          { name: 'use_timestamp', content: (options.key?(:use_timestamp) ? (options[:use_timestamp] ? 'true' : 'false') : 'true') }
        ]
        parts << { name: 'raison', content: options[:raison] } if options[:raison]
        parts << { name: 'localisation', content: options[:localisation] } if options[:localisation]
        parts << { name: 'contact', content: options[:contact] } if options[:contact]

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, parts)

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Signature error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)

        result = JSON.parse(response.body) rescue {}
        raise FactPulseValidationError.new("Invalid signature response") unless result['pdf_signe_base64']
        Base64.decode64(result['pdf_signe_base64'])
      end

      # Génère un certificat de test (NON PRODUCTION).
      def generer_certificat_test(**options)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/traitement/generer-certificat-test")
        body = {
          'cn' => options[:cn] || 'Test Organisation',
          'organisation' => options[:organisation] || 'Test Organisation',
          'email' => options[:email] || 'test@example.com',
          'duree_jours' => options[:duree_jours] || 365,
          'taille_cle' => options[:taille_cle] || 2048
        }

        response = http_post_json(uri, body)
        raise FactPulseValidationError.new("Error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # =========================================================================
      # Workflow complet
      # =========================================================================

      # Génère un PDF Factur-X complet avec validation, signature et soumission optionnelles.
      def generer_facturx_complet(facture, pdf_source_path, **options)
        profil = options[:profil] || 'EN16931'
        valider = options.fetch(:valider, true)
        signer = options.fetch(:signer, false)
        soumettre_afnor = options.fetch(:soumettre_afnor, false)
        timeout = options[:timeout] || 120000

        result = {}

        # 1. Génération
        pdf_bytes = generer_facturx(facture, pdf_source_path, profil: profil, format_sortie: 'pdf', sync: true, timeout: timeout)
        result[:pdf_bytes] = pdf_bytes

        # Créer un fichier temporaire pour les opérations suivantes
        temp_file = Tempfile.new(['facturx_', '.pdf'])
        begin
          temp_file.binmode
          temp_file.write(pdf_bytes)
          temp_file.flush

          # 2. Validation
          if valider
            validation = valider_pdf_facturx(temp_file.path, profil: profil)
            result[:validation] = validation
            unless validation['est_conforme']
              if options[:output_path]
                File.binwrite(options[:output_path], pdf_bytes)
                result[:pdf_path] = options[:output_path]
              end
              return result
            end
          end

          # 3. Signature
          if signer
            pdf_bytes = signer_pdf(temp_file.path, **options)
            result[:pdf_bytes] = pdf_bytes
            result[:signature] = { 'signe' => true }
            temp_file.rewind
            temp_file.write(pdf_bytes)
            temp_file.flush
          end

          # 4. Soumission AFNOR
          if soumettre_afnor
            numero_facture = facture['numeroFacture'] || facture['numero_facture'] || 'FACTURE'
            flow_name = options[:afnor_flow_name] || "Facture #{numero_facture}"
            tracking_id = options[:afnor_tracking_id] || numero_facture
            afnor_result = soumettre_facture_afnor(temp_file.path, flow_name, tracking_id: tracking_id)
            result[:afnor] = afnor_result
          end

          # Sauvegarde finale
          if options[:output_path]
            File.binwrite(options[:output_path], pdf_bytes)
            result[:pdf_path] = options[:output_path]
          end
        ensure
          temp_file.close
          temp_file.unlink
        end

        result
      end

      private

      def http_post(uri, payload)
        Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = uri.scheme == 'https'; h.read_timeout = 30 }
          .request(Net::HTTP::Post.new(uri).tap { |r| r['Content-Type'] = 'application/json'; r.body = JSON.generate(payload) })
      end

      def http_post_json(uri, payload)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.read_timeout = 30
        request = Net::HTTP::Post.new(uri)
        request['Authorization'] = "Bearer #{@access_token}"
        request['Content-Type'] = 'application/json'
        request.body = JSON.generate(payload)
        http.request(request)
      end

      def http_get(uri)
        Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = uri.scheme == 'https'; h.read_timeout = 30 }
          .request(Net::HTTP::Get.new(uri).tap { |r| r['Authorization'] = "Bearer #{@access_token}" })
      end

      def http_multipart_post(uri, body, boundary)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.read_timeout = 120

        request = Net::HTTP::Post.new(uri)
        request['Authorization'] = "Bearer #{@access_token}"
        request['Content-Type'] = "multipart/form-data; boundary=#{boundary}"
        request.body = body
        http.request(request)
      end

      def build_multipart_body(boundary, parts)
        body_parts = []
        parts.each do |part|
          body_parts << "--#{boundary}\r\n"
          if part[:filename]
            body_parts << "Content-Disposition: form-data; name=\"#{part[:name]}\"; filename=\"#{part[:filename]}\"\r\n"
            body_parts << "Content-Type: #{part[:content_type] || 'application/octet-stream'}\r\n\r\n"
          else
            body_parts << "Content-Disposition: form-data; name=\"#{part[:name]}\"\r\n"
            body_parts << "Content-Type: #{part[:content_type]}\r\n" if part[:content_type]
            body_parts << "\r\n"
          end
          body_parts << part[:content]
          body_parts << "\r\n"
        end
        body_parts << "--#{boundary}--\r\n"
        body_parts.join
      end
    end
  end
end
