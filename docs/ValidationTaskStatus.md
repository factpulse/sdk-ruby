# FactPulse::ValidationTaskStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** |  |  |
| **status** | [**CeleryStatus**](CeleryStatus.md) |  |  |
| **result** | [**ValidationTaskStatusResult**](ValidationTaskStatusResult.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidationTaskStatus.new(
  task_id: null,
  status: null,
  result: null
)
```

