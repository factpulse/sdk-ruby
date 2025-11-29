# FactPulse::FactureEntrante

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** |  | [optional] |
| **format_source** | [**FormatFacture**](FormatFacture.md) | Format source de la facture |  |
| **ref_fournisseur** | **String** | Numéro de facture émis par le fournisseur (BT-1) |  |
| **type_document** | [**TypeDocument**](TypeDocument.md) | Type de document (BT-3) | [optional] |
| **fournisseur** | [**FournisseurEntrant**](FournisseurEntrant.md) | Émetteur de la facture (SellerTradeParty) |  |
| **site_facturation_nom** | **String** | Nom du destinataire / votre entreprise (BT-44) |  |
| **site_facturation_siret** | **String** |  | [optional] |
| **date_de_piece** | **String** | Date de la facture (BT-2) - YYYY-MM-DD |  |
| **date_reglement** | **String** |  | [optional] |
| **devise** | **String** | Code devise ISO (BT-5) | [optional][default to &#39;EUR&#39;] |
| **montant_ht** | **String** | Montant HT total (BT-109) |  |
| **montant_tva** | **String** | Montant TVA total (BT-110) |  |
| **montant_ttc** | **String** | Montant TTC total (BT-112) |  |
| **numero_bon_commande** | **String** |  | [optional] |
| **reference_contrat** | **String** |  | [optional] |
| **objet_facture** | **String** |  | [optional] |
| **document_base64** | **String** |  | [optional] |
| **document_content_type** | **String** |  | [optional] |
| **document_filename** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FactureEntrante.new(
  flow_id: null,
  format_source: null,
  ref_fournisseur: null,
  type_document: null,
  fournisseur: null,
  site_facturation_nom: null,
  site_facturation_siret: null,
  date_de_piece: null,
  date_reglement: null,
  devise: null,
  montant_ht: null,
  montant_tva: null,
  montant_ttc: null,
  numero_bon_commande: null,
  reference_contrat: null,
  objet_facture: null,
  document_base64: null,
  document_content_type: null,
  document_filename: null
)
```

