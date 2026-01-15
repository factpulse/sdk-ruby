# FactPulse::GetInvoiceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **chorus_invoice_id** | **Integer** | Chorus Pro invoice ID |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GetInvoiceRequest.new(
  credentials: null,
  chorus_invoice_id: null
)
```

