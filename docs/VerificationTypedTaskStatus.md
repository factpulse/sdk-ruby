# FactPulse::VerificationTypedTaskStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **task_id** | **String** |  |  |
| **status** | [**CeleryStatus**](CeleryStatus.md) |  |  |
| **result** | [**VerificationTypedTaskStatusResult**](VerificationTypedTaskStatusResult.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::VerificationTypedTaskStatus.new(
  task_id: null,
  status: null,
  result: null
)
```

