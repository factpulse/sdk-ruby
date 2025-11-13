# FactPulse::SoumettreFactureCompleteRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **donnees_facture** | [**DonneesFactureSimplifiees**](DonneesFactureSimplifiees.md) | Données de la facture au format simplifié (voir exemples) |  |
| **pdf_source** | **String** | PDF source encodé en base64 (sera transformé en Factur-X) |  |
| **destination** | [**Destination**](Destination.md) |  |  |
| **signature** | [**ParametresSignature**](ParametresSignature.md) |  | [optional] |
| **options** | [**OptionsProcessing**](OptionsProcessing.md) | Options de traitement | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SoumettreFactureCompleteRequest.new(
  donnees_facture: null,
  pdf_source: null,
  destination: null,
  signature: null,
  options: null
)
```

