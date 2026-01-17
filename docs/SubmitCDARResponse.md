# FactPulse::SubmitCDARResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Identifiant du flux AFNOR |  |
| **status** | **String** | Statut de la soumission |  |
| **message** | **String** |  | [optional] |
| **document_id** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitCDARResponse.new(
  flow_id: null,
  status: null,
  message: null,
  document_id: null
)
```

