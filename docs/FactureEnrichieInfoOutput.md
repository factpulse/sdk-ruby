# FactPulse::FactureEnrichieInfoOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **numero_facture** | **String** |  |  |
| **id_emetteur** | **Integer** |  | [optional] |
| **id_destinataire** | **Integer** |  | [optional] |
| **nom_emetteur** | **String** |  |  |
| **nom_destinataire** | **String** |  |  |
| **montant_ht_total** | **String** |  |  |
| **montant_tva** | **String** |  |  |
| **montant_ttc_total** | **String** |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FactureEnrichieInfoOutput.new(
  numero_facture: null,
  id_emetteur: null,
  id_destinataire: null,
  nom_emetteur: null,
  nom_destinataire: null,
  montant_ht_total: null,
  montant_tva: null,
  montant_ttc_total: null
)
```

