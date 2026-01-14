# OpenapiClient::ExtractionInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confidence_score** | **Float** | Score de confiance global (0-1) |  |
| **fields_extracted** | **Integer** | Nombre de champs extraits |  |
| **fields_enriched** | **Integer** | Nombre de champs enrichis automatiquement | [optional][default to 0] |
| **fields_missing** | **Integer** | Nombre de champs manquants | [optional][default to 0] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ExtractionInfo.new(
  confidence_score: null,
  fields_extracted: null,
  fields_enriched: null,
  fields_missing: null
)
```

