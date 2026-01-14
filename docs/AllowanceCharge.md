# OpenapiClient::AllowanceCharge

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_charge** | **Boolean** | True for charge, False for allowance (ChargeIndicator). |  |
| **amount** | [**Amount1**](Amount1.md) |  |  |
| **base_amount** | [**BaseAmount**](BaseAmount.md) |  | [optional] |
| **percentage** | [**Percentage**](Percentage.md) |  | [optional] |
| **reason** | **String** |  | [optional] |
| **reason_code** | [**AllowanceChargeReasonCode**](AllowanceChargeReasonCode.md) |  | [optional] |
| **vat_category** | [**VATCategory**](VATCategory.md) |  | [optional] |
| **vat_rate** | [**VatRate**](VatRate.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AllowanceCharge.new(
  is_charge: null,
  amount: null,
  base_amount: null,
  percentage: null,
  reason: null,
  reason_code: null,
  vat_category: null,
  vat_rate: null
)
```

