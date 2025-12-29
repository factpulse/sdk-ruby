# FactPulse::IncomingInvoice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** |  | [optional] |
| **source_format** | [**InvoiceFormat**](InvoiceFormat.md) | Invoice source format |  |
| **supplier_reference** | **String** | Invoice number issued by the supplier (BT-1) |  |
| **document_type** | [**InvoiceTypeCode**](InvoiceTypeCode.md) | Document type (BT-3) | [optional] |
| **supplier** | [**IncomingSupplier**](IncomingSupplier.md) | Invoice issuer (SellerTradeParty) |  |
| **billing_site_name** | **String** | Recipient name / your company (BT-44) |  |
| **billing_site_siret** | **String** |  | [optional] |
| **issue_date** | **String** | Invoice date (BT-2) - YYYY-MM-DD |  |
| **due_date** | **String** |  | [optional] |
| **currency** | **String** | ISO currency code (BT-5) | [optional][default to &#39;EUR&#39;] |
| **net_amount** | **String** | Total net amount (BT-109) |  |
| **vat_amount** | **String** | Total VAT amount (BT-110) |  |
| **gross_amount** | **String** | Total gross amount (BT-112) |  |
| **purchase_order_number** | **String** |  | [optional] |
| **contract_reference** | **String** |  | [optional] |
| **invoice_subject** | **String** |  | [optional] |
| **document_base64** | **String** |  | [optional] |
| **document_content_type** | **String** |  | [optional] |
| **document_filename** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::IncomingInvoice.new(
  flow_id: null,
  source_format: null,
  supplier_reference: null,
  document_type: null,
  supplier: null,
  billing_site_name: null,
  billing_site_siret: null,
  issue_date: null,
  due_date: null,
  currency: null,
  net_amount: null,
  vat_amount: null,
  gross_amount: null,
  purchase_order_number: null,
  contract_reference: null,
  invoice_subject: null,
  document_base64: null,
  document_content_type: null,
  document_filename: null
)
```

