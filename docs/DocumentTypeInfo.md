# FactPulse::DocumentTypeInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **Integer** | Code UNTDID 1001 |  |
| **label** | **String** | Libelle (Facture, Avoir, etc.) |  |
| **detected_as** | **String** | Classification interne |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::DocumentTypeInfo.new(
  code: null,
  label: null,
  detected_as: null
)
```

