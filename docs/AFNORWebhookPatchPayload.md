# FactPulse::AFNORWebhookPatchPayload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **headers** | [**Array&lt;AFNORCallbackHeader&gt;**](AFNORCallbackHeader.md) |  | [optional] |
| **authentication** | [**AFNORCallbackAuthentication**](AFNORCallbackAuthentication.md) |  | [optional] |
| **signature** | [**AFNORCallbackSignature**](AFNORCallbackSignature.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORWebhookPatchPayload.new(
  headers: null,
  authentication: null,
  signature: null
)
```

