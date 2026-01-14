# OpenapiClient::AFNORHealthCheckResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_service_ok** | **Boolean** | Flow Service API status |  |
| **directory_service_ok** | **Boolean** | Directory Service API status |  |
| **message** | **String** | Descriptive status message |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORHealthCheckResponse.new(
  flow_service_ok: null,
  directory_service_ok: null,
  message: null
)
```

