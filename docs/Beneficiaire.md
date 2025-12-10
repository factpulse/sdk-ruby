# FactPulse::Beneficiaire

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nom** | **String** | Nom du bénéficiaire (BT-59). Obligatoire. |  |
| **siret** | **String** |  | [optional] |
| **siren** | **String** |  | [optional] |
| **adresse_electronique** | [**AdresseElectronique**](AdresseElectronique.md) |  | [optional] |
| **iban** | **String** |  | [optional] |
| **bic** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Beneficiaire.new(
  nom: null,
  siret: null,
  siren: null,
  adresse_electronique: null,
  iban: null,
  bic: null
)
```

