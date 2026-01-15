# FactPulse::AFNORSearchSiretFiltersCountrySubdivision

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | Subdivision of the country | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSiretFiltersCountrySubdivision.new(
  op: null,
  value: Bretagne
)
```

