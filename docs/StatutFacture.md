# FactPulse::StatutFacture

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | Code statut (SOUMISE, VALIDEE, REJETEE, SUSPENDUE, MANDATEE, MISE_EN_PAIEMENT, etc.) |  |
| **libelle** | **String** | Libellé du statut |  |
| **date** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::StatutFacture.new(
  code: null,
  libelle: null,
  date: null
)
```

