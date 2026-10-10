# FactPulse::PaymentAmountByRate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rate** | [**Rate**](Rate.md) |  |  |
| **amount** | [**Amount2**](Amount2.md) |  |  |
| **amount_eur** | [**Amounteur**](Amounteur.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::PaymentAmountByRate.new(
  rate: null,
  amount: null,
  amount_eur: null
)
```

