# FactPulse::AFNORCallbackParameters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** |  |  |
| **headers** | [**Array&lt;AFNORCallbackHeader&gt;**](AFNORCallbackHeader.md) |  | [optional] |
| **authentication** | [**AFNORCallbackAuthentication**](AFNORCallbackAuthentication.md) |  | [optional] |
| **signature** | [**AFNORCallbackSignature**](AFNORCallbackSignature.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORCallbackParameters.new(
  url: null,
  headers: null,
  authentication: null,
  signature: null
)
```

