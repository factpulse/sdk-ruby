# FactPulse::FournisseurEntrant

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nom** | **String** | Raison sociale du fournisseur (BT-27) |  |
| **siren** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **numero_tva_intra** | **String** |  | [optional] |
| **adresse_postale** | [**AdressePostale**](AdressePostale.md) |  | [optional] |
| **adresse_electronique** | [**AdresseElectronique**](AdresseElectronique.md) |  | [optional] |
| **email** | **String** |  | [optional] |
| **telephone** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FournisseurEntrant.new(
  nom: null,
  siren: null,
  siret: null,
  numero_tva_intra: null,
  adresse_postale: null,
  adresse_electronique: null,
  email: null,
  telephone: null
)
```

