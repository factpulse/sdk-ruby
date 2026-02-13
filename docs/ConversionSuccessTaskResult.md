# FactPulse::ConversionSuccessTaskResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;SUCCESS&#39;] |
| **conversion_id** | **String** |  |  |
| **document_type_code** | **Integer** |  |  |
| **profile** | **String** |  |  |
| **extraction** | [**ConversionExtractionInfo**](ConversionExtractionInfo.md) |  |  |
| **processing_time_ms** | **Integer** |  |  |
| **pdf_regenerated** | **Boolean** |  | [optional][default to false] |
| **pdf_regenerated_reason** | **String** |  | [optional] |
| **content_b64** | **String** |  | [optional] |
| **xml_content** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConversionSuccessTaskResult.new(
  status: null,
  conversion_id: null,
  document_type_code: null,
  profile: null,
  extraction: null,
  processing_time_ms: null,
  pdf_regenerated: null,
  pdf_regenerated_reason: null,
  content_b64: null,
  xml_content: null
)
```

