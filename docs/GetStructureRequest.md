# FactPulse::GetStructureRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**FactureElectroniqueRestApiSchemasChorusProChorusProCredentials**](FactureElectroniqueRestApiSchemasChorusProChorusProCredentials.md) |  | [optional] |
| **structure_id** | **Integer** | Chorus Pro structure ID |  |
| **language_code** | **String** | Language code (fr, en) | [optional][default to &#39;fr&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GetStructureRequest.new(
  credentials: null,
  structure_id: null,
  language_code: null
)
```

