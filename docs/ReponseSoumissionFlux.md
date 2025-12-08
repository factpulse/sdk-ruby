# FactPulse::ReponseSoumissionFlux

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Identifiant unique du flux généré par la PDP |  |
| **tracking_id** | **String** |  | [optional] |
| **nom** | **String** | Nom du flux |  |
| **syntaxe_flux** | **String** | Syntaxe du flux (CII, UBL, etc.) |  |
| **profil_flux** | **String** |  | [optional] |
| **sha256** | **String** | Hash SHA256 du fichier soumis |  |
| **message** | **String** | Message de confirmation |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ReponseSoumissionFlux.new(
  flow_id: null,
  tracking_id: null,
  nom: null,
  syntaxe_flux: null,
  profil_flux: null,
  sha256: null,
  message: null
)
```

