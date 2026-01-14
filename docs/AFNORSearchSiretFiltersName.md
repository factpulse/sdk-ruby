# OpenapiClient::AFNORSearchSiretFiltersName

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | business name | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORSearchSiretFiltersName.new(
  op: null,
  value: Boulangerie Pascale
)
```

