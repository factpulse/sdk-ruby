# FactPulse::LigneDeTVA

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **montant_base_ht** | **Float** | Montant de la base HT pour cette ligne de TVA. |  |
| **montant_tva** | **Float** | Montant de la TVA pour cette ligne. |  |
| **taux** | **String** |  | [optional] |
| **taux_manuel** | **Float** | Taux de TVA avec valeur manuelle. | [optional] |
| **categorie** | [**CategorieTVA**](CategorieTVA.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::LigneDeTVA.new(
  montant_base_ht: 1000.50,
  montant_tva: 1000.50,
  taux: null,
  taux_manuel: 1000.50,
  categorie: null
)
```

