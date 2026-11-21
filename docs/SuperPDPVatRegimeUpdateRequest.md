# FactPulse::SuperPDPVatRegimeUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **vat_regime** | **String** | monthly (réel normal mensuel), quarterly (réel normal trimestriel), simplified (régime simplifié), vat_exemption (franchise en base) |  |
| **has_vat_on_debits** | **Boolean** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SuperPDPVatRegimeUpdateRequest.new(
  vat_regime: null,
  has_vat_on_debits: null
)
```

