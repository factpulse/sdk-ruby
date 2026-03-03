# FactPulse::AFNORFullFlowInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose |  |
| **submitted_at** | **Time** | The flow submission date and time (the date and time when the flow was created on the system) This property should be used by the API consumer as a time reference to avoid clock synchronization issues  |  |
| **tracking_id** | **String** | The tracking id is an external identifier and is used to track the flow by the sender | [optional] |
| **name** | **String** | Name of the file |  |
| **processing_rule** | [**AFNORProcessingRule**](AFNORProcessingRule.md) |  | [optional] |
| **flow_syntax** | [**AFNORFlowSyntax**](AFNORFlowSyntax.md) |  |  |
| **flow_profile** | [**AFNORFlowProfile**](AFNORFlowProfile.md) |  | [optional] |
| **sha256** | **String** | The sha256 is the fingerprint of the attached file: - if provided in the request: it should be checked once received - if not provided in the request: it may be computed and returned in the response  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORFullFlowInfo.new(
  flow_id: null,
  submitted_at: null,
  tracking_id: null,
  name: null,
  processing_rule: null,
  flow_syntax: null,
  flow_profile: null,
  sha256: null
)
```

