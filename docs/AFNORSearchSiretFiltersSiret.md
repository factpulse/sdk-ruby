# OpenapiClient::AFNORSearchSiretFiltersSiret

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | SIRET number to search for. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORSearchSiretFiltersSiret.new(
  op: null,
  value: 70204275500000
)
```

