# FactPulse::SoumettreFactureCompleteResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **succes** | **Boolean** | La facture a été soumise avec succès |  |
| **destination_type** | **String** | Type de destination |  |
| **resultat_chorus** | [**ResultatChorusPro**](ResultatChorusPro.md) |  | [optional] |
| **resultat_afnor** | [**ResultatAFNOR**](ResultatAFNOR.md) |  | [optional] |
| **facture_enrichie** | [**FactureEnrichieInfoOutput**](FactureEnrichieInfoOutput.md) | Données de la facture enrichie |  |
| **pdf_facturx** | [**PDFFacturXInfo**](PDFFacturXInfo.md) | Informations sur le PDF généré |  |
| **signature** | [**SignatureInfo**](SignatureInfo.md) |  | [optional] |
| **pdf_base64** | **String** | PDF Factur-X généré (et signé si demandé) encodé en base64 |  |
| **message** | **String** | Message de retour |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SoumettreFactureCompleteResponse.new(
  succes: null,
  destination_type: null,
  resultat_chorus: null,
  resultat_afnor: null,
  facture_enrichie: null,
  pdf_facturx: null,
  signature: null,
  pdf_base64: null,
  message: null
)
```

