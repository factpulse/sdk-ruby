# FactPulse::AFNORWebhookMetadata

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **processing_rule** | [**AFNORProcessingRule**](AFNORProcessingRule.md) |  | [optional] |
| **flow_type** | [**AFNORFlowType**](AFNORFlowType.md) |  |  |
| **flow_direction** | [**AFNORFlowDirection**](AFNORFlowDirection.md) |  |  |
| **ack_status** | [**AFNORFlowAckStatus**](AFNORFlowAckStatus.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORWebhookMetadata.new(
  processing_rule: null,
  flow_type: null,
  flow_direction: null,
  ack_status: null
)
```

