# FactPulse::AFNORSearchSiretFiltersAddressLines

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | address lines of the recipient structure having defined the directory line(s). | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSiretFiltersAddressLines.new(
  op: null,
  value: 16 BIS RUE HENRI BARBUSSE - CEDEX 1 - Bâtiment le Callipso
)
```

