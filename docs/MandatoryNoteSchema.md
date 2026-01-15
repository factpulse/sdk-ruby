# FactPulse::MandatoryNoteSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **subject_code** | **String** | Subject code (PMT, PMD, AAB) |  |
| **label** | **String** | Label (e.g., Recovery indemnity) |  |
| **pdf_value** | **String** |  | [optional] |
| **xml_value** | **String** |  | [optional] |
| **status** | [**FieldStatus**](FieldStatus.md) | Compliance status (COMPLIANT if XML found in PDF) | [optional] |
| **message** | **String** |  | [optional] |
| **bbox** | [**BoundingBoxSchema**](BoundingBoxSchema.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::MandatoryNoteSchema.new(
  subject_code: null,
  label: null,
  pdf_value: null,
  xml_value: null,
  status: null,
  message: null,
  bbox: null
)
```

