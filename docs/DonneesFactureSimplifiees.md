# FactPulse::DonneesFactureSimplifiees

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **numero** | **String** | Numéro de facture unique |  |
| **emetteur** | **Hash&lt;String, Object&gt;** | Informations sur l&#39;émetteur (siret, iban, ...) |  |
| **destinataire** | **Hash&lt;String, Object&gt;** | Informations sur le destinataire (siret, ...) |  |
| **lignes** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Lignes de la facture |  |
| **date** | **String** |  | [optional] |
| **echeance_jours** | **Integer** | Échéance en jours (défaut: 30) | [optional][default to 30] |
| **commentaire** | **String** |  | [optional] |
| **numero_bon_commande** | **String** |  | [optional] |
| **numero_marche** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::DonneesFactureSimplifiees.new(
  numero: null,
  emetteur: null,
  destinataire: null,
  lignes: null,
  date: null,
  echeance_jours: null,
  commentaire: null,
  numero_bon_commande: null,
  numero_marche: null
)
```

