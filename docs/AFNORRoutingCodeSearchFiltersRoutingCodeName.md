# FactPulse::AFNORRoutingCodeSearchFiltersRoutingCodeName

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOrStrictOperator**](AFNORContainsOrStrictOperator.md) |  | [optional] |
| **value** | **String** | Name of the routing code. | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORRoutingCodeSearchFiltersRoutingCodeName.new(
  op: null,
  value: Libellé Code routage
)
```

