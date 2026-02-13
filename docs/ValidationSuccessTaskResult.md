# FactPulse::ValidationSuccessTaskResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;SUCCESS&#39;] |
| **validation_result** | [**PDFValidationResultAPI**](PDFValidationResultAPI.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidationSuccessTaskResult.new(
  status: null,
  validation_result: null
)
```

