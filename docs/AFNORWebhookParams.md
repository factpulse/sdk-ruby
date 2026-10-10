# FactPulse::AFNORWebhookParams

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **callback_url** | **String** |  |  |
| **flow_types** | [**Array&lt;AFNORFlowType&gt;**](AFNORFlowType.md) |  | [optional] |
| **flow_direction** | [**AFNORFlowDirection**](AFNORFlowDirection.md) |  | [optional] |
| **ack_status** | [**AFNORFlowAckStatus**](AFNORFlowAckStatus.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORWebhookParams.new(
  callback_url: null,
  flow_types: null,
  flow_direction: null,
  ack_status: null
)
```

