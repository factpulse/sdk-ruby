# OpenapiClient::TaxRepresentative

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Tax representative name (BT-62). |  |
| **vat_number** | **String** | Tax representative VAT identifier (BT-63). |  |
| **postal_address** | [**PostalAddress**](PostalAddress.md) | Tax representative postal address (BG-12). |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TaxRepresentative.new(
  name: null,
  vat_number: null,
  postal_address: null
)
```

