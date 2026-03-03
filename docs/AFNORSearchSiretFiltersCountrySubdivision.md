# FactPulse::AFNORSearchSiretFiltersCountrySubdivision

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORStrictOperator**](AFNORStrictOperator.md) |  | [optional] |
| **value** | **String** | Subdivision of the country | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSiretFiltersCountrySubdivision.new(
  op: null,
  value: Bretagne
)
```

