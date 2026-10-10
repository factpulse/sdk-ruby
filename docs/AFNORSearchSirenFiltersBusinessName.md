# FactPulse::AFNORSearchSirenFiltersBusinessName

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOrStrictOrStartWithOperator**](AFNORContainsOrStrictOrStartWithOperator.md) |  | [optional] |
| **value** | **String** | Business name | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSirenFiltersBusinessName.new(
  op: null,
  value: Boulangerie Pascale
)
```

