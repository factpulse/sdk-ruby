# FactPulse::ChampVerifieSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_term** | **String** | Business Term EN16931 (ex: BT-1) |  |
| **label** | **String** | Libellé du champ (ex: N° Facture) |  |
| **valeur_pdf** | **String** |  | [optional] |
| **valeur_xml** | **String** |  | [optional] |
| **statut** | [**StatutChampAPI**](StatutChampAPI.md) | Statut de conformité |  |
| **message** | **String** |  | [optional] |
| **confiance** | **Float** | Score de confiance (0-1) | [optional][default to 1.0] |
| **source** | **String** | Source d&#39;extraction | [optional][default to &#39;pdf_natif&#39;] |
| **bbox** | [**BoundingBoxSchema**](BoundingBoxSchema.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ChampVerifieSchema.new(
  business_term: null,
  label: null,
  valeur_pdf: null,
  valeur_xml: null,
  statut: null,
  message: null,
  confiance: null,
  source: null,
  bbox: null
)
```

