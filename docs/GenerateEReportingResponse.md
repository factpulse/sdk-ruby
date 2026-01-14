# OpenapiClient::GenerateEReportingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **report_id** | **String** | Report identifier |  |
| **flow_type** | **String** | Flux type |  |
| **xml** | **String** | Generated XML content |  |
| **xml_size** | **Integer** | XML size in bytes |  |
| **message** | **String** | Status message |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenerateEReportingResponse.new(
  report_id: null,
  flow_type: null,
  xml: null,
  xml_size: null,
  message: null
)
```

