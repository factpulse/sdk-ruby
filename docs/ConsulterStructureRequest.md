# FactPulse::ConsulterStructureRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **id_structure_cpp** | **Integer** | ID Chorus Pro de la structure |  |
| **code_langue** | **String** | Code langue (fr, en) | [optional][default to &#39;fr&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConsulterStructureRequest.new(
  credentials: null,
  id_structure_cpp: null,
  code_langue: null
)
```

