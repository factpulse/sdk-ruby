# FactPulse::ConsulterStructureResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_retour** | **Integer** |  |  |
| **libelle** | **String** |  |  |
| **id_structure_cpp** | **Integer** |  | [optional] |
| **identifiant_structure** | **String** |  | [optional] |
| **libelle_structure** | **String** |  | [optional] |
| **raison_sociale_structure** | **String** |  | [optional] |
| **numero_tva** | **String** |  | [optional] |
| **email_structure** | **String** |  | [optional] |
| **parametres** | [**ParametresStructure**](ParametresStructure.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConsulterStructureResponse.new(
  code_retour: null,
  libelle: null,
  id_structure_cpp: null,
  identifiant_structure: null,
  libelle_structure: null,
  raison_sociale_structure: null,
  numero_tva: null,
  email_structure: null,
  parametres: null
)
```

