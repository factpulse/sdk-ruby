# OpenapiClient::PDFXMLVerificationApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_verification_status_api_v1_verification_verify_async_task_id_status_get**](PDFXMLVerificationApi.md#get_verification_status_api_v1_verification_verify_async_task_id_status_get) | **GET** /api/v1/verification/verify-async/{task_id}/status | Get status of an asynchronous verification |
| [**get_verification_status_api_v1_verification_verify_async_task_id_status_get_0**](PDFXMLVerificationApi.md#get_verification_status_api_v1_verification_verify_async_task_id_status_get_0) | **GET** /api/v1/verification/verify-async/{task_id}/status | Get status of an asynchronous verification |
| [**verify_pdf_async_api_v1_verification_verify_async_post**](PDFXMLVerificationApi.md#verify_pdf_async_api_v1_verification_verify_async_post) | **POST** /api/v1/verification/verify-async | Verify PDF/XML Factur-X compliance (asynchronous) |
| [**verify_pdf_async_api_v1_verification_verify_async_post_0**](PDFXMLVerificationApi.md#verify_pdf_async_api_v1_verification_verify_async_post_0) | **POST** /api/v1/verification/verify-async | Verify PDF/XML Factur-X compliance (asynchronous) |
| [**verify_pdf_sync_api_v1_verification_verify_post**](PDFXMLVerificationApi.md#verify_pdf_sync_api_v1_verification_verify_post) | **POST** /api/v1/verification/verify | Verify PDF/XML Factur-X compliance (synchronous) |
| [**verify_pdf_sync_api_v1_verification_verify_post_0**](PDFXMLVerificationApi.md#verify_pdf_sync_api_v1_verification_verify_post_0) | **POST** /api/v1/verification/verify | Verify PDF/XML Factur-X compliance (synchronous) |


## get_verification_status_api_v1_verification_verify_async_task_id_status_get

> <AsyncTaskStatus> get_verification_status_api_v1_verification_verify_async_task_id_status_get(task_id)

Get status of an asynchronous verification

Retrieves the status and result of an asynchronous verification task.  **Possible statuses:** - `PENDING`: Task waiting in queue - `STARTED`: Task currently running - `SUCCESS`: Task completed successfully (see `result`) - `FAILURE`: System error (unhandled exception)  **Note:** The `result.status` field can be \"SUCCESS\" or \"ERROR\" independently of Celery status (which will always be SUCCESS if the task ran).

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::PDFXMLVerificationApi.new
task_id = 'task_id_example' # String | Celery task ID returned by /verify-async endpoint

begin
  # Get status of an asynchronous verification
  result = api_instance.get_verification_status_api_v1_verification_verify_async_task_id_status_get(task_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->get_verification_status_api_v1_verification_verify_async_task_id_status_get: #{e}"
end
```

#### Using the get_verification_status_api_v1_verification_verify_async_task_id_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AsyncTaskStatus>, Integer, Hash)> get_verification_status_api_v1_verification_verify_async_task_id_status_get_with_http_info(task_id)

```ruby
begin
  # Get status of an asynchronous verification
  data, status_code, headers = api_instance.get_verification_status_api_v1_verification_verify_async_task_id_status_get_with_http_info(task_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AsyncTaskStatus>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->get_verification_status_api_v1_verification_verify_async_task_id_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** | Celery task ID returned by /verify-async endpoint |  |

### Return type

[**AsyncTaskStatus**](AsyncTaskStatus.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_verification_status_api_v1_verification_verify_async_task_id_status_get_0

> <AsyncTaskStatus> get_verification_status_api_v1_verification_verify_async_task_id_status_get_0(task_id)

Get status of an asynchronous verification

Retrieves the status and result of an asynchronous verification task.  **Possible statuses:** - `PENDING`: Task waiting in queue - `STARTED`: Task currently running - `SUCCESS`: Task completed successfully (see `result`) - `FAILURE`: System error (unhandled exception)  **Note:** The `result.status` field can be \"SUCCESS\" or \"ERROR\" independently of Celery status (which will always be SUCCESS if the task ran).

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::PDFXMLVerificationApi.new
task_id = 'task_id_example' # String | Celery task ID returned by /verify-async endpoint

begin
  # Get status of an asynchronous verification
  result = api_instance.get_verification_status_api_v1_verification_verify_async_task_id_status_get_0(task_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->get_verification_status_api_v1_verification_verify_async_task_id_status_get_0: #{e}"
end
```

#### Using the get_verification_status_api_v1_verification_verify_async_task_id_status_get_0_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AsyncTaskStatus>, Integer, Hash)> get_verification_status_api_v1_verification_verify_async_task_id_status_get_0_with_http_info(task_id)

```ruby
begin
  # Get status of an asynchronous verification
  data, status_code, headers = api_instance.get_verification_status_api_v1_verification_verify_async_task_id_status_get_0_with_http_info(task_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AsyncTaskStatus>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->get_verification_status_api_v1_verification_verify_async_task_id_status_get_0_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** | Celery task ID returned by /verify-async endpoint |  |

### Return type

[**AsyncTaskStatus**](AsyncTaskStatus.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## verify_pdf_async_api_v1_verification_verify_async_post

> <TaskResponse> verify_pdf_async_api_v1_verification_verify_async_post(pdf_file, opts)

Verify PDF/XML Factur-X compliance (asynchronous)

Verifies PDF/XML Factur-X compliance asynchronously.  **IMPORTANT**: Only Factur-X PDFs (with embedded XML) are accepted. PDFs without Factur-X XML will return a `NOT_FACTURX` error in the result.  This version uses a Celery task and can call the OCR service if the PDF is an image or if `force_ocr=true`.  **Returns immediately** a task ID. Use `/verify-async/{task_id}/status` to retrieve the result.  **Verification principle (Factur-X 1.08):** - Principle #2: XML can only contain info present in the PDF - Principle #4: All XML info must be present and compliant in the PDF  **Verified fields:** - Identification: BT-1 (invoice #), BT-2 (date), BT-3 (type), BT-5 (currency), BT-23 (framework) - Seller: BT-27 (name), BT-29 (SIRET), BT-30 (SIREN), BT-31 (VAT) - Buyer: BT-44 (name), BT-46 (SIRET), BT-47 (SIREN), BT-48 (VAT) - Amounts: BT-109 (excl. tax), BT-110 (VAT), BT-112 (incl. tax), BT-115 (amount due) - VAT breakdown: BT-116, BT-117, BT-118, BT-119 - Invoice lines: BT-153, BT-129, BT-146, BT-131 - Mandatory notes: PMT, PMD, AAB - Rule BR-FR-09: SIRET/SIREN consistency  **Advantages over synchronous version:** - OCR support for image PDFs (via DocTR service) - Longer timeout for large documents - Doesn't block the server  ## Webhook notification (recommended)  Instead of polling, you can receive a webhook notification when verification completes:  ``` callback_url=https://your-server.com/webhook ```  The webhook will POST a JSON payload with: - `event_type`: `verification.completed` or `verification.failed` - `data.is_compliant`: Whether the PDF/XML are consistent - `data.compliance_score`: Compliance score (0-1) - `X-Webhook-Signature` header for HMAC verification

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::PDFXMLVerificationApi.new
pdf_file = File.new('/path/to/some/file') # File | Factur-X PDF file to verify
opts = {
  force_ocr: true, # Boolean | Force OCR usage even if PDF contains native text
  callback_url: 'callback_url_example', # String | 
  webhook_mode: 'webhook_mode_example' # String | Webhook content delivery: 'inline' (base64 in payload) or 'download_url' (temporary URL, 1h TTL)
}

begin
  # Verify PDF/XML Factur-X compliance (asynchronous)
  result = api_instance.verify_pdf_async_api_v1_verification_verify_async_post(pdf_file, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_async_api_v1_verification_verify_async_post: #{e}"
end
```

#### Using the verify_pdf_async_api_v1_verification_verify_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TaskResponse>, Integer, Hash)> verify_pdf_async_api_v1_verification_verify_async_post_with_http_info(pdf_file, opts)

```ruby
begin
  # Verify PDF/XML Factur-X compliance (asynchronous)
  data, status_code, headers = api_instance.verify_pdf_async_api_v1_verification_verify_async_post_with_http_info(pdf_file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TaskResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_async_api_v1_verification_verify_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pdf_file** | **File** | Factur-X PDF file to verify |  |
| **force_ocr** | **Boolean** | Force OCR usage even if PDF contains native text | [optional][default to false] |
| **callback_url** | **String** |  | [optional] |
| **webhook_mode** | **String** | Webhook content delivery: &#39;inline&#39; (base64 in payload) or &#39;download_url&#39; (temporary URL, 1h TTL) | [optional][default to &#39;inline&#39;] |

### Return type

[**TaskResponse**](TaskResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## verify_pdf_async_api_v1_verification_verify_async_post_0

> <TaskResponse> verify_pdf_async_api_v1_verification_verify_async_post_0(pdf_file, opts)

Verify PDF/XML Factur-X compliance (asynchronous)

Verifies PDF/XML Factur-X compliance asynchronously.  **IMPORTANT**: Only Factur-X PDFs (with embedded XML) are accepted. PDFs without Factur-X XML will return a `NOT_FACTURX` error in the result.  This version uses a Celery task and can call the OCR service if the PDF is an image or if `force_ocr=true`.  **Returns immediately** a task ID. Use `/verify-async/{task_id}/status` to retrieve the result.  **Verification principle (Factur-X 1.08):** - Principle #2: XML can only contain info present in the PDF - Principle #4: All XML info must be present and compliant in the PDF  **Verified fields:** - Identification: BT-1 (invoice #), BT-2 (date), BT-3 (type), BT-5 (currency), BT-23 (framework) - Seller: BT-27 (name), BT-29 (SIRET), BT-30 (SIREN), BT-31 (VAT) - Buyer: BT-44 (name), BT-46 (SIRET), BT-47 (SIREN), BT-48 (VAT) - Amounts: BT-109 (excl. tax), BT-110 (VAT), BT-112 (incl. tax), BT-115 (amount due) - VAT breakdown: BT-116, BT-117, BT-118, BT-119 - Invoice lines: BT-153, BT-129, BT-146, BT-131 - Mandatory notes: PMT, PMD, AAB - Rule BR-FR-09: SIRET/SIREN consistency  **Advantages over synchronous version:** - OCR support for image PDFs (via DocTR service) - Longer timeout for large documents - Doesn't block the server  ## Webhook notification (recommended)  Instead of polling, you can receive a webhook notification when verification completes:  ``` callback_url=https://your-server.com/webhook ```  The webhook will POST a JSON payload with: - `event_type`: `verification.completed` or `verification.failed` - `data.is_compliant`: Whether the PDF/XML are consistent - `data.compliance_score`: Compliance score (0-1) - `X-Webhook-Signature` header for HMAC verification

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::PDFXMLVerificationApi.new
pdf_file = File.new('/path/to/some/file') # File | Factur-X PDF file to verify
opts = {
  force_ocr: true, # Boolean | Force OCR usage even if PDF contains native text
  callback_url: 'callback_url_example', # String | 
  webhook_mode: 'webhook_mode_example' # String | Webhook content delivery: 'inline' (base64 in payload) or 'download_url' (temporary URL, 1h TTL)
}

begin
  # Verify PDF/XML Factur-X compliance (asynchronous)
  result = api_instance.verify_pdf_async_api_v1_verification_verify_async_post_0(pdf_file, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_async_api_v1_verification_verify_async_post_0: #{e}"
end
```

#### Using the verify_pdf_async_api_v1_verification_verify_async_post_0_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TaskResponse>, Integer, Hash)> verify_pdf_async_api_v1_verification_verify_async_post_0_with_http_info(pdf_file, opts)

```ruby
begin
  # Verify PDF/XML Factur-X compliance (asynchronous)
  data, status_code, headers = api_instance.verify_pdf_async_api_v1_verification_verify_async_post_0_with_http_info(pdf_file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TaskResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_async_api_v1_verification_verify_async_post_0_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pdf_file** | **File** | Factur-X PDF file to verify |  |
| **force_ocr** | **Boolean** | Force OCR usage even if PDF contains native text | [optional][default to false] |
| **callback_url** | **String** |  | [optional] |
| **webhook_mode** | **String** | Webhook content delivery: &#39;inline&#39; (base64 in payload) or &#39;download_url&#39; (temporary URL, 1h TTL) | [optional][default to &#39;inline&#39;] |

### Return type

[**TaskResponse**](TaskResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## verify_pdf_sync_api_v1_verification_verify_post

> <VerificationSuccessResponse> verify_pdf_sync_api_v1_verification_verify_post(pdf_file)

Verify PDF/XML Factur-X compliance (synchronous)

Verifies compliance between the PDF and its embedded Factur-X XML.  **IMPORTANT**: Only Factur-X PDFs (with embedded XML) are accepted. PDFs without Factur-X XML will be rejected with a 400 error.  This synchronous version uses only native PDF extraction (pdfplumber). For image PDFs requiring OCR, use the `/verify-async` endpoint.  **Verification principle (Factur-X 1.08):** - Principle #2: XML can only contain info present in the PDF - Principle #4: All XML info must be present and compliant in the PDF  **Verified fields:** - Identification: BT-1 (invoice #), BT-2 (date), BT-3 (type), BT-5 (currency), BT-23 (framework) - Seller: BT-27 (name), BT-29 (SIRET), BT-30 (SIREN), BT-31 (VAT) - Buyer: BT-44 (name), BT-46 (SIRET), BT-47 (SIREN), BT-48 (VAT) - Amounts: BT-109 (excl. tax), BT-110 (VAT), BT-112 (incl. tax), BT-115 (amount due) - VAT breakdown: BT-116, BT-117, BT-118, BT-119 - Invoice lines: BT-153, BT-129, BT-146, BT-131 - Mandatory notes: PMT, PMD, AAB - Rule BR-FR-09: SIRET/SIREN consistency

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::PDFXMLVerificationApi.new
pdf_file = File.new('/path/to/some/file') # File | Factur-X PDF file to verify

begin
  # Verify PDF/XML Factur-X compliance (synchronous)
  result = api_instance.verify_pdf_sync_api_v1_verification_verify_post(pdf_file)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_sync_api_v1_verification_verify_post: #{e}"
end
```

#### Using the verify_pdf_sync_api_v1_verification_verify_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VerificationSuccessResponse>, Integer, Hash)> verify_pdf_sync_api_v1_verification_verify_post_with_http_info(pdf_file)

```ruby
begin
  # Verify PDF/XML Factur-X compliance (synchronous)
  data, status_code, headers = api_instance.verify_pdf_sync_api_v1_verification_verify_post_with_http_info(pdf_file)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VerificationSuccessResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_sync_api_v1_verification_verify_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pdf_file** | **File** | Factur-X PDF file to verify |  |

### Return type

[**VerificationSuccessResponse**](VerificationSuccessResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## verify_pdf_sync_api_v1_verification_verify_post_0

> <VerificationSuccessResponse> verify_pdf_sync_api_v1_verification_verify_post_0(pdf_file)

Verify PDF/XML Factur-X compliance (synchronous)

Verifies compliance between the PDF and its embedded Factur-X XML.  **IMPORTANT**: Only Factur-X PDFs (with embedded XML) are accepted. PDFs without Factur-X XML will be rejected with a 400 error.  This synchronous version uses only native PDF extraction (pdfplumber). For image PDFs requiring OCR, use the `/verify-async` endpoint.  **Verification principle (Factur-X 1.08):** - Principle #2: XML can only contain info present in the PDF - Principle #4: All XML info must be present and compliant in the PDF  **Verified fields:** - Identification: BT-1 (invoice #), BT-2 (date), BT-3 (type), BT-5 (currency), BT-23 (framework) - Seller: BT-27 (name), BT-29 (SIRET), BT-30 (SIREN), BT-31 (VAT) - Buyer: BT-44 (name), BT-46 (SIRET), BT-47 (SIREN), BT-48 (VAT) - Amounts: BT-109 (excl. tax), BT-110 (VAT), BT-112 (incl. tax), BT-115 (amount due) - VAT breakdown: BT-116, BT-117, BT-118, BT-119 - Invoice lines: BT-153, BT-129, BT-146, BT-131 - Mandatory notes: PMT, PMD, AAB - Rule BR-FR-09: SIRET/SIREN consistency

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::PDFXMLVerificationApi.new
pdf_file = File.new('/path/to/some/file') # File | Factur-X PDF file to verify

begin
  # Verify PDF/XML Factur-X compliance (synchronous)
  result = api_instance.verify_pdf_sync_api_v1_verification_verify_post_0(pdf_file)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_sync_api_v1_verification_verify_post_0: #{e}"
end
```

#### Using the verify_pdf_sync_api_v1_verification_verify_post_0_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VerificationSuccessResponse>, Integer, Hash)> verify_pdf_sync_api_v1_verification_verify_post_0_with_http_info(pdf_file)

```ruby
begin
  # Verify PDF/XML Factur-X compliance (synchronous)
  data, status_code, headers = api_instance.verify_pdf_sync_api_v1_verification_verify_post_0_with_http_info(pdf_file)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VerificationSuccessResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling PDFXMLVerificationApi->verify_pdf_sync_api_v1_verification_verify_post_0_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **pdf_file** | **File** | Factur-X PDF file to verify |  |

### Return type

[**VerificationSuccessResponse**](VerificationSuccessResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

