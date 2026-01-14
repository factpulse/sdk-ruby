# FactPulse::AggregatedTransactionInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date** | **Date** | Transaction date (TT-77) |  |
| **category_code** | [**TransactionCategory**](TransactionCategory.md) | Transaction category code (TT-81). Use TLB1 for goods, TPS1 for services. |  |
| **currency** | [**Currency**](Currency.md) |  | [optional] |
| **tax_exclusive_amount** | [**Taxexclusiveamount**](Taxexclusiveamount.md) |  |  |
| **tax_amount** | [**Taxamount**](Taxamount.md) |  |  |
| **tax_breakdown** | [**Array&lt;TaxBreakdownInput&gt;**](TaxBreakdownInput.md) | VAT breakdown by rate |  |
| **transaction_count** | **Integer** |  | [optional] |
| **tax_due_type** | [**TaxDueDateType**](TaxDueDateType.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AggregatedTransactionInput.new(
  date: 2025-01-15,
  category_code: null,
  currency: null,
  tax_exclusive_amount: null,
  tax_amount: null,
  tax_breakdown: null,
  transaction_count: null,
  tax_due_type: null
)
```

