# FactPulse::SimplifiedCDARResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Identifiant du flux AFNOR |  |
| **document_id** | **String** | Identifiant du message CDAR généré |  |
| **status** | **String** | Code statut soumis (210 ou 212) |  |
| **invoice_id** | **String** | Identifiant de la facture |  |
| **message** | **String** | Message de confirmation |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SimplifiedCDARResponse.new(
  flow_id: null,
  document_id: null,
  status: null,
  invoice_id: null,
  message: null
)
```

