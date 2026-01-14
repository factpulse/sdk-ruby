# FactPulse::AFNORDirectoryLineSearchPost200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **search** | [**AFNORSearchDirectoryLine**](AFNORSearchDirectoryLine.md) |  | [optional] |
| **total_number_of_results** | **Integer** | The total number of results | [optional] |
| **results** | [**Array&lt;AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode&gt;**](AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORDirectoryLineSearchPost200Response.new(
  search: null,
  total_number_of_results: 1500,
  results: null
)
```

