# FactPulse::ValidateCDARRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **document_id** | **String** |  | [optional] |
| **sender_siren** | **String** |  | [optional] |
| **sender_role** | **String** |  | [optional] |
| **invoice_id** | **String** |  | [optional] |
| **invoice_issue_date** | **Date** |  | [optional] |
| **status** | **String** |  | [optional] |
| **reason_code** | **String** |  | [optional] |
| **encaisse_amount** | [**Encaisseamount1**](Encaisseamount1.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidateCDARRequest.new(
  document_id: null,
  sender_siren: null,
  sender_role: null,
  invoice_id: null,
  invoice_issue_date: null,
  status: null,
  reason_code: null,
  encaisse_amount: null
)
```

