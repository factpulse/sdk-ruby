# FactPulse::SignatureTaskStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** |  |  |
| **status** | [**CeleryStatus**](CeleryStatus.md) |  |  |
| **result** | [**SignatureTaskStatusResult**](SignatureTaskStatusResult.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SignatureTaskStatus.new(
  task_id: null,
  status: null,
  result: null
)
```

