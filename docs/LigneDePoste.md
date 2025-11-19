# FactPulse::LigneDePoste

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **numero** | **Integer** |  |  |
| **reference** | **String** |  | [optional] |
| **denomination** | **String** |  |  |
| **quantite** | [**Quantite**](Quantite.md) |  |  |
| **unite** | [**Unite**](Unite.md) |  |  |
| **montant_unitaire_ht** | [**MontantUnitaireHt**](MontantUnitaireHt.md) |  |  |
| **montant_remise_ht** | **Float** | Montant de la remise HT. | [optional] |
| **montant_total_ligne_ht** | **Float** | Montant total HT de la ligne (quantité × prix unitaire - remise). | [optional] |
| **taux_tva** | **String** |  | [optional] |
| **taux_tva_manuel** | **Float** | Taux de TVA avec valeur manuelle. | [optional] |
| **categorie_tva** | [**CategorieTVA**](CategorieTVA.md) |  | [optional] |
| **date_debut_periode** | **String** |  | [optional] |
| **date_fin_periode** | **String** |  | [optional] |
| **code_raison_reduction** | [**CodeRaisonReduction**](CodeRaisonReduction.md) |  | [optional] |
| **raison_reduction** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::LigneDePoste.new(
  numero: null,
  reference: null,
  denomination: null,
  quantite: null,
  unite: null,
  montant_unitaire_ht: null,
  montant_remise_ht: 1000.50,
  montant_total_ligne_ht: 1000.50,
  taux_tva: null,
  taux_tva_manuel: 1000.50,
  categorie_tva: null,
  date_debut_periode: null,
  date_fin_periode: null,
  code_raison_reduction: null,
  raison_reduction: null
)
```

