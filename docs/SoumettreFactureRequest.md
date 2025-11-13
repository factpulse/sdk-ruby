# FactPulse::SoumettreFactureRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **numero_facture** | **String** | Numéro de la facture |  |
| **date_facture** | **String** | Date de facture (format ISO: YYYY-MM-DD) |  |
| **date_echeance_paiement** | **String** |  | [optional] |
| **id_structure_cpp** | **Integer** | ID Chorus Pro de la structure destinataire |  |
| **code_service** | **String** |  | [optional] |
| **numero_engagement** | **String** |  | [optional] |
| **montant_ht_total** | [**MontantHtTotal1**](MontantHtTotal1.md) |  |  |
| **montant_tva** | [**MontantTva1**](MontantTva1.md) |  |  |
| **montant_ttc_total** | [**MontantTtcTotal1**](MontantTtcTotal1.md) |  |  |
| **piece_jointe_principale_id** | **Integer** |  | [optional] |
| **piece_jointe_principale_designation** | **String** |  | [optional] |
| **commentaire** | **String** |  | [optional] |
| **numero_bon_commande** | **String** |  | [optional] |
| **numero_marche** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SoumettreFactureRequest.new(
  credentials: null,
  numero_facture: null,
  date_facture: null,
  date_echeance_paiement: null,
  id_structure_cpp: null,
  code_service: null,
  numero_engagement: null,
  montant_ht_total: null,
  montant_tva: null,
  montant_ttc_total: null,
  piece_jointe_principale_id: null,
  piece_jointe_principale_designation: null,
  commentaire: null,
  numero_bon_commande: null,
  numero_marche: null
)
```

