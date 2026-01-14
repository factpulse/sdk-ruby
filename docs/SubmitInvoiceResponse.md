# FactPulse::SubmitInvoiceResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_code** | **Integer** | Return code (0 &#x3D; success) |  |
| **message** | **String** | Return message |  |
| **chorus_invoice_id** | **Integer** |  | [optional] |
| **deposit_flow_number** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitInvoiceResponse.new(
  return_code: null,
  message: null,
  chorus_invoice_id: null,
  deposit_flow_number: null
)
```

