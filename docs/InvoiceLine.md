# FactPulse::InvoiceLine

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **line_number** | **Integer** |  |  |
| **reference** | **String** |  | [optional] |
| **item_name** | **String** |  |  |
| **quantity** | [**Quantity**](Quantity.md) |  |  |
| **unit** | [**UnitOfMeasure**](UnitOfMeasure.md) |  |  |
| **unit_net_price** | [**UnitNetPrice**](UnitNetPrice.md) |  |  |
| **allowance_amount** | [**InvoiceLineAllowanceAmount**](InvoiceLineAllowanceAmount.md) |  | [optional] |
| **line_net_amount** | [**LineNetAmount**](LineNetAmount.md) |  | [optional] |
| **vat_rate** | **String** |  | [optional] |
| **manual_vat_rate** | [**ManualVatRate**](ManualVatRate.md) |  | [optional] |
| **vat_category** | [**VATCategory**](VATCategory.md) |  | [optional] |
| **period_start_date** | **String** |  | [optional] |
| **period_end_date** | **String** |  | [optional] |
| **allowance_reason_code** | [**AllowanceReasonCode**](AllowanceReasonCode.md) |  | [optional] |
| **allowance_reason** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InvoiceLine.new(
  line_number: null,
  reference: null,
  item_name: null,
  quantity: null,
  unit: null,
  unit_net_price: null,
  allowance_amount: null,
  line_net_amount: null,
  vat_rate: null,
  manual_vat_rate: null,
  vat_category: null,
  period_start_date: null,
  period_end_date: null,
  allowance_reason_code: null,
  allowance_reason: null
)
```

