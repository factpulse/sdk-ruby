# FactPulse::SubmitAggregatedReportRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**CreateAggregatedReportRequest**](CreateAggregatedReportRequest.md) | Aggregated e-reporting data |  |
| **tracking_id** | **String** |  | [optional] |
| **pdp_flow_service_url** | **String** |  | [optional] |
| **pdp_token_url** | **String** |  | [optional] |
| **pdp_client_id** | **String** |  | [optional] |
| **pdp_client_secret** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitAggregatedReportRequest.new(
  data: null,
  tracking_id: null,
  pdp_flow_service_url: null,
  pdp_token_url: null,
  pdp_client_id: null,
  pdp_client_secret: null
)
```

