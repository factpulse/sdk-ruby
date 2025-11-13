# FactPulse::ObtenirIdChorusProResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_structure_cpp** | **Integer** | ID Chorus Pro (0 si non trouvé) |  |
| **identifiant_structure** | **String** | SIRET/SIREN recherché |  |
| **designation_structure** | **String** |  | [optional] |
| **message** | **String** | Message de retour |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ObtenirIdChorusProResponse.new(
  id_structure_cpp: null,
  identifiant_structure: null,
  designation_structure: null,
  message: null
)
```

