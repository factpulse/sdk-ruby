# OpenapiClient::VerifiedFieldSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_term** | **String** | EN16931 Business Term (e.g., BT-1) |  |
| **label** | **String** | Field label (e.g., Invoice Number) |  |
| **pdf_value** | **String** |  | [optional] |
| **xml_value** | **String** |  | [optional] |
| **status** | [**FieldStatus**](FieldStatus.md) | Compliance status |  |
| **message** | **String** |  | [optional] |
| **confidence** | **Float** | Confidence score (0-1) | [optional][default to 1.0] |
| **source** | **String** | Extraction source | [optional][default to &#39;native_pdf&#39;] |
| **bbox** | [**BoundingBoxSchema**](BoundingBoxSchema.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::VerifiedFieldSchema.new(
  business_term: null,
  label: null,
  pdf_value: null,
  xml_value: null,
  status: null,
  message: null,
  confidence: null,
  source: null,
  bbox: null
)
```

