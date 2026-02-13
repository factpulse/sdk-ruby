# FactPulse::ParseApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**parse_facturx_async_api_v1_processing_parse_facturx_async_post**](ParseApi.md#parse_facturx_async_api_v1_processing_parse_facturx_async_post) | **POST** /api/v1/processing/parse-facturx/async | Parse Factur-X XML or PDF (async) |
| [**parse_facturx_sync_api_v1_processing_parse_facturx_post**](ParseApi.md#parse_facturx_sync_api_v1_processing_parse_facturx_post) | **POST** /api/v1/processing/parse-facturx | Parse CII, UBL or Factur-X PDF (sync) |


## parse_facturx_async_api_v1_processing_parse_facturx_async_post

> <TaskResponse> parse_facturx_async_api_v1_processing_parse_facturx_async_post(file, opts)

Parse Factur-X XML or PDF (async)

Parse a Factur-X file asynchronously using a Celery task.  **Use case:** For large files or when you want non-blocking processing.  **Workflow:** 1. Submit file with this endpoint -> receive `task_id` 2. Poll `/tasks/{task_id}/status` for result 3. Result contains `invoice` and `detected_profile`  **Optional:** Provide `callback_url` to receive a webhook when parsing completes.

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

api_instance = FactPulse::ParseApi.new
file = File.new('/path/to/some/file') # File | Factur-X PDF or XML file to parse
opts = {
  callback_url: 'callback_url_example' # String | 
}

begin
  # Parse Factur-X XML or PDF (async)
  result = api_instance.parse_facturx_async_api_v1_processing_parse_facturx_async_post(file, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ParseApi->parse_facturx_async_api_v1_processing_parse_facturx_async_post: #{e}"
end
```

#### Using the parse_facturx_async_api_v1_processing_parse_facturx_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TaskResponse>, Integer, Hash)> parse_facturx_async_api_v1_processing_parse_facturx_async_post_with_http_info(file, opts)

```ruby
begin
  # Parse Factur-X XML or PDF (async)
  data, status_code, headers = api_instance.parse_facturx_async_api_v1_processing_parse_facturx_async_post_with_http_info(file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TaskResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ParseApi->parse_facturx_async_api_v1_processing_parse_facturx_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file** | **File** | Factur-X PDF or XML file to parse |  |
| **callback_url** | **String** |  | [optional] |

### Return type

[**TaskResponse**](TaskResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## parse_facturx_sync_api_v1_processing_parse_facturx_post

> <ParseFacturXResponse> parse_facturx_sync_api_v1_processing_parse_facturx_post(file)

Parse CII, UBL or Factur-X PDF (sync)

Parse a CII XML, UBL XML, or Factur-X PDF and extract the invoice data as a FacturXInvoice model.  **Use cases:** - Extract invoice data from received invoices (any format) - Round-trip: parse an existing invoice, modify it, and regenerate in another format - Convert between CII and UBL via the FacturXInvoice pivot model  **Supported formats:** - Factur-X PDF (PDF/A-3 with embedded CII XML) - CII XML (UN/CEFACT Cross-Industry Invoice) - UBL 2.1 XML (OASIS Invoice or CreditNote)  **Returns:** - `invoice`: Complete FacturXInvoice data (can be used with /generate-invoice) - `detected_profile`: Factur-X profile (MINIMUM, BASIC, EN16931, EXTENDED)

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

api_instance = FactPulse::ParseApi.new
file = File.new('/path/to/some/file') # File | Factur-X PDF or XML file to parse

begin
  # Parse CII, UBL or Factur-X PDF (sync)
  result = api_instance.parse_facturx_sync_api_v1_processing_parse_facturx_post(file)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ParseApi->parse_facturx_sync_api_v1_processing_parse_facturx_post: #{e}"
end
```

#### Using the parse_facturx_sync_api_v1_processing_parse_facturx_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ParseFacturXResponse>, Integer, Hash)> parse_facturx_sync_api_v1_processing_parse_facturx_post_with_http_info(file)

```ruby
begin
  # Parse CII, UBL or Factur-X PDF (sync)
  data, status_code, headers = api_instance.parse_facturx_sync_api_v1_processing_parse_facturx_post_with_http_info(file)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ParseFacturXResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ParseApi->parse_facturx_sync_api_v1_processing_parse_facturx_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file** | **File** | Factur-X PDF or XML file to parse |  |

### Return type

[**ParseFacturXResponse**](ParseFacturXResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

