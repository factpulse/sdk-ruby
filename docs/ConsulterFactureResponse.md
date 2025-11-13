# FactPulse::ConsulterFactureResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_retour** | **Integer** |  |  |
| **libelle** | **String** |  |  |
| **identifiant_facture_cpp** | **Integer** |  | [optional] |
| **numero_facture** | **String** |  | [optional] |
| **date_facture** | **String** |  | [optional] |
| **montant_ttc_total** | **String** |  | [optional] |
| **statut_courant** | [**StatutFacture**](StatutFacture.md) |  | [optional] |
| **id_structure_cpp_destinataire** | **Integer** |  | [optional] |
| **designation_structure_destinataire** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConsulterFactureResponse.new(
  code_retour: null,
  libelle: null,
  identifiant_facture_cpp: null,
  numero_facture: null,
  date_facture: null,
  montant_ttc_total: null,
  statut_courant: null,
  id_structure_cpp_destinataire: null,
  designation_structure_destinataire: null
)
```

