# OpenapiClient::GetChorusProIdRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **siret** | **String** | Structure SIRET (14 digits) |  |
| **identifier_type** | **String** | Identifier type (SIRET, SIREN, UE_HORS_FRANCE, etc.) | [optional][default to &#39;SIRET&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GetChorusProIdRequest.new(
  credentials: null,
  siret: null,
  identifier_type: null
)
```

