# FactPulse::StructureInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_structure_cpp** | **Integer** | ID Chorus Pro de la structure |  |
| **identifiant_structure** | **String** | Identifiant (SIRET, SIREN) |  |
| **designation_structure** | **String** | Nom de la structure |  |
| **type_identifiant_structure** | **String** | Type d&#39;identifiant |  |
| **statut** | **String** | Statut (ACTIVE, INACTIVE) |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::StructureInfo.new(
  id_structure_cpp: null,
  identifiant_structure: null,
  designation_structure: null,
  type_identifiant_structure: null,
  statut: null
)
```

