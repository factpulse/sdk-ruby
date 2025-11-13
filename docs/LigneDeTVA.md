# FactPulse::LigneDeTVA

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **montant_base_ht** | [**Montantbaseht**](Montantbaseht.md) |  |  |
| **montant_tva** | [**Montanttva**](Montanttva.md) |  |  |
| **taux** | **String** |  | [optional] |
| **taux_manuel** | [**Tauxmanuel**](Tauxmanuel.md) |  | [optional] |
| **categorie** | [**CategorieTVA**](CategorieTVA.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::LigneDeTVA.new(
  montant_base_ht: null,
  montant_tva: null,
  taux: null,
  taux_manuel: null,
  categorie: null
)
```

