# FactPulse::ConversionPendingInputResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;PENDING_INPUT&#39;] |
| **conversion_id** | **String** |  |  |
| **message** | **String** |  |  |
| **missing_fields** | **Array&lt;String&gt;** |  |  |
| **extracted_data** | **Hash&lt;String, Object&gt;** |  |  |
| **confidence_score** | **Float** |  |  |
| **processing_time_ms** | **Integer** |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConversionPendingInputResult.new(
  status: null,
  conversion_id: null,
  message: null,
  missing_fields: null,
  extracted_data: null,
  confidence_score: null,
  processing_time_ms: null
)
```

