# FactPulse::AsyncTasksApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_task_status_api_v1_processing_tasks_task_id_status_get**](AsyncTasksApi.md#get_task_status_api_v1_processing_tasks_task_id_status_get) | **GET** /api/v1/processing/tasks/{task_id}/status | Get task generation status |


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

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

