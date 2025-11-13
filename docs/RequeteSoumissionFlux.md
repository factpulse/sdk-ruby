# FactPulse::RequeteSoumissionFlux

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nom_flux** | **String** | Nom du flux (ex: &#39;Facture 2025-001&#39;) |  |
| **syntaxe_flux** | [**SyntaxeFlux**](SyntaxeFlux.md) | Syntaxe du flux (CII pour Factur-X) | [optional] |
| **profil_flux** | [**ProfilFlux**](ProfilFlux.md) |  | [optional] |
| **tracking_id** | **String** |  | [optional] |
| **request_id** | **String** |  | [optional] |
| **pdp_credentials** | [**PDPCredentials**](PDPCredentials.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::RequeteSoumissionFlux.new(
  nom_flux: Facture 2025-001,
  syntaxe_flux: null,
  profil_flux: null,
  tracking_id: null,
  request_id: null,
  pdp_credentials: null
)
```

