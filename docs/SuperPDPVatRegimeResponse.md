# FactPulse::SuperPDPVatRegimeResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vat_regime** | **String** |  | [optional] |
| **has_vat_on_debits** | **Boolean** | Whether VAT on debits is opted for | [optional][default to false] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SuperPDPVatRegimeResponse.new(
  vat_regime: null,
  has_vat_on_debits: null
)
```

