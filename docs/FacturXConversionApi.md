# FactPulse::FacturXConversionApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**convert_document_async_api_v1_convert_async_post**](FacturXConversionApi.md#convert_document_async_api_v1_convert_async_post) | **POST** /api/v1/convert/async | Convert a document to Factur-X (async mode) |
| [**download_file_api_v1_convert_conversion_id_download_filename_get**](FacturXConversionApi.md#download_file_api_v1_convert_conversion_id_download_filename_get) | **GET** /api/v1/convert/{conversion_id}/download/{filename} | Download a generated file |
| [**get_conversion_status_api_v1_convert_conversion_id_status_get**](FacturXConversionApi.md#get_conversion_status_api_v1_convert_conversion_id_status_get) | **GET** /api/v1/convert/{conversion_id}/status | Check conversion status |
| [**resume_conversion_api_v1_convert_conversion_id_resume_post**](FacturXConversionApi.md#resume_conversion_api_v1_convert_conversion_id_resume_post) | **POST** /api/v1/convert/{conversion_id}/resume | Resume a conversion with corrections |


## convert_document_async_api_v1_convert_async_post

> Object convert_document_async_api_v1_convert_async_post(file, opts)

Convert a document to Factur-X (async mode)

Launch an asynchronous conversion via Celery.  ## Workflow  1. **Upload**: Document is sent as multipart/form-data 2. **Celery Task**: Task is queued for processing 3. **Callback**: Webhook notification on completion  ## Possible responses  - **202**: Task accepted, processing - **400**: Invalid file

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

api_instance = FactPulse::FacturXConversionApi.new
file = File.new('/path/to/some/file') # File | Document to convert (PDF, DOCX, XLSX, JPG, PNG)
opts = {
  output: 'output_example', # String | Output format: pdf, xml, both
  callback_url: 'callback_url_example', # String | 
  webhook_mode: 'webhook_mode_example' # String | Content delivery mode: 'inline' (base64 in webhook) or 'download_url' (temporary URL, 1h TTL)
}

begin
  # Convert a document to Factur-X (async mode)
  result = api_instance.convert_document_async_api_v1_convert_async_post(file, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->convert_document_async_api_v1_convert_async_post: #{e}"
end
```

#### Using the convert_document_async_api_v1_convert_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> convert_document_async_api_v1_convert_async_post_with_http_info(file, opts)

```ruby
begin
  # Convert a document to Factur-X (async mode)
  data, status_code, headers = api_instance.convert_document_async_api_v1_convert_async_post_with_http_info(file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->convert_document_async_api_v1_convert_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file** | **File** | Document to convert (PDF, DOCX, XLSX, JPG, PNG) |  |
| **output** | **String** | Output format: pdf, xml, both | [optional][default to &#39;pdf&#39;] |
| **callback_url** | **String** |  | [optional] |
| **webhook_mode** | **String** | Content delivery mode: &#39;inline&#39; (base64 in webhook) or &#39;download_url&#39; (temporary URL, 1h TTL) | [optional][default to &#39;inline&#39;] |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## download_file_api_v1_convert_conversion_id_download_filename_get

> Object download_file_api_v1_convert_conversion_id_download_filename_get(conversion_id, filename)

Download a generated file

Download the generated Factur-X PDF or XML file.  ## Available files  - `facturx.pdf`: PDF/A-3 with embedded XML - `facturx.xml`: XML CII only (Cross Industry Invoice)  Files are available for 24 hours after generation.

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

api_instance = FactPulse::FacturXConversionApi.new
conversion_id = 'conversion_id_example' # String | Conversion ID returned by POST /convert (UUID format)
filename = 'filename_example' # String | File to download: 'facturx.pdf' or 'facturx.xml'

begin
  # Download a generated file
  result = api_instance.download_file_api_v1_convert_conversion_id_download_filename_get(conversion_id, filename)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->download_file_api_v1_convert_conversion_id_download_filename_get: #{e}"
end
```

#### Using the download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info(conversion_id, filename)

```ruby
begin
  # Download a generated file
  data, status_code, headers = api_instance.download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info(conversion_id, filename)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversion_id** | **String** | Conversion ID returned by POST /convert (UUID format) |  |
| **filename** | **String** | File to download: &#39;facturx.pdf&#39; or &#39;facturx.xml&#39; |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_conversion_status_api_v1_convert_conversion_id_status_get

> Hash&lt;String, Object&gt; get_conversion_status_api_v1_convert_conversion_id_status_get(conversion_id)

Check conversion status

Returns the current status of an asynchronous conversion.

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

api_instance = FactPulse::FacturXConversionApi.new
conversion_id = 'conversion_id_example' # String | Conversion ID returned by POST /convert (UUID format)

begin
  # Check conversion status
  result = api_instance.get_conversion_status_api_v1_convert_conversion_id_status_get(conversion_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->get_conversion_status_api_v1_convert_conversion_id_status_get: #{e}"
end
```

#### Using the get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info(conversion_id)

```ruby
begin
  # Check conversion status
  data, status_code, headers = api_instance.get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info(conversion_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversion_id** | **String** | Conversion ID returned by POST /convert (UUID format) |  |

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## resume_conversion_api_v1_convert_conversion_id_resume_post

> <ConvertSuccessResponse> resume_conversion_api_v1_convert_conversion_id_resume_post(conversion_id, convert_resume_request)

Resume a conversion with corrections

Resume a conversion after completing missing data or correcting errors.  The OCR extraction is preserved, data is updated with corrections, then a new Schematron validation is performed.

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

api_instance = FactPulse::FacturXConversionApi.new
conversion_id = 'conversion_id_example' # String | Conversion ID returned by POST /convert (UUID format)
convert_resume_request = FactPulse::ConvertResumeRequest.new # ConvertResumeRequest | 

begin
  # Resume a conversion with corrections
  result = api_instance.resume_conversion_api_v1_convert_conversion_id_resume_post(conversion_id, convert_resume_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->resume_conversion_api_v1_convert_conversion_id_resume_post: #{e}"
end
```

#### Using the resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConvertSuccessResponse>, Integer, Hash)> resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info(conversion_id, convert_resume_request)

```ruby
begin
  # Resume a conversion with corrections
  data, status_code, headers = api_instance.resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info(conversion_id, convert_resume_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConvertSuccessResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling FacturXConversionApi->resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversion_id** | **String** | Conversion ID returned by POST /convert (UUID format) |  |
| **convert_resume_request** | [**ConvertResumeRequest**](ConvertResumeRequest.md) |  |  |

### Return type

[**ConvertSuccessResponse**](ConvertSuccessResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

