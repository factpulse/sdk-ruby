# FactPulse::AFNORSiretInstructions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_sales_prospecting_forbidden** | **Boolean** | Indicates whether the information is forbidden from being used for sales prospecting purposes. | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSiretInstructions.new(
  is_sales_prospecting_forbidden: false
)
```

