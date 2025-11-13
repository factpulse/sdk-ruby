# FactPulse::ServiceStructure

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_service** | **Integer** | ID du service |  |
| **code_service** | **String** | Code du service |  |
| **libelle_service** | **String** | Libellé du service |  |
| **est_actif** | **Boolean** | Service actif |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ServiceStructure.new(
  id_service: null,
  code_service: null,
  libelle_service: null,
  est_actif: null
)
```

