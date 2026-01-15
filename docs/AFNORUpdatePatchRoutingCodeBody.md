# FactPulse::AFNORUpdatePatchRoutingCodeBody

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **routing_identifier_type** | **String** | Routing Identifier type. | [optional] |
| **routing_code_name** | **String** | Name of the directory line routing code. This attribute is only returned if the directory line is defined at the SIREN / SIRET / Routing code mesh. | [optional] |
| **administrative_status** | [**AFNORRoutingCodeAdministrativeStatus**](AFNORRoutingCodeAdministrativeStatus.md) |  | [optional] |
| **address** | [**AFNORAddressPatch**](AFNORAddressPatch.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORUpdatePatchRoutingCodeBody.new(
  routing_identifier_type: 0224,
  routing_code_name: Libellé Code routage,
  administrative_status: null,
  address: null
)
```

