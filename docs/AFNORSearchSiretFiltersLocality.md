# OpenapiClient::AFNORSearchSiretFiltersLocality

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | Municipality of the recipient structure having defined the directory line(s). | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORSearchSiretFiltersLocality.new(
  op: null,
  value: Grenoble
)
```

