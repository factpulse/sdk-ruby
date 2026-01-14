# OpenapiClient::AggregatedPaymentInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_date** | **Date** | Payment date |  |
| **currency** | [**Currency**](Currency.md) |  | [optional] |
| **amounts_by_rate** | [**Array&lt;PaymentAmountByRate&gt;**](PaymentAmountByRate.md) | Payment amounts by VAT rate |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AggregatedPaymentInput.new(
  payment_date: 2025-01-15,
  currency: null,
  amounts_by_rate: null
)
```

