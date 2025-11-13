# FactPulse::RechercherServicesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_retour** | **Integer** |  |  |
| **libelle** | **String** |  |  |
| **liste_services** | [**Array&lt;ServiceStructure&gt;**](ServiceStructure.md) |  | [optional] |
| **total** | **Integer** | Nombre de services | [optional][default to 0] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::RechercherServicesResponse.new(
  code_retour: null,
  libelle: null,
  liste_services: null,
  total: null
)
```

