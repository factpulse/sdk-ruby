# FactPulse::ConversionTaskStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** |  |  |
| **status** | [**CeleryStatus**](CeleryStatus.md) |  |  |
| **result** | [**ConversionTaskStatusResult**](ConversionTaskStatusResult.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConversionTaskStatus.new(
  task_id: null,
  status: null,
  result: null
)
```

