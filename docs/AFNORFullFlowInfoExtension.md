# FactPulse::AFNORFullFlowInfoExtension

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose |  |
| **submitted_at** | **Time** | The flow submission date and time (the date and time when the flow was created on the system) This property should be used by the API consumer as a time reference to avoid clock synchronization issues  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORFullFlowInfoExtension.new(
  flow_id: null,
  submitted_at: null
)
```

