# FactPulse::SoumettreFactureResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_retour** | **Integer** | Code retour (0 &#x3D; succès) |  |
| **libelle** | **String** | Message de retour |  |
| **identifiant_facture_cpp** | **Integer** |  | [optional] |
| **numero_flux_depot** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SoumettreFactureResponse.new(
  code_retour: null,
  libelle: null,
  identifiant_facture_cpp: null,
  numero_flux_depot: null
)
```

