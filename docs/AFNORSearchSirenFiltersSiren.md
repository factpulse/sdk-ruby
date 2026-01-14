# OpenapiClient::AFNORSearchSirenFiltersSiren

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | SIREN number to search for. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORSearchSirenFiltersSiren.new(
  op: null,
  value: 702042755
)
```

