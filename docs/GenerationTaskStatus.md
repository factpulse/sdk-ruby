# FactPulse::GenerationTaskStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** |  |  |
| **status** | [**CeleryStatus**](CeleryStatus.md) |  |  |
| **result** | [**GenerationTaskStatusResult**](GenerationTaskStatusResult.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GenerationTaskStatus.new(
  task_id: null,
  status: null,
  result: null
)
```

