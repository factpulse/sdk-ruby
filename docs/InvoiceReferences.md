# OpenapiClient::InvoiceReferences

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_process_id** | **String** |  | [optional] |
| **invoice_currency** | **String** | Invoice currency code (BT-5). ISO 4217. | [optional][default to &#39;EUR&#39;] |
| **payment_means** | [**PaymentMeans**](PaymentMeans.md) | Payment means type code (BT-81). |  |
| **payment_means_text** | **String** |  | [optional] |
| **invoice_type** | [**InvoiceTypeCode**](InvoiceTypeCode.md) |  |  |
| **vat_accounting_code** | [**VATAccountingCode**](VATAccountingCode.md) | VAT accounting code. |  |
| **buyer_reference** | **String** |  | [optional] |
| **contract_reference** | **String** |  | [optional] |
| **purchase_order_reference** | **String** |  | [optional] |
| **seller_order_reference** | **String** |  | [optional] |
| **receiving_advice_reference** | **String** |  | [optional] |
| **despatch_advice_reference** | **String** |  | [optional] |
| **tender_reference** | **String** |  | [optional] |
| **preceding_invoice_reference** | **String** |  | [optional] |
| **preceding_invoice_date** | **String** |  | [optional] |
| **project_reference** | **String** |  | [optional] |
| **project_name** | **String** |  | [optional] |
| **vat_exemption_reason** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::InvoiceReferences.new(
  business_process_id: null,
  invoice_currency: null,
  payment_means: null,
  payment_means_text: null,
  invoice_type: null,
  vat_accounting_code: null,
  buyer_reference: null,
  contract_reference: null,
  purchase_order_reference: null,
  seller_order_reference: null,
  receiving_advice_reference: null,
  despatch_advice_reference: null,
  tender_reference: null,
  preceding_invoice_reference: null,
  preceding_invoice_date: null,
  project_reference: null,
  project_name: null,
  vat_exemption_reason: null
)
```

