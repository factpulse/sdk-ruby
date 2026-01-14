# OpenapiClient::EnrichedInvoiceInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_number** | **String** | Invoice number |  |
| **supplier_id** | **Integer** |  | [optional] |
| **recipient_id** | **Integer** |  | [optional] |
| **supplier_name** | **String** | Supplier name |  |
| **recipient_name** | **String** | Recipient name |  |
| **total_net_amount** | **String** | Total net amount (HT) |  |
| **vat_amount** | **String** | VAT amount |  |
| **total_gross_amount** | **String** | Total gross amount (TTC) |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::EnrichedInvoiceInfo.new(
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

