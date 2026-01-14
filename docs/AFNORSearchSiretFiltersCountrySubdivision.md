# OpenapiClient::AFNORSearchSiretFiltersCountrySubdivision

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **op** | [**AFNORContainsOperator**](AFNORContainsOperator.md) |  | [optional] |
| **value** | **String** | Subdivision of the country | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORSearchSiretFiltersCountrySubdivision.new(
  op: null,
  value: Bretagne
)
```

