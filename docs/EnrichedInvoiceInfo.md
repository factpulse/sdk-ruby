# FactPulse::EnrichedInvoiceInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_number** | **String** |  |  |
| **supplier_id** | **Integer** |  | [optional] |
| **recipient_id** | **Integer** |  | [optional] |
| **supplier_name** | **String** |  |  |
| **recipient_name** | **String** |  |  |
| **total_net_amount** | **String** |  |  |
| **vat_amount** | **String** |  |  |
| **total_gross_amount** | **String** |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::EnrichedInvoiceInfo.new(
  invoice_number: null,
  supplier_id: null,
  recipient_id: null,
  supplier_name: null,
  recipient_name: null,
  total_net_amount: null,
  vat_amount: null,
  total_gross_amount: null
)
```

