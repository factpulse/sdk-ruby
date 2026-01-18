# frozen_string_literal: true
#
# FactPulse SDK - Thin HTTP wrapper with auto-polling.
#
# Usage:
#   client = FactPulseClient.new('email', 'password', 'client_uid')
#
#   # POST /api/v1/processing/invoices/submit-complete-async
#   result = client.post('processing/invoices/submit-complete-async',
#     invoiceData: {...},
#     destination: { type: 'afnor' }
#   )
#   pdf_bytes = result['content'] # auto-decoded, auto-polled

require 'net/http'
require 'json'
require 'base64'
require 'uri'

module FactPulse
  class Error < StandardError
    attr_reader :status_code, :details

    def initialize(message, status_code: nil, details: [])
      super(message)
      @status_code = status_code
      @details = details
    end
  end

  class Client
    DEFAULT_API_URL = 'https://factpulse.fr'

    def initialize(email, password, client_uid, api_url: DEFAULT_API_URL, timeout: 60, polling_timeout: 120)
      @email = email
      @password = password
      @client_uid = client_uid
      @api_url = api_url.chomp('/')
      @timeout = timeout
      @polling_timeout = polling_timeout
      @token = nil
      @token_expires_at = 0
      @token_mutex = Mutex.new
    end

    # POST request to /api/v1/{path}
    def post(path, **data)
      request('POST', path, data, retry_auth: true)
    end

    # GET request to /api/v1/{path}
    def get(path, **params)
      request('GET', path, params, retry_auth: true)
    end

    private

    def request(method, path, data, retry_auth:)
      ensure_auth
      url = "#{@api_url}/api/v1/#{path}"
      uri = URI(url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.read_timeout = @timeout

      if method == 'POST'
        req = Net::HTTP::Post.new(uri)
        req['Content-Type'] = 'application/json'
        req.body = JSON.generate(data)
      else
        uri.query = URI.encode_www_form(data) unless data.empty?
        req = Net::HTTP::Get.new(uri)
      end
      req['Authorization'] = "Bearer #{@token}"

      response = http.request(req)

      if response.code == '401' && retry_auth
        invalidate_token
        return request(method, path, data, retry_auth: false)
      end

      result = parse_response(response)

      # Auto-poll: support both taskId (camelCase) and task_id (snake_case)
      if result.is_a?(Hash)
        task_id = result['taskId'] || result['task_id']
        result = poll(task_id) if task_id
      end

      # Auto-decode: support both content_b64 and contentB64
      if result.is_a?(Hash)
        b64_content = result.delete('content_b64') || result.delete('contentB64')
        result['content'] = Base64.decode64(b64_content) if b64_content
      end

      result
    end

    def parse_response(response)
      body = response.body
      data = body && !body.empty? ? JSON.parse(body) : {}

      return data if response.is_a?(Net::HTTPSuccess)

      msg = "HTTP #{response.code}"
      details = []

      if data.is_a?(Hash)
        if data['detail'].is_a?(Array)
          details = data['detail']
          msgs = data['detail'].map do |e|
            loc = e['loc'] || []
            "#{loc.last || '?'}: #{e['msg'] || '?'}"
          end
          msg = "Validation error: #{msgs.join('; ')}"
        elsif data['detail'].is_a?(String)
          msg = data['detail']
        elsif data['errorMessage'].is_a?(String)
          msg = data['errorMessage']
        end
      end

      raise Error.new(msg, status_code: response.code.to_i, details: details)
    end

    def poll(task_id)
      start = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      interval = 1.0

      loop do
        elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC) - start
        if elapsed >= @polling_timeout
          raise Error.new("Polling timeout after #{@polling_timeout}s for task #{task_id}")
        end

        ensure_auth
        uri = URI("#{@api_url}/api/v1/processing/tasks/#{task_id}/status")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.read_timeout = @timeout

        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{@token}"
        response = http.request(req)

        if response.code == '401'
          invalidate_token
          next
        end

        data = parse_response(response)
        status = data['status']

        if status == 'SUCCESS'
          result = data['result'] || {}
          # Support both content_b64 and contentB64
          b64_content = result.delete('content_b64') || result.delete('contentB64')
          result['content'] = Base64.decode64(b64_content) if b64_content
          return result
        end

        if status == 'FAILURE'
          res = data['result'] || {}
          raise Error.new(res['errorMessage'] || 'Task failed', details: res['details'] || [])
        end

        sleep([interval, @polling_timeout - elapsed].min)
        interval = [interval * 1.5, 10].min
      end
    end

    def ensure_auth
      @token_mutex.synchronize do
        if Process.clock_gettime(Process::CLOCK_MONOTONIC) >= @token_expires_at
          refresh_token
        end
      end
    end

    def refresh_token
      uri = URI("#{@api_url}/api/token/")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.read_timeout = @timeout

      req = Net::HTTP::Post.new(uri)
      req['Content-Type'] = 'application/json'
      req.body = JSON.generate(username: @email, password: @password, client_uid: @client_uid)

      response = http.request(req)

      unless response.is_a?(Net::HTTPSuccess)
        raise Error.new("Authentication failed: HTTP #{response.code}", status_code: response.code.to_i)
      end

      data = JSON.parse(response.body)
      @token = data['access'] || raise(Error.new('Invalid auth response'))
      @token_expires_at = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 28 * 60
    end

    def invalidate_token
      @token_mutex.synchronize do
        @token_expires_at = 0
      end
    end
  end
end
