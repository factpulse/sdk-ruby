# FactPulse::AFNORFlowInfoExtension

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sha256** | **String** | The sha256 is the fingerprint of the attached file: - if provided in the request: it should be checked once received - if not provided in the request: it may be computed and returned in the response  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORFlowInfoExtension.new(
  sha256: null
)
```

