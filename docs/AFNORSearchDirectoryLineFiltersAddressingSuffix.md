# FactPulse::AFNORSearchDirectoryLineFiltersAddressingSuffix

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORStrictOperator**](AFNORStrictOperator.md) |  | [optional] |
| **value** | **String** | suffix of the directory line which defines an address mesh not attached to a facility | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchDirectoryLineFiltersAddressingSuffix.new(
  op: null,
  value: dcsc456sdcsdcs556
)
```

