# FactPulse::AFNORFlowExtension

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **updated_at** | **Time** | The last update date and time of the flow. When the flow is submitted updatedAt is equal to submittedAt. When the flow acknowledgment status is changed updatedAt date and time is updated.  |  |
| **flow_type** | [**AFNORFlowType**](AFNORFlowType.md) |  |  |
| **processing_rule_source** | **String** | Says whether the processing rule has been computed or the processing rule was an input parameter |  |
| **flow_direction** | [**AFNORFlowDirection**](AFNORFlowDirection.md) |  |  |
| **acknowledgement** | [**AFNORAcknowledgement**](AFNORAcknowledgement.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORFlowExtension.new(
  updated_at: null,
  flow_type: null,
  processing_rule_source: null,
  flow_direction: null,
  acknowledgement: null
)
```

