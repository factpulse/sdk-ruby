# FactPulse::FactureEnrichieInfoInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **numero_facture** | **String** |  |  |
| **id_emetteur** | **Integer** |  | [optional] |
| **id_destinataire** | **Integer** |  | [optional] |
| **nom_emetteur** | **String** |  |  |
| **nom_destinataire** | **String** |  |  |
| **montant_ht_total** | [**MontantHtTotal**](MontantHtTotal.md) |  |  |
| **montant_tva** | [**MontantTva**](MontantTva.md) |  |  |
| **montant_ttc_total** | [**MontantTtcTotal**](MontantTtcTotal.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FactureEnrichieInfoInput.new(
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

