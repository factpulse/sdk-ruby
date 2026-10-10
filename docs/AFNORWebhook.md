# FactPulse::AFNORWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_id** | **String** |  | [optional] |
| **signing_key** | **String** |  | [optional] |
| **created_at** | **Time** |  | [optional] |
| **callback_url** | **String** |  |  |
| **flow_types** | [**Array&lt;AFNORFlowType&gt;**](AFNORFlowType.md) |  | [optional] |
| **flow_direction** | [**AFNORFlowDirection**](AFNORFlowDirection.md) |  | [optional] |
| **ack_status** | [**AFNORFlowAckStatus**](AFNORFlowAckStatus.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORWebhook.new(
  webhook_id: null,
  signing_key: null,
  created_at: null,
  callback_url: null,
  flow_types: null,
  flow_direction: null,
  ack_status: null
)
```

