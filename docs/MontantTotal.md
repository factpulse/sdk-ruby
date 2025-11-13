# FactPulse::MontantTotal

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **montant_ht_total** | [**Montanthttotal**](Montanthttotal.md) |  |  |
| **montant_tva** | [**Montanttva1**](Montanttva1.md) |  |  |
| **montant_ttc_total** | [**Montantttctotal**](Montantttctotal.md) |  |  |
| **montant_a_payer** | [**Montantapayer**](Montantapayer.md) |  |  |
| **acompte** | [**MontantTotalAcompte**](MontantTotalAcompte.md) |  | [optional] |
| **montant_remise_globale_ttc** | [**MontantTotalMontantRemiseGlobaleTtc**](MontantTotalMontantRemiseGlobaleTtc.md) |  | [optional] |
| **motif_remise_globale_ttc** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::MontantTotal.new(
  montant_ht_total: null,
  montant_tva: null,
  montant_ttc_total: null,
  montant_a_payer: null,
  acompte: null,
  montant_remise_globale_ttc: null,
  motif_remise_globale_ttc: null
)
```

