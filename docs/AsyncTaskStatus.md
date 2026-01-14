# OpenapiClient::AsyncTaskStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** | Unique task identifier |  |
| **status** | [**CeleryStatus**](CeleryStatus.md) | Celery task status (PENDING, STARTED, SUCCESS, FAILURE, RETRY) |  |
| **result** | **Hash&lt;String, Object&gt;** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AsyncTaskStatus.new(
  task_id: null,
  status: null,
  result: null
)
```

