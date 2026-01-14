# OpenapiClient::SubmitFlowRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_name** | **String** | Flow name (e.g., &#39;Invoice 2025-001&#39;) |  |
| **flow_syntax** | [**FlowSyntax**](FlowSyntax.md) | Flow syntax (CII for Factur-X) | [optional] |
| **flow_profile** | [**FlowProfile**](FlowProfile.md) |  | [optional] |
| **tracking_id** | **String** |  | [optional] |
| **request_id** | **String** |  | [optional] |
| **pdp_credentials** | [**PDPCredentials**](PDPCredentials.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SubmitFlowRequest.new(
  flow_name: Invoice 2025-001,
  flow_syntax: null,
  flow_profile: null,
  tracking_id: null,
  request_id: null,
  pdp_credentials: null
)
```

