# OpenapiClient::InvoiceTotals

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **line_total_amount** | [**LineTotalAmount**](LineTotalAmount.md) |  | [optional] |
| **allowance_total_amount** | [**AllowanceTotalAmount**](AllowanceTotalAmount.md) |  | [optional] |
| **charge_total_amount** | [**ChargeTotalAmount**](ChargeTotalAmount.md) |  | [optional] |
| **total_net_amount** | [**TotalNetAmount**](TotalNetAmount.md) |  |  |
| **vat_amount** | [**TotalVATAmount**](TotalVATAmount.md) |  |  |
| **total_gross_amount** | [**TotalGrossAmount**](TotalGrossAmount.md) |  |  |
| **prepayment** | [**InvoiceTotalsPrepayment**](InvoiceTotalsPrepayment.md) |  | [optional] |
| **rounding_amount** | [**RoundingAmount**](RoundingAmount.md) |  | [optional] |
| **amount_due** | [**AmountDue**](AmountDue.md) |  |  |
| **global_allowance_amount** | [**GlobalAllowanceAmount**](GlobalAllowanceAmount.md) |  | [optional] |
| **global_allowance_reason** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::InvoiceTotals.new(
  line_total_amount: null,
  allowance_total_amount: null,
  charge_total_amount: null,
  total_net_amount: null,
  vat_amount: null,
  total_gross_amount: null,
  prepayment: null,
  rounding_amount: null,
  amount_due: null,
  global_allowance_amount: null,
  global_allowance_reason: null
)
```

