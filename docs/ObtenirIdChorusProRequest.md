# FactPulse::ObtenirIdChorusProRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **siret** | **String** | SIRET de la structure (14 chiffres) |  |
| **type_identifiant** | **String** | Type d&#39;identifiant (SIRET, SIREN, UE_HORS_FRANCE, etc.) | [optional][default to &#39;SIRET&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ObtenirIdChorusProRequest.new(
  credentials: null,
  siret: null,
  type_identifiant: null
)
```

