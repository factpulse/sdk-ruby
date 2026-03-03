# FactPulse::AFNORSearchSirenFiltersSiren

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORStrictOperator**](AFNORStrictOperator.md) |  | [optional] |
| **value** | **String** | SIREN number to search for. | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSirenFiltersSiren.new(
  op: null,
  value: 702042755
)
```

