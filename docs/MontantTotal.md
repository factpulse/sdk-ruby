# FactPulse::MontantTotal

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **montant_ht_total** | **Float** | Montant total HT. |  |
| **montant_tva** | **Float** | Montant total de la TVA. |  |
| **montant_ttc_total** | **Float** | Montant total TTC. |  |
| **montant_a_payer** | **Float** | Montant à payer. |  |
| **acompte** | **Float** | Acompte versé. | [optional] |
| **montant_remise_globale_ttc** | **Float** | Montant de la remise globale TTC. | [optional] |
| **motif_remise_globale_ttc** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::MontantTotal.new(
  montant_ht_total: 1000.50,
  montant_tva: 1000.50,
  montant_ttc_total: 1000.50,
  montant_a_payer: 1000.50,
  acompte: 1000.50,
  montant_remise_globale_ttc: 1000.50,
  motif_remise_globale_ttc: null
)
```

