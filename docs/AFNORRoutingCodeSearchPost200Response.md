# FactPulse::AFNORRoutingCodeSearchPost200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **search** | [**AFNORRoutingCodeSearch**](AFNORRoutingCodeSearch.md) |  | [optional] |
| **total_number_of_results** | **Integer** | The total number of results | [optional] |
| **results** | [**Array&lt;AFNORRoutingCodePayloadHistoryLegalUnitFacility&gt;**](AFNORRoutingCodePayloadHistoryLegalUnitFacility.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORRoutingCodeSearchPost200Response.new(
  search: null,
  total_number_of_results: 1500,
  results: null
)
```

