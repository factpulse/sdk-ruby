# FactPulse::ConversionValidationFailedResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;VALIDATION_FAILED&#39;] |
| **conversion_id** | **String** |  |  |
| **message** | **String** |  |  |
| **extracted_data** | **Hash&lt;String, Object&gt;** |  |  |
| **extraction** | [**ConversionExtractionInfo**](ConversionExtractionInfo.md) |  | [optional] |
| **validation_errors** | **Array&lt;Hash&lt;String, Object&gt;&gt;** |  | [optional] |
| **profile** | **String** |  |  |
| **processing_time_ms** | **Integer** |  |  |
| **correction_attempted** | **Boolean** |  | [optional][default to false] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConversionValidationFailedResult.new(
  status: null,
  conversion_id: null,
  message: null,
  extracted_data: null,
  extraction: null,
  validation_errors: null,
  profile: null,
  processing_time_ms: null,
  correction_attempted: null
)
```

