# FactPulse::LigneDePoste

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **numero** | **Integer** |  |  |
| **reference** | **String** |  | [optional] |
| **denomination** | **String** |  |  |
| **quantite** | [**Quantite**](Quantite.md) |  |  |
| **unite** | [**Unite**](Unite.md) |  |  |
| **montant_unitaire_ht** | [**Montantunitaireht**](Montantunitaireht.md) |  |  |
| **montant_remise_ht** | [**LigneDePosteMontantRemiseHt**](LigneDePosteMontantRemiseHt.md) |  | [optional] |
| **montant_total_ligne_ht** | [**LigneDePosteMontantTotalLigneHt**](LigneDePosteMontantTotalLigneHt.md) |  | [optional] |
| **taux_tva** | **String** |  | [optional] |
| **taux_tva_manuel** | [**LigneDePosteTauxTvaManuel**](LigneDePosteTauxTvaManuel.md) |  | [optional] |
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
  montant_remise_ht: null,
  montant_total_ligne_ht: null,
  taux_tva: null,
  taux_tva_manuel: null,
  categorie_tva: null,
  date_debut_periode: null,
  date_fin_periode: null,
  code_raison_reduction: null,
  raison_reduction: null
)
```

