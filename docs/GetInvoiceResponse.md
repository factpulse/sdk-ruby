# FactPulse::GetInvoiceResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_code** | **Integer** |  |  |
| **message** | **String** |  |  |
| **chorus_invoice_id** | **Integer** |  | [optional] |
| **invoice_number** | **String** |  | [optional] |
| **invoice_date** | **String** |  | [optional] |
| **total_gross_amount** | **String** |  | [optional] |
| **current_status** | [**InvoiceStatus**](InvoiceStatus.md) |  | [optional] |
| **recipient_structure_id** | **Integer** |  | [optional] |
| **recipient_structure_name** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GetInvoiceResponse.new(
  return_code: null,
  message: null,
  chorus_invoice_id: null,
  invoice_number: null,
  invoice_date: null,
  total_gross_amount: null,
  current_status: null,
  recipient_structure_id: null,
  recipient_structure_name: null
)
```

