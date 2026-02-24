# FactPulse::LifecycleEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | ID du flux lifecycle |  |
| **status_code** | **String** | Code statut (200-601) |  |
| **status_description** | **String** |  | [optional] |
| **ack_status** | **String** |  | [optional] |
| **at** | **String** |  | [optional] |
| **document_id** | **String** |  | [optional] |
| **amount** | **String** |  | [optional] |
| **currency** | **String** |  | [optional] |
| **issuer_siren** | **String** |  | [optional] |
| **issuer_role** | **String** |  | [optional] |
| **reason_code** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::LifecycleEvent.new(
  flow_id: null,
  status_code: null,
  status_description: null,
  ack_status: null,
  at: null,
  document_id: null,
  amount: null,
  currency: null,
  issuer_siren: null,
  issuer_role: null,
  reason_code: null
)
```

