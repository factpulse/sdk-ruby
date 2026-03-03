# FactPulse::AFNORSearchDirectoryLineFiltersAddressingIdentifier

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOrStrictOperator**](AFNORContainsOrStrictOperator.md) |  | [optional] |
| **value** | **String** | Addressing identifier of the directory line. | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchDirectoryLineFiltersAddressingIdentifier.new(
  op: null,
  value: dcsc456sdcsdcs556
)
```

