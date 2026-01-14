# OpenapiClient::ElectronicAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **identifier** | **String** | Electronic address identifier (e.g., SIREN, SIRET, routing code) |  |
| **scheme_id** | [**SchemeID**](SchemeID.md) | Identification scheme (EAS code) | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ElectronicAddress.new(
  identifier: null,
  scheme_id: null
)
```

