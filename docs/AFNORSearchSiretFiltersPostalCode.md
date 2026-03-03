# FactPulse::AFNORSearchSiretFiltersPostalCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORStrictOrStartWithOperator**](AFNORStrictOrStartWithOperator.md) |  | [optional] |
| **value** | **String** | Service postal code | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSiretFiltersPostalCode.new(
  op: null,
  value: 38100
)
```

