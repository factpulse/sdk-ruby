# FactPulse::FactureFacturX

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **numero_facture** | **String** |  |  |
| **date_echeance_paiement** | **String** |  |  |
| **date_facture** | **String** |  | [optional] |
| **mode_depot** | [**ModeDepot**](ModeDepot.md) |  |  |
| **destinataire** | [**Destinataire**](Destinataire.md) |  |  |
| **fournisseur** | [**Fournisseur**](Fournisseur.md) |  |  |
| **cadre_de_facturation** | [**CadreDeFacturation**](CadreDeFacturation.md) |  |  |
| **references** | [**References**](References.md) |  |  |
| **montant_total** | [**MontantTotal**](MontantTotal.md) |  |  |
| **lignes_de_poste** | [**Array&lt;LigneDePoste&gt;**](LigneDePoste.md) |  | [optional] |
| **lignes_de_tva** | [**Array&lt;LigneDeTVA&gt;**](LigneDeTVA.md) |  | [optional] |
| **commentaire** | **String** |  | [optional] |
| **id_utilisateur_courant** | **Integer** |  | [optional] |
| **pieces_jointes_complementaires** | [**Array&lt;PieceJointeComplementaire&gt;**](PieceJointeComplementaire.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FactureFacturX.new(
  numero_facture: null,
  date_echeance_paiement: null,
  date_facture: null,
  mode_depot: null,
  destinataire: null,
  fournisseur: null,
  cadre_de_facturation: null,
  references: null,
  montant_total: null,
  lignes_de_poste: null,
  lignes_de_tva: null,
  commentaire: null,
  id_utilisateur_courant: null,
  pieces_jointes_complementaires: null
)
```

