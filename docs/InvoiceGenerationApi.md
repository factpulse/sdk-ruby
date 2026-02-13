# FactPulse::InvoiceGenerationApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**generate_invoice_api_v1_processing_generate_invoice_post**](InvoiceGenerationApi.md#generate_invoice_api_v1_processing_generate_invoice_post) | **POST** /api/v1/processing/generate-invoice | Generate an electronic invoice (CII / UBL / Factur-X PDF) |
| [**submit_complete_invoice_api_v1_processing_invoices_submit_complete_post**](InvoiceGenerationApi.md#submit_complete_invoice_api_v1_processing_invoices_submit_complete_post) | **POST** /api/v1/processing/invoices/submit-complete | Submit a complete invoice (generation + signature + submission) |
| [**submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post**](InvoiceGenerationApi.md#submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post) | **POST** /api/v1/processing/invoices/submit-complete-async | Submit a complete invoice (asynchronous with Celery) |


## generate_invoice_api_v1_processing_generate_invoice_post

> <TaskResponse> generate_invoice_api_v1_processing_generate_invoice_post(invoice_data, opts)

Generate an electronic invoice (CII / UBL / Factur-X PDF)

Generates an electronic invoice compliant with European standards.  Supports **two XML syntaxes** defined by EN 16931: - **CII** (Cross-Industry Invoice, UN/CEFACT) — the Factur-X / ZUGFeRD syntax - **UBL 2.1** (Universal Business Language, OASIS) — the Peppol BIS Billing syntax  ## Applied Standards  - **EN 16931**: European semantic standard for electronic invoicing - **Factur-X / ZUGFeRD** (CII syntax): Franco-German standard - **UBL 2.1** (OASIS): International standard, used by Peppol - **ISO 19005-3** (PDF/A-3): Long-term electronic archiving (PDF output only) - **Schematron**: Business rules validation (EN16931-CII, EN16931-UBL, BR-FR)  ## 🆕 New: Simplified format with auto-enrichment (P0.1)  You can now create an invoice by providing only: - An invoice number - A supplier SIRET + **IBAN** (required) - A recipient SIRET - Invoice lines (description, quantity, net price)  **Simplified format example**: ```json {   \"number\": \"FACT-2025-001\",   \"supplier\": {     \"siret\": \"92019522900017\",     \"iban\": \"FR7630001007941234567890185\"   },   \"recipient\": {\"siret\": \"35600000000048\"},   \"lines\": [     {\"description\": \"Service\", \"quantity\": 10, \"unitPrice\": 100.00, \"vatRate\": 20.0}   ] } ```  **⚠️ Required fields (simplified format)**: - `number`: Unique invoice number - `supplier.siret`: Supplier's SIRET (14 digits) - `supplier.iban`: Bank account IBAN (no public API to retrieve it) - `recipient.siret`: Recipient's SIRET - `lines[]`: At least one invoice line  **What happens automatically with `auto_enrich=True`**: - ✅ Name enrichment from Chorus Pro API - ✅ Address enrichment from Business Search API (free, public) - ✅ Automatic intra-EU VAT calculation (FR + key + SIREN) - ✅ Chorus Pro ID retrieval for electronic invoicing - ✅ Net/VAT/Gross totals calculation - ✅ Date generation (today + 30-day due date) - ✅ Multi-rate VAT handling  **Supported identifiers**: - SIRET (14 digits): Specific establishment ⭐ Recommended - SIREN (9 digits): Company (auto-selection of headquarters) - Special types: UE_HORS_FRANCE, RIDET, TAHITI, etc.  ## Checks performed during generation  ### 1. Data validation (Pydantic) - Data types (amounts as Decimal, ISO 8601 dates) - Formats (14-digit SIRET, 9-digit SIREN, IBAN) - Required fields per profile - Amount consistency (Net + VAT = Gross)  ### 2. CII-compliant XML generation - Serialization according to Cross Industry Invoice XSD schema - Correct UN/CEFACT namespaces - Hierarchical structure respected - UTF-8 encoding without BOM  ### 3. Schematron validation - Business rules for selected profile (MINIMUM, BASIC, EN16931, EXTENDED) - Element cardinality (required, optional, repeatable) - Calculation rules (totals, VAT, discounts) - European EN 16931 compliance  ### 4. PDF/A-3 conversion (if output_format='pdf') - Source PDF conversion to PDF/A-3 via Ghostscript - Factur-X XML embedding in PDF - Compliant XMP metadata - ICC sRGB color profile - Removal of forbidden elements (JavaScript, forms)  ## How it works  1. **Submission**: Invoice is queued in Celery for asynchronous processing 2. **Immediate return**: You receive a `task_id` (HTTP 202 Accepted) 3. **Tracking**: Use the `/tasks/{task_id}/status` endpoint to track progress  ## Webhook notification (recommended)  Instead of polling, you can receive a webhook notification when the task completes:  ``` callback_url=https://your-server.com/webhook ```  The webhook will POST a JSON payload with: - `event_type`: `generation.completed` or `generation.failed` - `data.task_id`: The Celery task ID - `data.content_b64` or `data.xml_content`: The generated content - `X-Webhook-Signature` header for HMAC verification  See `/docs/WEBHOOKS.md` for full documentation.  ## Output formats  - **xml** / **cii**: CII XML (Factur-X syntax, UN/CEFACT) - **ubl**: UBL 2.1 XML (OASIS, Peppol BIS Billing 3.0) - **pdf**: Factur-X PDF/A-3 with embedded CII XML (requires `source_pdf`)  ## Factur-X profiles (CII only)  - **MINIMUM**: Minimal data (simplified invoice) - **BASIC**: Basic information (SMEs) - **EN16931**: European standard (recommended, compliant with directive 2014/55/EU) - **EXTENDED**: All available data (large accounts)  When `output_format=ubl`, the profile parameter is ignored (UBL always uses EN16931).  ## What you get  After successful processing (status `completed`): - **XML only**: Base64-encoded Factur-X compliant XML file - **PDF/A-3**: PDF with embedded XML, ready for sending/archiving - **Metadata**: Profile, Factur-X version, file size - **Validation**: Schematron compliance confirmation  ## Validation  Data is automatically validated according to detected format. On error, a 422 status is returned with invalid field details.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::InvoiceGenerationApi.new
invoice_data = 'invoice_data_example' # String | Invoice data in JSON format.              Two formats accepted:             1. **Classic format**: Complete FacturXInvoice structure (all fields)             2. **Simplified format** (🆕 P0.1): Minimal structure with auto-enrichment              Format is detected automatically!             
opts = {
  profile: FactPulse::APIProfile::MINIMUM, # APIProfile | Factur-X/CII profile: MINIMUM, BASIC, EN16931 or EXTENDED. Ignored when output_format='ubl' (always EN16931).
  output_format: FactPulse::OutputFormat::XML, # OutputFormat | Output format: 'xml' or 'cii' (CII/Factur-X XML), 'ubl' (UBL 2.1 XML), 'pdf' (Factur-X PDF/A-3).
  auto_enrich: true, # Boolean | 🆕 Enable auto-enrichment from SIRET/SIREN (simplified format only)
  source_pdf: File.new('/path/to/some/file'), # File | 
  callback_url: 'callback_url_example', # String | 
  webhook_mode: 'webhook_mode_example', # String | Webhook content delivery: 'inline' (base64 in payload) or 'download_url' (temporary URL, 1h TTL)
  skip_br_fr: true # Boolean | 
}

begin
  # Generate an electronic invoice (CII / UBL / Factur-X PDF)
  result = api_instance.generate_invoice_api_v1_processing_generate_invoice_post(invoice_data, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling InvoiceGenerationApi->generate_invoice_api_v1_processing_generate_invoice_post: #{e}"
end
```

#### Using the generate_invoice_api_v1_processing_generate_invoice_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TaskResponse>, Integer, Hash)> generate_invoice_api_v1_processing_generate_invoice_post_with_http_info(invoice_data, opts)

```ruby
begin
  # Generate an electronic invoice (CII / UBL / Factur-X PDF)
  data, status_code, headers = api_instance.generate_invoice_api_v1_processing_generate_invoice_post_with_http_info(invoice_data, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TaskResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling InvoiceGenerationApi->generate_invoice_api_v1_processing_generate_invoice_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_data** | **String** | Invoice data in JSON format.              Two formats accepted:             1. **Classic format**: Complete FacturXInvoice structure (all fields)             2. **Simplified format** (🆕 P0.1): Minimal structure with auto-enrichment              Format is detected automatically!              |  |
| **profile** | [**APIProfile**](APIProfile.md) | Factur-X/CII profile: MINIMUM, BASIC, EN16931 or EXTENDED. Ignored when output_format&#x3D;&#39;ubl&#39; (always EN16931). | [optional] |
| **output_format** | [**OutputFormat**](OutputFormat.md) | Output format: &#39;xml&#39; or &#39;cii&#39; (CII/Factur-X XML), &#39;ubl&#39; (UBL 2.1 XML), &#39;pdf&#39; (Factur-X PDF/A-3). | [optional] |
| **auto_enrich** | **Boolean** | 🆕 Enable auto-enrichment from SIRET/SIREN (simplified format only) | [optional][default to true] |
| **source_pdf** | **File** |  | [optional] |
| **callback_url** | **String** |  | [optional] |
| **webhook_mode** | **String** | Webhook content delivery: &#39;inline&#39; (base64 in payload) or &#39;download_url&#39; (temporary URL, 1h TTL) | [optional][default to &#39;inline&#39;] |
| **skip_br_fr** | **Boolean** |  | [optional] |

### Return type

[**TaskResponse**](TaskResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## submit_complete_invoice_api_v1_processing_invoices_submit_complete_post

> <SubmitCompleteInvoiceResponse> submit_complete_invoice_api_v1_processing_invoices_submit_complete_post(submit_complete_invoice_request)

Submit a complete invoice (generation + signature + submission)

Unified endpoint to submit a complete invoice to different destinations.     **Facture prête pour Flux 2** - Génère une facture Factur-X complète avec signature optionnelle et soumission vers Chorus Pro ou PDP AFNOR.      **Automated workflow:**     1. **Auto-enrichment** (optional): retrieves data via public APIs and Chorus Pro/AFNOR     2. **Factur-X PDF generation**: creates a PDF/A-3 with embedded XML     3. **Electronic signature** (optional): signs the PDF with a certificate     4. **Submission**: sends to the chosen destination (Chorus Pro or AFNOR PDP)      **Supported destinations:**     - **Chorus Pro**: French B2G platform (invoices to public sector)     - **AFNOR PDP**: Partner Dematerialization Platforms      **Destination credentials - 2 modes available:**      **Mode 1 - Retrieval via JWT (recommended):**     - Credentials are retrieved automatically via the JWT `client_uid`     - Do not provide the `credentials` field in `destination`     - Zero-trust architecture: no secrets in the payload     - Example: `\"destination\": {\"type\": \"chorus_pro\"}`      **Mode 2 - Credentials in the payload:**     - Provide credentials directly in the payload     - Useful for tests or third-party integrations     - Example: `\"destination\": {\"type\": \"chorus_pro\", \"credentials\": {...}}`       **Electronic signature (optional) - 2 modes available:**      **Mode 1 - Stored certificate (recommended):**     - Certificate is retrieved automatically via the JWT `client_uid`     - No key to provide in the payload     - PAdES-B-LT signature with timestamp (eIDAS compliant)     - Example: `\"signature\": {\"reason\": \"Factur-X compliance\"}`      **Mode 2 - Keys in the payload (for tests):**     - Provide `key_pem` and `cert_pem` directly     - PEM format accepted: raw or base64     - Useful for tests or special cases without stored certificate     - Example: `\"signature\": {\"key_pem\": \"-----BEGIN...\", \"cert_pem\": \"-----BEGIN...\"}`      If `key_pem` and `cert_pem` are provided → Mode 2     Otherwise → Mode 1 (certificate retrieved via `client_uid`)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::InvoiceGenerationApi.new
submit_complete_invoice_request = FactPulse::SubmitCompleteInvoiceRequest.new({invoice_data: FactPulse::SimplifiedInvoiceData.new({number: 'number_example', supplier: { key: 3.56}, recipient: { key: 3.56}, lines: [{ key: 3.56}]}), source_pdf: 'source_pdf_example', destination: FactPulse::AFNORDestination.new}) # SubmitCompleteInvoiceRequest | 

begin
  # Submit a complete invoice (generation + signature + submission)
  result = api_instance.submit_complete_invoice_api_v1_processing_invoices_submit_complete_post(submit_complete_invoice_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling InvoiceGenerationApi->submit_complete_invoice_api_v1_processing_invoices_submit_complete_post: #{e}"
end
```

#### Using the submit_complete_invoice_api_v1_processing_invoices_submit_complete_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitCompleteInvoiceResponse>, Integer, Hash)> submit_complete_invoice_api_v1_processing_invoices_submit_complete_post_with_http_info(submit_complete_invoice_request)

```ruby
begin
  # Submit a complete invoice (generation + signature + submission)
  data, status_code, headers = api_instance.submit_complete_invoice_api_v1_processing_invoices_submit_complete_post_with_http_info(submit_complete_invoice_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitCompleteInvoiceResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling InvoiceGenerationApi->submit_complete_invoice_api_v1_processing_invoices_submit_complete_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_complete_invoice_request** | [**SubmitCompleteInvoiceRequest**](SubmitCompleteInvoiceRequest.md) |  |  |

### Return type

[**SubmitCompleteInvoiceResponse**](SubmitCompleteInvoiceResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post

> <TaskResponse> submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post(submit_complete_invoice_request, opts)

Submit a complete invoice (asynchronous with Celery)

Asynchronous version of the `/invoices/submit-complete` endpoint using Celery for background processing.     **Facture prête pour Flux 2** - Génère une facture Factur-X complète de manière asynchrone.      **Automated workflow (same as synchronous version):**     1. **Auto-enrichment** (optional): retrieves data via public APIs and Chorus Pro/AFNOR     2. **Factur-X PDF generation**: creates a PDF/A-3 with embedded XML     3. **Electronic signature** (optional): signs the PDF with a certificate     4. **Submission**: sends to the chosen destination (Chorus Pro or AFNOR PDP)      **Supported destinations:**     - **Chorus Pro**: French B2G platform (invoices to public sector)     - **AFNOR PDP**: Partner Dematerialization Platforms      **Differences with synchronous version:**     - ✅ **Non-blocking**: Returns immediately with a `task_id` (HTTP 202 Accepted)     - ✅ **Background processing**: Invoice is processed by a Celery worker     - ✅ **Progress tracking**: Use `/tasks/{task_id}/status` to track status     - ✅ **Ideal for high volumes**: Allows processing many invoices in parallel      **How to use:**     1. **Submission**: Call this endpoint with your invoice data     2. **Immediate return**: You receive a `task_id` (e.g., \"abc123-def456\")     3. **Tracking**: Call `/tasks/{task_id}/status` to check progress     4. **Result**: When `status = \"SUCCESS\"`, the `result` field contains the complete response      **Webhook notification (recommended):**      Instead of polling, add `?callback_url=https://your-server.com/webhook` to receive automatic notification:     - `event_type`: `submission.completed`, `submission.failed`, or `submission.partial`     - `data.submission_result`: Complete submission result     - `X-Webhook-Signature` header for HMAC verification      **Credentials and signature**: Same modes as the synchronous version (JWT or payload).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::InvoiceGenerationApi.new
submit_complete_invoice_request = FactPulse::SubmitCompleteInvoiceRequest.new({invoice_data: FactPulse::SimplifiedInvoiceData.new({number: 'number_example', supplier: { key: 3.56}, recipient: { key: 3.56}, lines: [{ key: 3.56}]}), source_pdf: 'source_pdf_example', destination: FactPulse::AFNORDestination.new}) # SubmitCompleteInvoiceRequest | 
opts = {
  callback_url: 'callback_url_example', # String | Webhook URL for async notification when submission completes.
  webhook_mode: 'webhook_mode_example' # String | Webhook content delivery: 'inline' (base64 in payload) or 'download_url' (temporary URL, 1h TTL)
}

begin
  # Submit a complete invoice (asynchronous with Celery)
  result = api_instance.submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post(submit_complete_invoice_request, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling InvoiceGenerationApi->submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post: #{e}"
end
```

#### Using the submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TaskResponse>, Integer, Hash)> submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post_with_http_info(submit_complete_invoice_request, opts)

```ruby
begin
  # Submit a complete invoice (asynchronous with Celery)
  data, status_code, headers = api_instance.submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post_with_http_info(submit_complete_invoice_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TaskResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling InvoiceGenerationApi->submit_complete_invoice_async_api_v1_processing_invoices_submit_complete_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_complete_invoice_request** | [**SubmitCompleteInvoiceRequest**](SubmitCompleteInvoiceRequest.md) |  |  |
| **callback_url** | **String** | Webhook URL for async notification when submission completes. | [optional] |
| **webhook_mode** | **String** | Webhook content delivery: &#39;inline&#39; (base64 in payload) or &#39;download_url&#39; (temporary URL, 1h TTL) | [optional][default to &#39;inline&#39;] |

### Return type

[**TaskResponse**](TaskResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

