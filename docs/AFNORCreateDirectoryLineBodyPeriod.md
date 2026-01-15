# FactPulse::AFNORCreateDirectoryLineBodyPeriod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date_from** | **Date** | Effective start date of the directory line.. |  |
| **date_to** | **Date** | Effective end date of the directory line. | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORCreateDirectoryLineBodyPeriod.new(
  date_from: 2023-01-01,
  date_to: 2023-01-31
)
```

