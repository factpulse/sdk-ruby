# FactPulse::RechercherStructureRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **identifiant_structure** | **String** |  | [optional] |
| **type_identifiant_structure** | **String** |  | [optional] |
| **raison_sociale_structure** | **String** |  | [optional] |
| **restreindre_structures_privees** | **Boolean** | Limiter la recherche aux structures privées uniquement | [optional][default to false] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::RechercherStructureRequest.new(
  credentials: null,
  identifiant_structure: null,
  type_identifiant_structure: null,
  raison_sociale_structure: null,
  restreindre_structures_privees: null
)
```

