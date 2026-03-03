# FactPulse::AFNORFlow

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tracking_id** | **String** | The tracking id is an external identifier and is used to track the flow by the sender | [optional] |
| **name** | **String** | Name of the file |  |
| **processing_rule** | [**AFNORProcessingRule**](AFNORProcessingRule.md) |  | [optional] |
| **flow_syntax** | [**AFNORFlowSyntax**](AFNORFlowSyntax.md) |  |  |
| **flow_profile** | [**AFNORFlowProfile**](AFNORFlowProfile.md) |  | [optional] |
| **flow_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose |  |
| **submitted_at** | **Time** | The flow submission date and time (the date and time when the flow was created on the system) This property should be used by the API consumer as a time reference to avoid clock synchronization issues  |  |
| **updated_at** | **Time** | The last update date and time of the flow. When the flow is submitted updatedAt is equal to submittedAt. When the flow acknowledgment status is changed updatedAt date and time is updated.  |  |
| **flow_type** | [**AFNORFlowType**](AFNORFlowType.md) |  |  |
| **processing_rule_source** | **String** | Says whether the processing rule has been computed or the processing rule was an input parameter |  |
| **flow_direction** | [**AFNORFlowDirection**](AFNORFlowDirection.md) |  |  |
| **acknowledgement** | [**AFNORAcknowledgement**](AFNORAcknowledgement.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORFlow.new(
  tracking_id: null,
  name: null,
  processing_rule: null,
  flow_syntax: null,
  flow_profile: null,
  flow_id: null,
  submitted_at: null,
  updated_at: null,
  flow_type: null,
  processing_rule_source: null,
  flow_direction: null,
  acknowledgement: null
)
```

