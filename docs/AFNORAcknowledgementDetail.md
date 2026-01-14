# OpenapiClient::AFNORAcknowledgementDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **level** | **String** |  |  |
| **item** | **String** | Item on which the error refers |  |
| **reason_code** | [**AFNORReasonCode**](AFNORReasonCode.md) |  |  |
| **reason_message** | **String** |  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORAcknowledgementDetail.new(
  level: null,
  item: null,
  reason_code: null,
  reason_message: null
)
```

