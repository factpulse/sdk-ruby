# FactPulse::AFNORSiretSearchPost200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **search** | [**AFNORSearchSiret**](AFNORSearchSiret.md) |  | [optional] |
| **total_number_of_results** | **Integer** | The total number of results | [optional] |
| **results** | [**Array&lt;AFNORFacilityPayloadHistory&gt;**](AFNORFacilityPayloadHistory.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSiretSearchPost200Response.new(
  search: null,
  total_number_of_results: 1500,
  results: null
)
```

