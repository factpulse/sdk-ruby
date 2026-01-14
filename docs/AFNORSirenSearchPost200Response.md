# OpenapiClient::AFNORSirenSearchPost200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **search** | [**AFNORSearchSiren**](AFNORSearchSiren.md) |  | [optional] |
| **total_number_of_results** | **Integer** | The total number of results | [optional] |
| **results** | [**Array&lt;AFNORLegalUnitPayloadHistory&gt;**](AFNORLegalUnitPayloadHistory.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORSirenSearchPost200Response.new(
  search: null,
  total_number_of_results: 1500,
  results: null
)
```

