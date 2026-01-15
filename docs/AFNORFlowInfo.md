# FactPulse::AFNORFlowInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tracking_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose | [optional] |
| **name** | **String** | Name of the file | [optional] |
| **processing_rule** | [**AFNORProcessingRule**](AFNORProcessingRule.md) |  | [optional] |
| **flow_syntax** | [**AFNORFlowSyntax**](AFNORFlowSyntax.md) |  |  |
| **flow_profile** | [**AFNORFlowProfile**](AFNORFlowProfile.md) |  | [optional] |
| **sha256** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORFlowInfo.new(
  tracking_id: null,
  name: null,
  processing_rule: null,
  flow_syntax: null,
  flow_profile: null,
  sha256: null
)
```

