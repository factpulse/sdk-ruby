# FactPulse::TaxBreakdownInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rate** | [**Rate1**](Rate1.md) |  |  |
| **taxable_amount** | [**Taxableamount**](Taxableamount.md) |  |  |
| **tax_amount** | [**Taxamount2**](Taxamount2.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::TaxBreakdownInput.new(
  rate: null,
  taxable_amount: null,
  tax_amount: null
)
```

