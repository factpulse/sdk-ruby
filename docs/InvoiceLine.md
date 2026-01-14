# OpenapiClient::InvoiceLine

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **line_number** | **Integer** | Invoice line identifier (BT-126). |  |
| **line_note** | **String** |  | [optional] |
| **parent_line_id** | **String** |  | [optional] |
| **line_sub_type** | [**LineSubType**](LineSubType.md) |  | [optional] |
| **reference** | **String** |  | [optional] |
| **buyer_assigned_id** | **String** |  | [optional] |
| **product_global_id** | **String** |  | [optional] |
| **product_global_id_scheme** | **String** |  | [optional] |
| **item_name** | **String** | Item name (BT-153). |  |
| **item_description** | **String** |  | [optional] |
| **origin_country** | **String** |  | [optional] |
| **characteristics** | [**Array&lt;ProductCharacteristic&gt;**](ProductCharacteristic.md) |  | [optional] |
| **classifications** | [**Array&lt;ProductClassification&gt;**](ProductClassification.md) |  | [optional] |
| **quantity** | [**Quantity**](Quantity.md) |  |  |
| **unit** | [**UnitOfMeasure**](UnitOfMeasure.md) | Invoiced quantity unit of measure code (BT-130). |  |
| **gross_unit_price** | [**GrossUnitPrice**](GrossUnitPrice.md) |  | [optional] |
| **unit_net_price** | [**UnitNetPrice**](UnitNetPrice.md) |  |  |
| **price_basis_quantity** | [**PriceBasisQuantity**](PriceBasisQuantity.md) |  | [optional] |
| **price_basis_unit** | **String** |  | [optional] |
| **price_allowance_amount** | [**PriceAllowanceAmount**](PriceAllowanceAmount.md) |  | [optional] |
| **line_net_amount** | [**LineNetAmount**](LineNetAmount.md) |  | [optional] |
| **allowance_amount** | [**InvoiceLineAllowanceAmount**](InvoiceLineAllowanceAmount.md) |  | [optional] |
| **allowance_reason_code** | [**AllowanceReasonCode**](AllowanceReasonCode.md) |  | [optional] |
| **allowance_reason** | **String** |  | [optional] |
| **allowances_charges** | [**Array&lt;AllowanceCharge&gt;**](AllowanceCharge.md) |  | [optional] |
| **vat_rate** | **String** |  | [optional] |
| **manual_vat_rate** | [**ManualVatRate**](ManualVatRate.md) |  | [optional] |
| **vat_category** | [**VATCategory**](VATCategory.md) |  | [optional] |
| **period_start_date** | **String** |  | [optional] |
| **period_end_date** | **String** |  | [optional] |
| **purchase_order_line_ref** | **String** |  | [optional] |
| **accounting_account** | **String** |  | [optional] |
| **additional_documents** | [**Array&lt;AdditionalDocument&gt;**](AdditionalDocument.md) |  | [optional] |
| **line_notes** | [**Array&lt;InvoiceNote&gt;**](InvoiceNote.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::InvoiceLine.new(
  line_number: null,
  line_note: null,
  parent_line_id: null,
  line_sub_type: null,
  reference: null,
  buyer_assigned_id: null,
  product_global_id: null,
  product_global_id_scheme: null,
  item_name: null,
  item_description: null,
  origin_country: null,
  characteristics: null,
  classifications: null,
  quantity: null,
  unit: null,
  gross_unit_price: null,
  unit_net_price: null,
  price_basis_quantity: null,
  price_basis_unit: null,
  price_allowance_amount: null,
  line_net_amount: null,
  allowance_amount: null,
  allowance_reason_code: null,
  allowance_reason: null,
  allowances_charges: null,
  vat_rate: null,
  manual_vat_rate: null,
  vat_category: null,
  period_start_date: null,
  period_end_date: null,
  purchase_order_line_ref: null,
  accounting_account: null,
  additional_documents: null,
  line_notes: null
)
```

