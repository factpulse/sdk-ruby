# FactPulse::AFNORSearchSiretFiltersLocality

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | Municipality of the recipient structure having defined the directory line(s). | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSiretFiltersLocality.new(
  op: null,
  value: Grenoble
)
```

