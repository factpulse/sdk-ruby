# FactPulse::EReportingValidationError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **field** | **String** | Field path with error |  |
| **message** | **String** | Error message |  |
| **code** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::EReportingValidationError.new(
  field: null,
  message: null,
  code: null
)
```

