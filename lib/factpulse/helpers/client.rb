# frozen_string_literal: true
require 'net/http'; require 'json'; require 'base64'; require 'uri'; require 'securerandom'; require 'digest'; require 'tempfile'

module FactPulse
  module Helpers
    # Chorus Pro credentials for Zero-Trust mode.
    # These credentials are passed in each request and are never stored server-side.
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

    # AFNOR PDP credentials for Zero-Trust mode.
    # The FactPulse API uses these credentials to authenticate with the AFNOR PDP.
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

    # Helpers for creating simplified total amounts.
    module AmountHelpers
      def self.amount(value)
        return '0.00' if value.nil?
        return format('%.2f', value) if value.is_a?(Numeric)
        value.is_a?(String) ? value : '0.00'
      end

      def self.invoice_totals(excl_tax, vat, incl_tax, amount_due, discount_incl_tax: nil, discount_reason: nil, prepayment: nil)
        result = {
          'totalExclTax' => amount(excl_tax), 'vatAmount' => amount(vat),
          'totalInclTax' => amount(incl_tax), 'amountDue' => amount(amount_due)
        }
        result['globalDiscountInclTax'] = amount(discount_incl_tax) if discount_incl_tax
        result['globalDiscountReason'] = discount_reason if discount_reason
        result['prepayment'] = amount(prepayment) if prepayment
        result
      end

      # Creates an invoice line (aligned with InvoiceLine in models.py).
      def self.invoice_line(number, description, quantity, unit_price_excl_tax, line_total_excl_tax,
                            vat_rate: '20.00', vat_category: 'S', unit: 'LUMP_SUM', **options)
        result = {
          'number' => number, 'description' => description,
          'quantity' => amount(quantity), 'unitPriceExclTax' => amount(unit_price_excl_tax),
          'lineTotalExclTax' => amount(line_total_excl_tax), 'vatRateManual' => amount(vat_rate),
          'vatCategory' => vat_category, 'unit' => unit
        }
        result['reference'] = options[:reference] if options[:reference]
        result['discountExclTax'] = amount(options[:discount_excl_tax]) if options[:discount_excl_tax]
        result['discountReasonCode'] = options[:discount_reason_code] if options[:discount_reason_code]
        result['discountReason'] = options[:discount_reason] if options[:discount_reason]
        result['periodStartDate'] = options[:period_start_date] if options[:period_start_date]
        result['periodEndDate'] = options[:period_end_date] if options[:period_end_date]
        result
      end

      # Creates a VAT line (aligned with VatLine in models.py).
      def self.vat_line(rate_manual, base_amount_excl_tax, vat_amount, category: 'S')
        {
          'rateManual' => amount(rate_manual), 'baseAmountExclTax' => amount(base_amount_excl_tax),
          'vatAmount' => amount(vat_amount), 'category' => category
        }
      end

      # Creates a postal address for the FactPulse API.
      def self.postal_address(line1, postal_code, city, country: 'FR', line2: nil, line3: nil)
        result = { 'line1' => line1, 'postalCode' => postal_code, 'city' => city, 'countryCode' => country }
        result['line2'] = line2 if line2
        result['line3'] = line3 if line3
        result
      end

      # Creates an electronic address. scheme_id: "0009"=SIREN, "0225"=SIRET
      def self.electronic_address(identifier, scheme_id: '0009')
        { 'identifier' => identifier, 'schemeId' => scheme_id }
      end

      # Computes the French intra-community VAT number from a SIREN.
      def self.compute_vat_intra(siren)
        return nil if siren.nil? || siren.length != 9 || !siren.match?(/^\d+$/)
        cle = (12 + 3 * (siren.to_i % 97)) % 97
        format('FR%02d%s', cle, siren)
      end

      # Creates a supplier (issuer) with auto-computed SIREN, intra-EU VAT number and addresses.
      def self.supplier(name, siret, address_line1, postal_code, city, **options)
        siren = options[:siren] || (siret.length == 14 ? siret[0, 9] : nil)
        vat_intra = options[:vat_intra] || (siren ? compute_vat_intra(siren) : nil)
        result = {
          'name' => name, 'supplierId' => options[:supplier_id] || 0, 'siret' => siret,
          'electronicAddress' => electronic_address(siret, scheme_id: '0225'),
          'postalAddress' => postal_address(address_line1, postal_code, city, country: options[:country] || 'FR', line2: options[:address_line2])
        }
        result['siren'] = siren if siren
        result['vatIntra'] = vat_intra if vat_intra
        result['iban'] = options[:iban] if options[:iban]
        result['supplierServiceId'] = options[:service_code] if options[:service_code]
        result['supplierBankCoordinatesCode'] = options[:bank_coordinates_code] if options[:bank_coordinates_code]
        result
      end

      # Creates a recipient (customer) with auto-computed SIREN and addresses.
      def self.recipient(name, siret, address_line1, postal_code, city, **options)
        siren = options[:siren] || (siret.length == 14 ? siret[0, 9] : nil)
        result = {
          'name' => name, 'siret' => siret,
          'electronicAddress' => electronic_address(siret, scheme_id: '0225'),
          'postalAddress' => postal_address(address_line1, postal_code, city, country: options[:country] || 'FR', line2: options[:address_line2])
        }
        result['siren'] = siren if siren
        result['executingServiceCode'] = options[:executing_service_code] if options[:executing_service_code]
        result
      end

      # Creates a beneficiary (factor) for factoring.
      #
      # The beneficiary (BG-10 / PayeeTradeParty) is used when payment
      # must be made to a third party different from the supplier, typically
      # a factor (factoring company).
      #
      # For factored invoices, you also need to:
      # - Use a factored document type (393, 396, 501, 502, 472, 473)
      # - Add an ACC note with the subrogation mention
      # - The beneficiary's IBAN will be used for payment
      #
      # @param name [String] Factor's business name (BT-59)
      # @param options [Hash] Options: :siret (BT-60), :siren (BT-61), :iban, :bic
      # @return [Hash] Dict ready to be used in a factored invoice
      #
      # @example
      #   factor = beneficiary('FACTOR SAS',
      #     siret: '30000000700033',
      #     iban: 'FR76 3000 4000 0500 0012 3456 789'
      #   )
      def self.beneficiary(name, **options)
        # Auto-compute SIREN from SIRET
        siret = options[:siret]
        siren = options[:siren] || (siret && siret.length == 14 ? siret[0, 9] : nil)

        result = { 'name' => name }
        result['siret'] = siret if siret
        result['siren'] = siren if siren
        result['iban'] = options[:iban] if options[:iban]
        result['bic'] = options[:bic] if options[:bic]
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
      # Shorter aliases
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
          ensure_authenticated; response = http_get(URI("#{@api_url}/api/v1/processing/tasks/#{task_id}/status"))
          reset_auth and next if response.code == '401'
          data = JSON.parse(response.body)
          return data['resultat'] || {} if data['statut'] == 'SUCCESS'
          if data['statut'] == 'FAILURE'
            # Format AFNOR: errorMessage, details
            r = data['resultat'] || {}
            raise FactPulseValidationError.new("Task #{task_id} failed: #{r['errorMessage'] || '?'}", (r['details'] || []).map { |e| ValidationErrorDetail.from_hash(e) })
          end
          sleep(current_interval / 1000.0); current_interval = [current_interval * 1.5, 10000].min
        end
      end

      def self.format_amount(m); AmountHelpers.amount(m); end

      # Generates a Factur-X invoice from a dict/hash and a source PDF.
      def generate_facturx(invoice_data, pdf_source, profile: 'EN16931', output_format: 'pdf', sync: true, timeout: nil)
        # Convert data to JSON string
        json_data = case invoice_data
                    when String then invoice_data
                    when Hash then JSON.generate(invoice_data)
                    else
                      if invoice_data.respond_to?(:to_h)
                        JSON.generate(invoice_data.to_h)
                      elsif invoice_data.respond_to?(:to_hash)
                        JSON.generate(invoice_data.to_hash)
                      else
                        raise FactPulseValidationError.new("Unsupported data type: #{invoice_data.class}")
                      end
                    end

        # Read source PDF
        pdf_content = case pdf_source
                      when String then File.binread(pdf_source)
                      when File then pdf_source.read
                      else
                        if pdf_source.respond_to?(:read)
                          pdf_source.read
                        else
                          raise FactPulseValidationError.new("Unsupported PDF type: #{pdf_source.class}")
                        end
                      end
        pdf_filename = pdf_source.is_a?(String) ? File.basename(pdf_source) : 'invoice.pdf'

        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/processing/generate-invoice")

        # Build multipart request
        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, [
          { name: 'invoice_data', content: json_data },
          { name: 'profile', content: profile },
          { name: 'output_format', content: output_format },
          { name: 'source_pdf', content: pdf_content, filename: pdf_filename, content_type: 'application/pdf' }
        ])

        response = http_multipart_post(uri, body, boundary)

        if response.code == '401'
          reset_auth; ensure_authenticated; response = http_multipart_post(uri, body, boundary)
        end

        unless response.is_a?(Net::HTTPSuccess)
          # Extract error details from response body
          error_msg = "API Error (#{response.code})"
          errors = []

          begin
            error_data = JSON.parse(response.body)
            # Format FastAPI/Pydantic: {"detail": [{"loc": [...], "msg": "...", "type": "..."}]}
            if error_data['detail'].is_a?(Array)
              error_msg = 'Validation error'
              error_data['detail'].each do |err|
                next unless err.is_a?(Hash)
                loc = (err['loc'] || []).map(&:to_s).join(' -> ')
                errors << ValidationErrorDetail.new(
                  level: 'ERROR',
                  item: loc,
                  reason: err['msg'] || err.to_s,
                  source: 'validation',
                  code: err['type']
                )
              end
            elsif error_data['detail'].is_a?(String)
              error_msg = error_data['detail']
            elsif error_data['errorMessage']
              error_msg = error_data['errorMessage']
            end
          rescue JSON::ParserError
            error_msg = "API Error (#{response.code}): #{response.body}"
          end

          warn "API Error #{response.code}: #{response.body}"
          raise FactPulseValidationError.new(error_msg, errors)
        end

        data = JSON.parse(response.body)

        if sync && data['taskId']
          result = poll_task(data['taskId'], timeout: timeout)
          if result['contenu_b64']
            return Base64.decode64(result['contenu_b64'])
          elsif result['contenu_xml']
            return result['contenu_xml']
          end
          raise FactPulseValidationError.new("Unexpected result: #{result.keys.join(', ')}")
        end

        data
      end

      # =========================================================================
      # AFNOR PDP - Authentication and internal helpers
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

      # Submits an invoice to a PDP via the AFNOR API.
      def submit_invoice_afnor(pdf_path, flow_name, **options)
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

      # Searches for AFNOR invoicing flows.
      def search_flows_afnor(**criteria)
        search_body = {
          'offset' => criteria[:offset] || 0,
          'limit' => criteria[:limit] || 25,
          'where' => {}
        }
        search_body['where']['trackingId'] = criteria[:tracking_id] if criteria[:tracking_id]
        search_body['where']['status'] = criteria[:status] if criteria[:status]

        make_afnor_request('POST', '/flow/v1/flows/search', json_data: search_body)
      end

      # Downloads the PDF file of an AFNOR flow.
      def download_flow_afnor(flow_id)
        result = make_afnor_request('GET', "/flow/v1/flows/#{flow_id}")
        result['_raw'] || ''
      end

      # Retrieves JSON metadata of an incoming flow (supplier invoice).
      # Downloads an incoming flow from the AFNOR PDP and extracts invoice
      # metadata into a unified JSON format. Supports Factur-X, CII and UBL.
      #
      # Note: This endpoint uses FactPulse JWT authentication (not AFNOR OAuth).
      # The FactPulse server handles calling the PDP with stored credentials.
      #
      # @param flow_id [String] Flow identifier (UUID)
      # @param include_document [Boolean] If true, includes the document in base64
      # @return [Hash] Invoice metadata (supplier, amounts, dates, etc.)
      #
      # @example
      #   invoice = client.get_incoming_invoice_afnor("550e8400-...")
      #   puts "Supplier: #{invoice['supplier']['name']}"
      #   puts "Total incl. tax: #{invoice['total_incl_tax']} #{invoice['currency']}"
      def get_incoming_invoice_afnor(flow_id, include_document: false)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/afnor/incoming-flows/#{flow_id}")
        uri.query = "include_document=true" if include_document

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = uri.scheme == 'https'
        http.read_timeout = 60

        request = Net::HTTP::Get.new(uri)
        request['Authorization'] = "Bearer #{@access_token}"

        response = http.request(request)
        raise FactPulseValidationError.new("Incoming flow error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # Checks the availability of the AFNOR Flow Service.
      def healthcheck_afnor
        make_afnor_request('GET', '/flow/v1/healthcheck')
      end

      # ==================== AFNOR Directory ====================

      # Gets a company (legal unit) by SIRET in the AFNOR directory.
      # @param siret [String] 14-digit SIRET number
      # @return [Hash] Company information
      def get_siret_afnor(siret)
        make_afnor_request('GET', "/directory/v1/siret/code-insee:#{siret}")
      end

      # Gets a company (legal unit) by SIREN in the AFNOR directory.
      # @param siren [String] 9-digit SIREN number
      # @return [Hash] Company information
      def get_siren_afnor(siren)
        make_afnor_request('GET', "/directory/v1/siren/code-insee:#{siren}")
      end

      # Searches for SIRENs (legal units) in the AFNOR directory.
      # @param criteria [Hash] Search criteria (filters, sorting, fields, limit)
      # @return [Hash] Search results
      def search_siren_afnor(**criteria)
        search_body = {
          'limit' => criteria[:limit] || 25,
          'filters' => criteria[:filters] || {}
        }
        make_afnor_request('POST', '/directory/v1/siren/search', json_data: search_body)
      end

      # Searches for routing codes in the AFNOR directory.
      # @param criteria [Hash] Search criteria (filters, sorting, fields, limit)
      # @return [Hash] Search results with routing codes
      def search_routing_codes_afnor(**criteria)
        search_body = {
          'limit' => criteria[:limit] || 25,
          'filters' => criteria[:filters] || {}
        }
        make_afnor_request('POST', '/directory/v1/routing-code/search', json_data: search_body)
      end

      # Gets a routing code by SIRET and routing identifier.
      # @param siret [String] 14-digit SIRET number
      # @param routing_identifier [String] Routing code identifier
      # @return [Hash] Routing code information
      def get_routing_code_afnor(siret, routing_identifier)
        make_afnor_request('GET', "/directory/v1/routing-code/siret:#{siret}/code:#{routing_identifier}")
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

      # Searches for structures on Chorus Pro.
      def rechercher_structure_chorus(identifiant_structure: nil, raison_sociale: nil, type_identifiant: 'SIRET', restreindre_privees: true)
        body = { 'restreindre_structures_privees' => restreindre_privees }
        body['identifiant_structure'] = identifiant_structure if identifiant_structure
        body['raison_sociale_structure'] = raison_sociale if raison_sociale
        body['type_identifiant_structure'] = type_identifiant if type_identifiant

        make_chorus_request('POST', '/structures/rechercher', body)
      end

      # Gets the details of a Chorus Pro structure.
      def consulter_structure_chorus(id_structure_cpp)
        make_chorus_request('POST', '/structures/consulter', { 'id_structure_cpp' => id_structure_cpp })
      end

      # Gets the Chorus Pro ID of a structure from its SIRET.
      def obtenir_id_chorus_depuis_siret(siret, type_identifiant: 'SIRET')
        make_chorus_request('POST', '/structures/obtenir-id-depuis-siret', { 'siret' => siret, 'type_identifiant' => type_identifiant })
      end

      # Lists the services of a Chorus Pro structure.
      def lister_services_structure_chorus(id_structure_cpp)
        make_chorus_request('GET', "/structures/#{id_structure_cpp}/services")
      end

      # Submits an invoice to Chorus Pro.
      def soumettre_facture_chorus(facture_data)
        make_chorus_request('POST', '/factures/soumettre', facture_data)
      end

      # Gets the status of a Chorus Pro invoice.
      def consulter_facture_chorus(identifiant_facture_cpp)
        make_chorus_request('POST', '/factures/consulter', { 'identifiant_facture_cpp' => identifiant_facture_cpp })
      end

      # =========================================================================
      # Validation
      # =========================================================================

      # Validates a Factur-X PDF.
      # @param pdf_path [String] Path to the PDF file
      # @param profile [String, nil] Factur-X profile (MINIMUM, BASIC, EN16931, EXTENDED). If nil, auto-detected.
      # @param use_verapdf [Boolean] Enable strict PDF/A validation with VeraPDF (default: false)
      def validate_facturx_pdf(pdf_path, profile: nil, use_verapdf: false)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/processing/validate-facturx-pdf")
        pdf_content = File.binread(pdf_path)

        parts = [
          { name: 'pdf_file', content: pdf_content, filename: File.basename(pdf_path), content_type: 'application/pdf' },
          { name: 'use_verapdf', content: use_verapdf.to_s }
        ]
        parts << { name: 'profile', content: profile } if profile

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, parts)

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Validation error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # Validates a Factur-X XML.
      def validate_facturx_xml(xml_content, profile: 'EN16931')
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/processing/validate-xml")

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, [
          { name: 'xml_file', content: xml_content, filename: 'invoice.xml', content_type: 'application/xml' },
          { name: 'profile', content: profile }
        ])

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Validation error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # Validates the signature of a signed PDF.
      def validate_pdf_signature(pdf_path)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/processing/validate-pdf-signature")
        pdf_content = File.binread(pdf_path)

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, [
          { name: 'pdf_file', content: pdf_content, filename: File.basename(pdf_path), content_type: 'application/pdf' }
        ])

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Validation error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # =========================================================================
      # Signature
      # =========================================================================

      # Signs a PDF with the server-configured certificate.
      def sign_pdf(pdf_path, **options)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/processing/sign-pdf")
        pdf_content = File.binread(pdf_path)

        parts = [
          { name: 'pdf_file', content: pdf_content, filename: File.basename(pdf_path), content_type: 'application/pdf' },
          { name: 'use_pades_lt', content: (options[:use_pades_lt] ? 'true' : 'false') },
          { name: 'use_timestamp', content: (options.key?(:use_timestamp) ? (options[:use_timestamp] ? 'true' : 'false') : 'true') }
        ]
        parts << { name: 'reason', content: options[:reason] } if options[:reason]
        parts << { name: 'location', content: options[:location] } if options[:location]
        parts << { name: 'contact', content: options[:contact] } if options[:contact]

        boundary = "----RubyFormBoundary#{SecureRandom.hex(16)}"
        body = build_multipart_body(boundary, parts)

        response = http_multipart_post(uri, body, boundary)
        raise FactPulseValidationError.new("Signature error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)

        result = JSON.parse(response.body) rescue {}
        raise FactPulseValidationError.new("Invalid signature response") unless result['pdf_signe_base64']
        Base64.decode64(result['pdf_signe_base64'])
      end

      # Generates a test certificate (NOT FOR PRODUCTION).
      def generate_test_certificate(**options)
        ensure_authenticated
        uri = URI("#{@api_url}/api/v1/processing/generate-test-certificate")
        body = {
          'cn' => options[:cn] || 'Test Organisation',
          'organisation' => options[:organisation] || 'Test Organisation',
          'email' => options[:email] || 'test@example.com',
          'validity_days' => options[:validity_days] || 365,
          'key_size' => options[:key_size] || 2048
        }

        response = http_post_json(uri, body)
        raise FactPulseValidationError.new("Error: #{response.code}") unless response.is_a?(Net::HTTPSuccess)
        JSON.parse(response.body) rescue {}
      end

      # =========================================================================
      # Workflow complet
      # =========================================================================

      # Generates a complete Factur-X PDF with optional validation, signature and submission.
      def generate_complete_facturx(invoice, pdf_source_path, **options)
        profile = options[:profile] || 'EN16931'
        validate = options.fetch(:validate, true)
        sign = options.fetch(:sign, false)
        submit_afnor = options.fetch(:submit_afnor, false)
        timeout = options[:timeout] || 120000

        result = {}

        # 1. Generation
        pdf_bytes = generate_facturx(invoice, pdf_source_path, profile: profile, output_format: 'pdf', sync: true, timeout: timeout)
        result[:pdf_bytes] = pdf_bytes

        # Create a temporary file for subsequent operations
        temp_file = Tempfile.new(['facturx_', '.pdf'])
        begin
          temp_file.binmode
          temp_file.write(pdf_bytes)
          temp_file.flush

          # 2. Validation
          if validate
            validation = validate_facturx_pdf(temp_file.path, profile: profile)
            result[:validation] = validation
            unless validation['is_compliant']
              if options[:output_path]
                File.binwrite(options[:output_path], pdf_bytes)
                result[:pdf_path] = options[:output_path]
              end
              return result
            end
          end

          # 3. Signature
          if sign
            pdf_bytes = sign_pdf(temp_file.path, **options)
            result[:pdf_bytes] = pdf_bytes
            result[:signature] = { 'signed' => true }
            temp_file.rewind
            temp_file.write(pdf_bytes)
            temp_file.flush
          end

          # 4. AFNOR submission
          if submit_afnor
            invoice_number = invoice['invoiceNumber'] || invoice['invoice_number'] || 'INVOICE'
            flow_name = options[:afnor_flow_name] || "Invoice #{invoice_number}"
            tracking_id = options[:afnor_tracking_id] || invoice_number
            afnor_result = submit_invoice_afnor(temp_file.path, flow_name, tracking_id: tracking_id)
            result[:afnor] = afnor_result
          end

          # Final save
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
