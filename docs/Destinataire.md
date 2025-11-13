# FactPulse::Destinataire

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **adresse_electronique** | [**AdresseElectronique**](AdresseElectronique.md) |  |  |
| **code_service_executant** | **String** |  | [optional] |
| **nom** | **String** |  | [optional] |
| **adresse_postale** | [**AdressePostale**](AdressePostale.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Destinataire.new(
  adresse_electronique: null,
  code_service_executant: null,
  nom: null,
  adresse_postale: null
)
```

