# FactPulse::ReportIssuer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** | SIREN or SIRET of the declarant (French company) |  |
| **name** | **String** |  | [optional] |
| **vat_id** | **String** |  | [optional] |
| **role_code** | [**IssuerRoleCode**](IssuerRoleCode.md) | Role of the declarant (TT-15). SE&#x3D;Seller (B2Bi: French seller to foreign buyer). BY&#x3D;Buyer (Bi2B: French buyer from foreign seller). | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ReportIssuer.new(
  siren: 123456789,
  name: null,
  vat_id: null,
  role_code: null
)
```

