# OpenapiClient::InvoicePaymentInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_id** | **String** | Invoice identifier |  |
| **invoice_date** | **Date** | Original invoice date |  |
| **payment_date** | **Date** | Payment date |  |
| **currency** | [**Currency**](Currency.md) |  | [optional] |
| **amounts_by_rate** | [**Array&lt;PaymentAmountByRate&gt;**](PaymentAmountByRate.md) | Payment amounts by VAT rate |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::InvoicePaymentInput.new(
  invoice_id: FAC-2025-001,
  invoice_date: 2025-01-15,
  payment_date: 2025-01-25,
  currency: null,
  amounts_by_rate: null
)
```

