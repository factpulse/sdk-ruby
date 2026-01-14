# OpenapiClient::FacturXPDFInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **size** | **Integer** | PDF size in bytes |  |
| **profile** | **String** | Factur-X profile used |  |
| **signed** | **Boolean** | PDF electronically signed | [optional][default to false] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::FacturXPDFInfo.new(
  size: null,
  profile: null,
  signed: null
)
```

