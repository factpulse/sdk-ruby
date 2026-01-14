# FactPulse::GetChorusProIdResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **structure_id** | **Integer** | Chorus Pro ID (0 if not found) |  |
| **structure_identifier** | **String** | Searched SIRET/SIREN |  |
| **structure_name** | **String** |  | [optional] |
| **message** | **String** | Return message |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GetChorusProIdResponse.new(
  structure_id: null,
  structure_identifier: null,
  structure_name: null,
  message: null
)
```

