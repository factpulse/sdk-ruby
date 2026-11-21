# FactPulse::EncaisseAmountByRate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rate** | **Float** | Taux de TVA applicable au montant encaissé, en % (MDT-224) |  |
| **amount** | [**Amount1**](Amount1.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::EncaisseAmountByRate.new(
  rate: 20,
  amount: null
)
```

