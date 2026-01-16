# FactPulse::InvoiceInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_id** | **String** | Invoice identifier |  |
| **issue_date** | **Date** | Invoice issue date |  |
| **type_code** | [**InvoiceTypeCode**](InvoiceTypeCode.md) | Invoice type code | [optional] |
| **currency** | [**Currency**](Currency.md) |  | [optional] |
| **due_date** | **Date** |  | [optional] |
| **seller_siren** | **String** | Seller SIREN/SIRET |  |
| **seller_vat_id** | **String** |  | [optional] |
| **seller_country** | [**Sellercountry**](Sellercountry.md) |  | [optional] |
| **buyer_id** | **String** |  | [optional] |
| **buyer_vat_id** | **String** |  | [optional] |
| **buyer_country** | [**Buyercountry**](Buyercountry.md) |  |  |
| **tax_exclusive_amount** | [**Taxexclusiveamount1**](Taxexclusiveamount1.md) |  |  |
| **tax_amount** | [**Taxamount1**](Taxamount1.md) |  |  |
| **tax_breakdown** | [**Array&lt;TaxBreakdownInput&gt;**](TaxBreakdownInput.md) | VAT breakdown |  |
| **referenced_invoice_id** | **String** |  | [optional] |
| **referenced_invoice_date** | **Date** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InvoiceInput.new(
  invoice_id: FAC-2025-001,
  issue_date: 2025-01-15,
  type_code: null,
  currency: null,
  due_date: null,
  seller_siren: 123456789,
  seller_vat_id: null,
  seller_country: null,
  buyer_id: null,
  buyer_vat_id: null,
  buyer_country: null,
  tax_exclusive_amount: null,
  tax_amount: null,
  tax_breakdown: null,
  referenced_invoice_id: null,
  referenced_invoice_date: null
)
```

