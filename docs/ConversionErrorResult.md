# FactPulse::ConversionErrorResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;ERROR&#39;] |
| **conversion_id** | **String** |  | [optional] |
| **error_code** | **String** |  |  |
| **error_message** | **String** |  |  |
| **details** | [**Array&lt;AFNORErrorDetail&gt;**](AFNORErrorDetail.md) |  | [optional] |
| **traceback** | **String** |  | [optional] |
| **processing_time_ms** | **Integer** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConversionErrorResult.new(
  status: null,
  conversion_id: null,
  error_code: null,
  error_message: null,
  details: null,
  traceback: null,
  processing_time_ms: null
)
```

