# FactPulse::ChorusProResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chorus_invoice_id** | **Integer** | Chorus Pro invoice ID |  |
| **deposit_flow_number** | **String** |  | [optional] |
| **attachment_id** | **Integer** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ChorusProResult.new(
  chorus_invoice_id: null,
  deposit_flow_number: null,
  attachment_id: null
)
```

