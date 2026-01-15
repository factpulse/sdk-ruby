# FactPulse::SubmitEReportingRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**CreateEReportingRequest**](CreateEReportingRequest.md) | E-Reporting data to submit |  |
| **tracking_id** | **String** |  | [optional] |
| **pdp_flow_service_url** | **String** |  | [optional] |
| **pdp_token_url** | **String** |  | [optional] |
| **pdp_client_id** | **String** |  | [optional] |
| **pdp_client_secret** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitEReportingRequest.new(
  data: null,
  tracking_id: null,
  pdp_flow_service_url: null,
  pdp_token_url: null,
  pdp_client_id: null,
  pdp_client_secret: null
)
```

