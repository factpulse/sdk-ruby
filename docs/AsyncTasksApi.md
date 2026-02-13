# FactPulse::AsyncTasksApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get**](AsyncTasksApi.md#get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get) | **GET** /api/v1/processing/tasks/{task_id}/generation-status | Get typed generation task status |
| [**get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get**](AsyncTasksApi.md#get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get) | **GET** /api/v1/processing/tasks/{task_id}/signature-status | Get typed signature task status |
| [**get_task_status_api_v1_processing_tasks_task_id_status_get**](AsyncTasksApi.md#get_task_status_api_v1_processing_tasks_task_id_status_get) | **GET** /api/v1/processing/tasks/{task_id}/status | Get task generation status |
| [**get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get**](AsyncTasksApi.md#get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get) | **GET** /api/v1/processing/tasks/{task_id}/validation-status | Get typed validation task status |


## get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get

> <GenerationTaskStatus> get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get(task_id)

Get typed generation task status

Typed status endpoint for invoice generation tasks.  Returns a strongly-typed `result` (discriminated on `result.status`): - **SUCCESS**: `GenerationSuccessResult` with `content_b64` / `xml_content` - **ERROR**: `TaskErrorResult` in AFNOR format

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

api_instance = FactPulse::AsyncTasksApi.new
task_id = 'task_id_example' # String | Celery task ID returned by /generate-invoice

begin
  # Get typed generation task status
  result = api_instance.get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get(task_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get: #{e}"
end
```

#### Using the get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerationTaskStatus>, Integer, Hash)> get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get_with_http_info(task_id)

```ruby
begin
  # Get typed generation task status
  data, status_code, headers = api_instance.get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get_with_http_info(task_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerationTaskStatus>
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_generation_task_status_api_v1_processing_tasks_task_id_generation_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** | Celery task ID returned by /generate-invoice |  |

### Return type

[**GenerationTaskStatus**](GenerationTaskStatus.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get

> <SignatureTaskStatus> get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get(task_id)

Get typed signature task status

Typed status endpoint for PDF signing tasks.  Returns a strongly-typed `result` (discriminated on `result.status`): - **SUCCESS**: `SignatureSuccessResult` with `content_b64`, `signer_cn`, etc. - **ERROR**: `TaskErrorResult` in AFNOR format

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

api_instance = FactPulse::AsyncTasksApi.new
task_id = 'task_id_example' # String | Celery task ID returned by /sign-pdf-async

begin
  # Get typed signature task status
  result = api_instance.get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get(task_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get: #{e}"
end
```

#### Using the get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SignatureTaskStatus>, Integer, Hash)> get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get_with_http_info(task_id)

```ruby
begin
  # Get typed signature task status
  data, status_code, headers = api_instance.get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get_with_http_info(task_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SignatureTaskStatus>
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_signature_task_status_api_v1_processing_tasks_task_id_signature_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** | Celery task ID returned by /sign-pdf-async |  |

### Return type

[**SignatureTaskStatus**](SignatureTaskStatus.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_task_status_api_v1_processing_tasks_task_id_status_get

> <AsyncTaskStatus> get_task_status_api_v1_processing_tasks_task_id_status_get(task_id)

Get task generation status

Retrieves the progress status of an invoice generation task.  ## Possible states  The `status` field uses the `CeleryStatus` enum with values: - **PENDING, STARTED, SUCCESS, FAILURE, RETRY**  See the `CeleryStatus` schema documentation for details.  ## Business result  When `status=\"SUCCESS\"`, the `result` field contains: - `status`: \"SUCCESS\" or \"ERROR\" (business result) - `content_b64`: Base64 encoded content (if success) - `errorCode`, `errorMessage`, `details`: AFNOR format (if business error)  ## Usage  Poll this endpoint every 2-3 seconds until `status` is `SUCCESS` or `FAILURE`.

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

api_instance = FactPulse::AsyncTasksApi.new
task_id = 'task_id_example' # String | Celery task ID returned by async endpoints (UUID format)

begin
  # Get task generation status
  result = api_instance.get_task_status_api_v1_processing_tasks_task_id_status_get(task_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_task_status_api_v1_processing_tasks_task_id_status_get: #{e}"
end
```

#### Using the get_task_status_api_v1_processing_tasks_task_id_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AsyncTaskStatus>, Integer, Hash)> get_task_status_api_v1_processing_tasks_task_id_status_get_with_http_info(task_id)

```ruby
begin
  # Get task generation status
  data, status_code, headers = api_instance.get_task_status_api_v1_processing_tasks_task_id_status_get_with_http_info(task_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AsyncTaskStatus>
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_task_status_api_v1_processing_tasks_task_id_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** | Celery task ID returned by async endpoints (UUID format) |  |

### Return type

[**AsyncTaskStatus**](AsyncTaskStatus.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get

> <ValidationTaskStatus> get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get(task_id)

Get typed validation task status

Typed status endpoint for Factur-X PDF validation tasks.  Returns a strongly-typed `result` (discriminated on `result.status`): - **SUCCESS**: `ValidationSuccessTaskResult` with `validation_result` - **ERROR**: `TaskErrorResult` in AFNOR format

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

api_instance = FactPulse::AsyncTasksApi.new
task_id = 'task_id_example' # String | Celery task ID returned by /validate-pdf

begin
  # Get typed validation task status
  result = api_instance.get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get(task_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get: #{e}"
end
```

#### Using the get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ValidationTaskStatus>, Integer, Hash)> get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get_with_http_info(task_id)

```ruby
begin
  # Get typed validation task status
  data, status_code, headers = api_instance.get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get_with_http_info(task_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ValidationTaskStatus>
rescue FactPulse::ApiError => e
  puts "Error when calling AsyncTasksApi->get_validation_task_status_api_v1_processing_tasks_task_id_validation_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** | Celery task ID returned by /validate-pdf |  |

### Return type

[**ValidationTaskStatus**](ValidationTaskStatus.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

