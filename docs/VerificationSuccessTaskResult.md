# FactPulse::VerificationSuccessTaskResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;SUCCESS&#39;] |
| **verification_result** | [**VerificationSuccessResponse**](VerificationSuccessResponse.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::VerificationSuccessTaskResult.new(
  status: null,
  verification_result: null
)
```

