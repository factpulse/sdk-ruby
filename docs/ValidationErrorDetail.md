# OpenapiClient::ValidationErrorDetail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **level** | [**ErrorLevel**](ErrorLevel.md) | Severity level: &#39;Error&#39; or &#39;Warning&#39; | [optional] |
| **item** | **String** | Identifier of the concerned element (XPath, field, BR-FR rule, etc.) |  |
| **reason** | **String** | Error description |  |
| **source** | [**ErrorSource**](ErrorSource.md) |  | [optional] |
| **code** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ValidationErrorDetail.new(
  level: null,
  item: null,
  reason: null,
  source: null,
  code: null
)
```

