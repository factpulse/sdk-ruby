# FactPulse::SearchFlowRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **updated_after** | **Time** |  | [optional] |
| **updated_before** | **Time** |  | [optional] |
| **flow_types** | [**Array&lt;FlowType&gt;**](FlowType.md) |  | [optional] |
| **flow_directions** | [**Array&lt;FlowDirection&gt;**](FlowDirection.md) |  | [optional] |
| **tracking_id** | **String** |  | [optional] |
| **flow_id** | **String** |  | [optional] |
| **acknowledgment_status** | [**AcknowledgmentStatus**](AcknowledgmentStatus.md) |  | [optional] |
| **offset** | **Integer** | Offset for pagination | [optional][default to 0] |
| **limit** | **Integer** | Maximum number of results (max 100) | [optional][default to 25] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SearchFlowRequest.new(
  updated_after: null,
  updated_before: null,
  flow_types: null,
  flow_directions: null,
  tracking_id: null,
  flow_id: null,
  acknowledgment_status: null,
  offset: null,
  limit: null
)
```

