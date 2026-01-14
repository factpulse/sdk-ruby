# OpenapiClient::SubmitInvoiceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **invoice_number** | **String** | Invoice number |  |
| **invoice_date** | **String** | Invoice date (ISO format: YYYY-MM-DD) |  |
| **payment_due_date** | **String** |  | [optional] |
| **structure_id** | **Integer** | Chorus Pro recipient structure ID |  |
| **service_code** | **String** |  | [optional] |
| **engagement_number** | **String** |  | [optional] |
| **total_net_amount** | [**SubmitNetAmount**](SubmitNetAmount.md) |  |  |
| **vat_amount** | [**SubmitVatAmount**](SubmitVatAmount.md) |  |  |
| **total_gross_amount** | [**SubmitGrossAmount**](SubmitGrossAmount.md) |  |  |
| **main_attachment_id** | **Integer** |  | [optional] |
| **main_attachment_label** | **String** |  | [optional] |
| **comment** | **String** |  | [optional] |
| **purchase_order_reference** | **String** |  | [optional] |
| **contract_reference** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SubmitInvoiceRequest.new(
  credentials: null,
  invoice_number: null,
  invoice_date: null,
  payment_due_date: null,
  structure_id: null,
  service_code: null,
  engagement_number: null,
  total_net_amount: null,
  vat_amount: null,
  total_gross_amount: null,
  main_attachment_id: null,
  main_attachment_label: null,
  comment: null,
  purchase_order_reference: null,
  contract_reference: null
)
```

