# FactPulse::AFNORRoutingCodeSearchFiltersRoutingIdentifier

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | Routing identifier for a routing code. | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORRoutingCodeSearchFiltersRoutingIdentifier.new(
  op: null,
  value: dcsc456sdcsdcs556
)
```

