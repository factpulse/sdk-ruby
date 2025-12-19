# FactPulse::InvoiceReferences

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_currency** | **String** |  | [optional][default to &#39;EUR&#39;] |
| **payment_means** | [**PaymentMeans**](PaymentMeans.md) |  |  |
| **invoice_type** | [**InvoiceTypeCode**](InvoiceTypeCode.md) |  |  |
| **vat_accounting_code** | [**VATAccountingCode**](VATAccountingCode.md) |  |  |
| **contract_reference** | **String** |  | [optional] |
| **vat_exemption_reason** | **String** |  | [optional] |
| **purchase_order_reference** | **String** |  | [optional] |
| **preceding_invoice_reference** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InvoiceReferences.new(
  invoice_currency: null,
  payment_means: null,
  invoice_type: null,
  vat_accounting_code: null,
  contract_reference: null,
  vat_exemption_reason: null,
  purchase_order_reference: null,
  preceding_invoice_reference: null
)
```

