# FactPulse::Fournisseur

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **adresse_electronique** | [**AdresseElectronique**](AdresseElectronique.md) |  |  |
| **id_fournisseur** | **Integer** |  |  |
| **code_coordonnees_bancaires_fournisseur** | **Integer** |  | [optional] |
| **id_service_fournisseur** | **Integer** |  | [optional] |
| **nom** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **numero_tva_intra** | **String** |  | [optional] |
| **iban** | **String** |  | [optional] |
| **adresse_postale** | [**AdressePostale**](AdressePostale.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Fournisseur.new(
  adresse_electronique: null,
  id_fournisseur: null,
  code_coordonnees_bancaires_fournisseur: null,
  id_service_fournisseur: null,
  nom: null,
  siret: null,
  numero_tva_intra: null,
  iban: null,
  adresse_postale: null
)
```

