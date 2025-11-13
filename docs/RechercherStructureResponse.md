# FactPulse::RechercherStructureResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_retour** | **Integer** | Code retour (0 &#x3D; succès) |  |
| **libelle** | **String** | Message de retour |  |
| **liste_structures** | [**Array&lt;StructureInfo&gt;**](StructureInfo.md) |  | [optional] |
| **total** | **Integer** | Nombre total de résultats | [optional][default to 0] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::RechercherStructureResponse.new(
  code_retour: null,
  libelle: null,
  liste_structures: null,
  total: null
)
```

