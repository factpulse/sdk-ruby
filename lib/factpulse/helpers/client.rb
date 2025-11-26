# frozen_string_literal: true
require 'net/http'
require 'json'
require 'base64'
require 'uri'
require 'securerandom'

module FactPulse
  module Helpers
    class FactPulseClient
      def initialize(email:, password:, api_url: nil, client_uid: nil, polling_interval: nil, polling_timeout: nil, max_retries: nil)
        @email, @password = email, password
        @api_url = (api_url || 'https://factpulse.fr').chomp('/')
        @client_uid, @polling_interval, @polling_timeout, @max_retries = client_uid, polling_interval || 2000, polling_timeout || 120000, max_retries || 1
        @access_token = @refresh_token = @token_expires_at = nil
      end

      def ensure_authenticated(force_refresh: false)
        now = (Time.now.to_f * 1000).to_i
        if force_refresh || @access_token.nil? || (@token_expires_at && now >= @token_expires_at)
          tokens = obtain_token
          @access_token, @refresh_token = tokens['access'], tokens['refresh']
          @token_expires_at = now + (28 * 60 * 1000)
        end
      end

      def reset_auth; @access_token = @refresh_token = @token_expires_at = nil; end

      def poll_task(task_id, timeout: nil, interval: nil)
        timeout_ms, interval_ms = timeout || @polling_timeout, interval || @polling_interval
        start_time, current_interval = (Time.now.to_f * 1000).to_i, interval_ms.to_f
        loop do
          raise FactPulsePollingTimeout.new(task_id, timeout_ms) if (Time.now.to_f * 1000).to_i - start_time > timeout_ms
          ensure_authenticated
          response = http_get(URI("#{@api_url}/api/facturation/v1/traitement/taches/#{task_id}/statut"))
          reset_auth and next if response.code == '401'
          data = JSON.parse(response.body)
          return data['resultat'] || {} if data['statut'] == 'SUCCESS'
          if data['statut'] == 'FAILURE'
            r = data['resultat'] || {}
            raise FactPulseValidationError.new("La tâche #{task_id} a échoué: #{r['message_erreur'] || 'Erreur inconnue'}",
              (r['erreurs'] || []).map { |e| ValidationErrorDetail.from_hash(e) })
          end
          sleep(current_interval / 1000.0)
          current_interval = [current_interval * 1.5, 10000].min
        end
      end

      def generer_facturx(facture_data, pdf_path, profil: 'EN16931', format_sortie: 'pdf', sync: true, timeout: nil)
        json_data = facture_data.is_a?(String) ? facture_data : JSON.generate(facture_data)
        task_id = nil
        (@max_retries + 1).times do |attempt|
          ensure_authenticated
          boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
          body = "--#{boundary}\r\nContent-Disposition: form-data; name=\"donnees_facture\"\r\n\r\n#{json_data}\r\n" +
                 "--#{boundary}\r\nContent-Disposition: form-data; name=\"profil\"\r\n\r\n#{profil}\r\n" +
                 "--#{boundary}\r\nContent-Disposition: form-data; name=\"format_sortie\"\r\n\r\n#{format_sortie}\r\n" +
                 "--#{boundary}\r\nContent-Disposition: form-data; name=\"source_pdf\"; filename=\"#{File.basename(pdf_path)}\"\r\n" +
                 "Content-Type: application/pdf\r\n\r\n#{File.binread(pdf_path)}\r\n--#{boundary}--\r\n"
          uri = URI("#{@api_url}/api/facturation/v1/traitement/generer-facture")
          http = Net::HTTP.new(uri.host, uri.port).tap { |h| h.use_ssl = uri.scheme == 'https'; h.read_timeout = 60 }
          request = Net::HTTP::Post.new(uri).tap { |r| r['Authorization'] = "Bearer #{@access_token}"; r['Content-Type'] = "multipart/form-data; boundary=#{boundary}"; r.body = body }
          response = http.request(request)
          reset_auth and next if response.code == '401' && attempt < @max_retries
          raise FactPulseValidationError.new("Erreur API: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
          task_id = JSON.parse(response.body)['id_tache']
          break
        end
        raise FactPulseValidationError.new("Pas d'ID de tâche") unless task_id
        return task_id unless sync
        result = poll_task(task_id, timeout: timeout)
        return Base64.decode64(result['contenu_b64']) if result['contenu_b64']
        raise FactPulseValidationError.new('Pas de contenu')
      end

      def self.format_montant(m); m.nil? ? '0.00' : (m.is_a?(Numeric) ? format('%.2f', m) : (m.is_a?(String) ? m : '0.00')); end

      private
      def obtain_token
        payload = { 'username' => @email, 'password' => @password }
        payload['client_uid'] = @client_uid if @client_uid
        response = http_post(URI("#{@api_url}/api/token/"), payload)
        raise FactPulseAuthError, "Impossible d'obtenir le token JWT" unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body)
      end

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
