# FactPulse::NoteObligatoireSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_sujet** | **String** | Code sujet (PMT, PMD, AAB) |  |
| **label** | **String** | Libellé (ex: Indemnité recouvrement) |  |
| **valeur_pdf** | **String** |  | [optional] |
| **valeur_xml** | **String** |  | [optional] |
| **statut** | [**StatutChampAPI**](StatutChampAPI.md) | Statut de conformité (CONFORME si XML trouvé dans PDF) | [optional] |
| **message** | **String** |  | [optional] |
| **bbox** | [**BoundingBoxSchema**](BoundingBoxSchema.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::NoteObligatoireSchema.new(
  code_sujet: null,
  label: null,
  valeur_pdf: null,
  valeur_xml: null,
  statut: null,
  message: null,
  bbox: null
)
```

