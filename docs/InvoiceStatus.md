# FactPulse::InvoiceStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | Status code (SOUMISE, VALIDEE, REJETEE, SUSPENDUE, MANDATEE, MISE_EN_PAIEMENT, etc.) |  |
| **label** | **String** | Status label |  |
| **date** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InvoiceStatus.new(
  code: null,
  label: null,
  date: null
)
```

