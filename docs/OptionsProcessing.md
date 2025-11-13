# FactPulse::OptionsProcessing

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **profil_facturx** | [**ProfilAPI**](ProfilAPI.md) | Profil Factur-X à utiliser | [optional] |
| **auto_enrichir** | **Boolean** | Auto-enrichir les données (APIs Entreprises, Chorus Pro, etc.) | [optional][default to true] |
| **valider** | **Boolean** | Valider le XML Factur-X avec Schematron | [optional][default to true] |
| **verifier_parametres_destination** | **Boolean** | Vérifier les paramètres requis par la destination (ex: code_service pour Chorus) | [optional][default to true] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::OptionsProcessing.new(
  profil_facturx: null,
  auto_enrichir: null,
  valider: null,
  verifier_parametres_destination: null
)
```

