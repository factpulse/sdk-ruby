# frozen_string_literal: true
require 'net/http'; require 'json'; require 'base64'; require 'uri'; require 'securerandom'

module FactPulse
  module Helpers
    class FactPulseClient
      def initialize(email:, password:, api_url: nil, client_uid: nil, polling_interval: nil, polling_timeout: nil, max_retries: nil)
        @email, @password = email, password; @api_url = (api_url || 'https://factpulse.fr').chomp('/')
        @client_uid, @polling_interval, @polling_timeout, @max_retries = client_uid, polling_interval || 2000, polling_timeout || 120000, max_retries || 1
        @access_token = @refresh_token = @token_expires_at = nil
      end

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
          ensure_authenticated; response = http_get(URI("#{@api_url}/api/facturation/v1/traitement/taches/#{task_id}/statut"))
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

      def self.format_montant(m); m.nil? ? '0.00' : (m.is_a?(Numeric) ? format('%.2f', m) : (m.is_a?(String) ? m : '0.00')); end

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
