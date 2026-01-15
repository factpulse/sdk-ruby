# FactPulse::VATLine

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **taxable_amount** | [**TaxableAmount**](TaxableAmount.md) |  |  |
| **vat_amount** | [**VATAmount**](VATAmount.md) |  |  |
| **rate** | **String** |  | [optional] |
| **manual_rate** | [**ManualRate**](ManualRate.md) |  | [optional] |
| **category** | [**VATCategory**](VATCategory.md) |  | [optional] |
| **due_date_type_code** | [**VATPointDateCode**](VATPointDateCode.md) |  | [optional] |
| **exemption_reason** | **String** |  | [optional] |
| **vatex_code** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::VATLine.new(
  taxable_amount: null,
  vat_amount: null,
  rate: null,
  manual_rate: null,
  category: null,
  due_date_type_code: null,
  exemption_reason: null,
  vatex_code: null
)
```

