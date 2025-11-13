# FactPulse::InformationSignatureAPI

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nom_champ** | **String** | Nom du champ de signature dans le PDF |  |
| **signataire** | **String** |  | [optional] |
| **date_signature** | **String** |  | [optional] |
| **raison** | **String** |  | [optional] |
| **localisation** | **String** |  | [optional] |
| **est_valide** | **Boolean** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::InformationSignatureAPI.new(
  nom_champ: null,
  signataire: null,
  date_signature: null,
  raison: null,
  localisation: null,
  est_valide: null
)
```

