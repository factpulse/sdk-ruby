# FactPulse::References

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **devise_facture** | **String** |  | [optional][default to &#39;EUR&#39;] |
| **mode_paiement** | [**ModePaiement**](ModePaiement.md) |  |  |
| **type_facture** | [**TypeFacture**](TypeFacture.md) |  |  |
| **type_tva** | [**TypeTVA**](TypeTVA.md) |  |  |
| **numero_marche** | **String** |  | [optional] |
| **motif_exoneration_tva** | **String** |  | [optional] |
| **numero_bon_commande** | **String** |  | [optional] |
| **numero_facture_origine** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::References.new(
  devise_facture: null,
  mode_paiement: null,
  type_facture: null,
  type_tva: null,
  numero_marche: null,
  motif_exoneration_tva: null,
  numero_bon_commande: null,
  numero_facture_origine: null
)
```

