# FactPulse::FacturXValidationApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post**](FacturXValidationApi.md#validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post) | **POST** /api/v1/processing/validate-facturx-pdf | Validate a complete Factur-X PDF |
| [**validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post**](FacturXValidationApi.md#validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post) | **POST** /api/v1/processing/validate-facturx-async | Validate a Factur-X PDF (asynchronous with polling) |


## validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post

> <PDFValidationResultAPI> validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post(pdf_file, opts)

Validate a complete Factur-X PDF

Validates a complete Factur-X PDF according to European and French standards.  ## Applied validation standards  - **EN 16931**: European semantic standard (directive 2014/55/EU) - **ISO 19005-3** (PDF/A-3): Long-term electronic archiving - **Factur-X / ZUGFeRD**: Franco-German specification - **Schematron**: XML business rules validation - **eIDAS**: European regulation on electronic identification (signatures)  ## Checks performed  ### 1. Factur-X XML extraction and validation **Checks performed:** - Presence of embedded XML file (`factur-x.xml` or `zugferd-invoice.xml`) - Automatic profile detection (MINIMUM, BASIC, EN16931, EXTENDED) - XML parsing with UTF-8 validation - GuidelineSpecifiedDocumentContextParameter/ID extraction  **Schematron validation:** - Business rules for detected profile (MINIMUM: 45 rules, EN16931: 178 rules) - Cardinality of required elements - Calculation consistency (net, VAT, gross amounts, discounts) - Identifier formats (SIRET, intra-EU VAT, IBAN) - Standardized codes (ISO country codes, UN/ECE units, VAT codes)  **What is verified:** - ✅ XML structure conforming to Cross Industry Invoice XSD - ✅ Correct UN/CEFACT namespace - ✅ European business rules (BR-xx) - ✅ French-specific rules (FR-xx)  ### 2. PDF/A-3 compliance **Basic validation (metadata):** - Presence of `/Type` field set to `Catalog` - Metadata `pdfaid:part` = 3 (PDF/A-3) - Metadata `pdfaid:conformance` = B or U - PDF version >= 1.4  **Strict VeraPDF validation (if use_verapdf=True):** - 146+ ISO 19005-3 rules (PDF/A-3B) - Absence of forbidden content (JavaScript, multimedia, dynamic forms) - Correctly embedded fonts and subsets - Compliant color spaces (sRGB, DeviceGray) - Valid file structure (cross-reference table) - XMP metadata conforming to ISO 16684-1  **What is verified:** - ✅ Long-term archivable file (20+ years) - ✅ Guaranteed readability (embedded fonts) - ✅ Legal compliance (France, Germany, EU)  ### 3. XMP metadata (eXtensible Metadata Platform) **Checks performed:** - Presence of `<?xpacket>` block with XMP metadata - `fx:` namespace for Factur-X: `urn:factur-x:pdfa:CrossIndustryDocument:invoice:1p0#` - Required Factur-X fields:   - `fx:ConformanceLevel`: Profile (MINIMUM, BASIC, EN16931, EXTENDED)   - `fx:DocumentFileName`: Embedded XML name   - `fx:DocumentType`: \"INVOICE\"   - `fx:Version`: Factur-X version (1.0.07)  **What is verified:** - ✅ Metadata conforming to ISO 16684-1 - ✅ Correct declared Factur-X profile - ✅ Supported Factur-X version  ### 4. Electronic signatures **Detection and analysis:** - Presence of `/Sig` dictionaries in PDF - Signature type: PAdES (PDF Advanced Electronic Signature) - Information extraction:   - Signer name (`/Name`)   - Signing date (`/M`)   - Signature reason (`/Reason`)   - Signature location (`/Location`)   - Signature type (approval, certification)  **What is verified:** - ✅ Presence of signatures or seals - ✅ Number of signatures (single or multi-signature) - ℹ️ No cryptographic verification (requires certificates)  ## Parameters  - **pdf_file** (required): The Factur-X PDF file to validate - **profile** (optional): Expected profile. If absent, auto-detected from XML - **use_verapdf** (optional, default=false): Enable strict PDF/A validation with VeraPDF   - `false`: Fast metadata validation (2-3 seconds)   - `true`: Complete ISO 19005-3 validation (15-30 seconds, **recommended for production**)  ## Detailed response  ```json {   \"isCompliant\": true,   \"xml\": {     \"present\": true,     \"compliant\": true,     \"profile\": \"EN16931\",     \"errors\": []   },   \"pdfa\": {     \"compliant\": true,     \"version\": \"PDF/A-3B\",     \"method\": \"verapdf\",     \"errors\": []   },   \"xmp\": {     \"present\": true,     \"compliant\": true,     \"metadata\": {...}   },   \"signatures\": {     \"present\": true,     \"count\": 1,     \"details\": [...]   } } ```  ## Use cases  - **Before sending**: Validate generated invoice before transmission to client - **On reception**: Verify compliance of invoice received from supplier - **Audit**: Check quality of invoice batches - **Legal compliance**: Ensure B2B/B2G obligations are met in France - **Debugging**: Identify issues in generation process - **Archiving**: Guarantee long-term validity (PDF/A-3)  ## Processing time  - Basic validation: 2-3 seconds - VeraPDF validation: 15-30 seconds (depends on PDF size)

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

api_instance = FactPulse::FacturXValidationApi.new
pdf_file = File.new('/path/to/some/file') # File | Factur-X PDF file to validate (.pdf format).
opts = {
  profile: FactPulse::APIProfile::MINIMUM, # APIProfile | 
  use_verapdf: true, # Boolean | Enable strict PDF/A validation with VeraPDF (recommended for production). If False, uses basic metadata validation.
  skip_br_fr: true # Boolean | 
}

begin
  # Validate a complete Factur-X PDF
  result = api_instance.validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post(pdf_file, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXValidationApi->validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post: #{e}"
end
```

#### Using the validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PDFValidationResultAPI>, Integer, Hash)> validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post_with_http_info(pdf_file, opts)

```ruby
begin
  # Validate a complete Factur-X PDF
  data, status_code, headers = api_instance.validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post_with_http_info(pdf_file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PDFValidationResultAPI>
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXValidationApi->validate_facturx_pdf_api_v1_processing_validate_facturx_pdf_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pdf_file** | **File** | Factur-X PDF file to validate (.pdf format). |  |
| **profile** | [**APIProfile**](APIProfile.md) |  | [optional] |
| **use_verapdf** | **Boolean** | Enable strict PDF/A validation with VeraPDF (recommended for production). If False, uses basic metadata validation. | [optional][default to false] |
| **skip_br_fr** | **Boolean** |  | [optional] |

### Return type

[**PDFValidationResultAPI**](PDFValidationResultAPI.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post

> <TaskResponse> validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post(pdf_file, opts)

Validate a Factur-X PDF (asynchronous with polling)

Validates a Factur-X PDF asynchronously with polling system.  ## How it works  1. **Submission**: PDF is queued for asynchronous validation 2. **Immediate return**: You receive a `task_id` (HTTP 202) 3. **Tracking**: Use the `/tasks/{task_id}/status` endpoint to track progress  ## Advantages of asynchronous mode  - **No timeout**: Ideal for large PDFs or VeraPDF validation (which can take several seconds) - **Scalability**: Validations are processed by dedicated Celery workers - **Status tracking**: Allows you to monitor validation progress - **Non-blocking**: Your client doesn't wait during validation  ## Webhook notification (recommended)  Instead of polling, you can receive a webhook notification when validation completes:  ``` callback_url=https://your-server.com/webhook webhook_mode=download_url  # Optional: get download URL instead of base64 ```  The webhook will POST a JSON payload with: - `event_type`: `validation.completed` or `validation.failed` - `data.is_compliant`: Whether the PDF is Factur-X compliant - `data.detected_profile`: The detected Factur-X profile - `X-Webhook-Signature` header for HMAC verification  ## When to use this mode?  - **VeraPDF validation enabled** (`use_verapdf=True`): Strict validation can take 2-10 seconds - **Large PDF files**: PDFs > 1 MB - **Batch processing**: Validating multiple invoices in parallel - **Asynchronous integration**: Your system supports polling  ## Checks performed  ### 1. Factur-X XML extraction and validation - Verifies presence of Factur-X compliant embedded XML file - Automatically detects profile used (MINIMUM, BASIC, EN16931, EXTENDED) - Validates XML against detected profile's Schematron rules  ### 2. PDF/A compliance - **Without VeraPDF**: Basic metadata validation (fast, ~100ms) - **With VeraPDF**: Strict ISO 19005 validation (146+ rules, 2-10s)   - Detects PDF/A version (PDF/A-1, PDF/A-3, etc.)   - Detailed non-compliance reports  ### 3. XMP metadata - Verifies presence of XMP metadata in PDF - Validates Factur-X metadata compliance (profile, version) - Extracts all available XMP metadata  ### 4. Electronic signatures - Detects presence of electronic signatures or seals - Extracts information about each signature (signer, date, reason) - Counts number of signatures present  ## Parameters  - **pdf_file**: The Factur-X PDF file to validate - **profile**: Expected Factur-X profile (optional). If not specified, profile   will be auto-detected from embedded XML file. - **use_verapdf**: Enable strict PDF/A validation with VeraPDF.   ⚠️ **Warning**: VeraPDF can take 2-10 seconds depending on PDF size.   Recommended only in asynchronous mode to avoid timeouts.  ## Retrieving results  After submission, use `GET /tasks/{task_id}/status` endpoint to retrieve the result.  **Polling example**: ```python import requests import time  # 1. Submit task response = requests.post(\"/validate-facturx-async\", files={\"pdf_file\": pdf_file}) task_id = response.json()[\"taskId\"]  # 2. Poll every 2 seconds while True:     status_response = requests.get(f\"/tasks/{task_id}/status\")     status = status_response.json()      if status[\"status\"] == \"SUCCESS\":         result = status[\"result\"][\"validation_result\"]         print(f\"Compliant: {result['is_compliant']}\")         break     elif status[\"status\"] == \"FAILURE\":         print(f\"Error: {status['result']['errorMessage']}\")         break      time.sleep(2)  # Wait 2 seconds before next check ```  ## Use cases  - Validate invoices before sending with VeraPDF (strict validation) - Process invoice batches in parallel - Integrate validation into an asynchronous pipeline - Validate large PDFs without timeout risk

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

api_instance = FactPulse::FacturXValidationApi.new
pdf_file = File.new('/path/to/some/file') # File | Factur-X PDF file to validate (.pdf format).
opts = {
  profile: FactPulse::APIProfile::MINIMUM, # APIProfile | 
  use_verapdf: true, # Boolean | Enable strict PDF/A validation with VeraPDF (recommended for production). May take several seconds.
  callback_url: 'callback_url_example', # String | 
  webhook_mode: 'webhook_mode_example' # String | Webhook content delivery: 'inline' (base64 in payload) or 'download_url' (temporary URL, 1h TTL)
}

begin
  # Validate a Factur-X PDF (asynchronous with polling)
  result = api_instance.validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post(pdf_file, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXValidationApi->validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post: #{e}"
end
```

#### Using the validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TaskResponse>, Integer, Hash)> validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post_with_http_info(pdf_file, opts)

```ruby
begin
  # Validate a Factur-X PDF (asynchronous with polling)
  data, status_code, headers = api_instance.validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post_with_http_info(pdf_file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TaskResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXValidationApi->validate_facturx_pdf_async_api_v1_processing_validate_facturx_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pdf_file** | **File** | Factur-X PDF file to validate (.pdf format). |  |
| **profile** | [**APIProfile**](APIProfile.md) |  | [optional] |
| **use_verapdf** | **Boolean** | Enable strict PDF/A validation with VeraPDF (recommended for production). May take several seconds. | [optional][default to false] |
| **callback_url** | **String** |  | [optional] |
| **webhook_mode** | **String** | Webhook content delivery: &#39;inline&#39; (base64 in payload) or &#39;download_url&#39; (temporary URL, 1h TTL) | [optional][default to &#39;inline&#39;] |

### Return type

[**TaskResponse**](TaskResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

