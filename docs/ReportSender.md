# OpenapiClient::ReportSender

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** | SIREN or SIRET number |  |
| **name** | **String** | Company name |  |
| **vat_id** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ReportSender.new(
  siren: 123456789,
  name: Ma Société SARL,
  vat_id: null
)
```

