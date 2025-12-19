# FactPulse::InvoiceTotals

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total_net_amount** | [**TotalNetAmount**](TotalNetAmount.md) |  |  |
| **vat_amount** | [**TotalVATAmount**](TotalVATAmount.md) |  |  |
| **total_gross_amount** | [**TotalGrossAmount**](TotalGrossAmount.md) |  |  |
| **amount_due** | [**AmountDue**](AmountDue.md) |  |  |
| **prepayment** | [**InvoiceTotalsPrepayment**](InvoiceTotalsPrepayment.md) |  | [optional] |
| **global_allowance_amount** | [**GlobalAllowanceAmount**](GlobalAllowanceAmount.md) |  | [optional] |
| **global_allowance_reason** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InvoiceTotals.new(
  total_net_amount: null,
  vat_amount: null,
  total_gross_amount: null,
  amount_due: null,
  prepayment: null,
  global_allowance_amount: null,
  global_allowance_reason: null
)
```

