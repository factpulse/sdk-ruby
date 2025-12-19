# FactPulse::FlowSummary

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** |  |  |
| **tracking_id** | **String** |  | [optional] |
| **name** | **String** |  |  |
| **flow_type** | **String** |  | [optional] |
| **flow_direction** | **String** |  | [optional] |
| **acknowledgment_status** | **String** |  | [optional] |
| **created_at** | **String** |  | [optional] |
| **updated_at** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FlowSummary.new(
  flow_id: null,
  tracking_id: null,
  name: null,
  flow_type: null,
  flow_direction: null,
  acknowledgment_status: null,
  created_at: null,
  updated_at: null
)
```

