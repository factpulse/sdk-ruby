# FactPulse::InvoiceLifecycle

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **seller_id** | **String** |  | [optional] |
| **invoice_id** | **String** | Reference de la facture (IssuerAssignedID du CDAR) |  |
| **events** | [**Array&lt;LifecycleEvent&gt;**](LifecycleEvent.md) | Evenements de cycle de vie tries chronologiquement | [optional] |
| **total_events** | **Integer** | Nombre total d&#39;evenements |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InvoiceLifecycle.new(
  seller_id: null,
  invoice_id: null,
  events: null,
  total_events: null
)
```

