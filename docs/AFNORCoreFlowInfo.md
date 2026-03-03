# FactPulse::AFNORCoreFlowInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tracking_id** | **String** | The tracking id is an external identifier and is used to track the flow by the sender | [optional] |
| **name** | **String** | Name of the file |  |
| **processing_rule** | [**AFNORProcessingRule**](AFNORProcessingRule.md) |  | [optional] |
| **flow_syntax** | [**AFNORFlowSyntax**](AFNORFlowSyntax.md) |  |  |
| **flow_profile** | [**AFNORFlowProfile**](AFNORFlowProfile.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORCoreFlowInfo.new(
  tracking_id: null,
  name: null,
  processing_rule: null,
  flow_syntax: null,
  flow_profile: null
)
```

