# FactPulse::GetChorusProIdRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**FactureElectroniqueRestApiSchemasChorusProChorusProCredentials**](FactureElectroniqueRestApiSchemasChorusProChorusProCredentials.md) |  | [optional] |
| **siret** | **String** | Structure SIRET (14 digits) |  |
| **identifier_type** | **String** | Identifier type (SIRET, SIREN, UE_HORS_FRANCE, etc.) | [optional][default to &#39;SIRET&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GetChorusProIdRequest.new(
  credentials: null,
  siret: null,
  identifier_type: null
)
```

