# FactPulse::SubmitCDARXMLRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **xml** | **String** | XML CDAR à soumettre |  |
| **flow_type** | **String** | Type de flux AFNOR | [optional][default to &#39;CustomerInvoiceLC&#39;] |
| **filename** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitCDARXMLRequest.new(
  xml: null,
  flow_type: null,
  filename: null
)
```

