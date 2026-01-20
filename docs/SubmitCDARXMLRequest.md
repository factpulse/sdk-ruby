# FactPulse::SubmitCDARXMLRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **xml** | **String** | XML CDAR à soumettre |  |
| **flow_type** | **String** | Type de flux AFNOR | [optional][default to &#39;CustomerInvoiceLC&#39;] |
| **filename** | **String** |  | [optional] |
| **pdp_flow_service_url** | **String** |  | [optional] |
| **pdp_token_url** | **String** |  | [optional] |
| **pdp_client_id** | **String** |  | [optional] |
| **pdp_client_secret** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitCDARXMLRequest.new(
  xml: null,
  flow_type: null,
  filename: null,
  pdp_flow_service_url: null,
  pdp_token_url: null,
  pdp_client_id: null,
  pdp_client_secret: null
)
```

