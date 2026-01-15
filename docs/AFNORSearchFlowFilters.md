# FactPulse::AFNORSearchFlowFilters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **updated_after** | **Time** |  | [optional] |
| **updated_before** | **Time** |  | [optional] |
| **processing_rule** | [**Array&lt;AFNORProcessingRule&gt;**](AFNORProcessingRule.md) |  | [optional] |
| **flow_type** | [**Array&lt;AFNORFlowType&gt;**](AFNORFlowType.md) |  | [optional] |
| **flow_direction** | [**Array&lt;AFNORFlowDirection&gt;**](AFNORFlowDirection.md) |  | [optional] |
| **tracking_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose | [optional] |
| **ack_status** | [**AFNORFlowAckStatus**](AFNORFlowAckStatus.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchFlowFilters.new(
  updated_after: null,
  updated_before: null,
  processing_rule: null,
  flow_type: null,
  flow_direction: null,
  tracking_id: null,
  ack_status: null
)
```

