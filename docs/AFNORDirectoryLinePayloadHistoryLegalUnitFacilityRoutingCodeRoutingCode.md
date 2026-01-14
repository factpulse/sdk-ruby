# FactPulse::AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodeRoutingCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **routing_identifier** | **String** | Routing identifier od a routing code. | [optional] |
| **routing_identifier_type** | **String** | Routing Identifier type. | [optional] |
| **routing_code_name** | **String** | Name of the directory line routing code. This attribute is only returned if the directory line is defined at the SIREN / SIRET / Routing code mesh. | [optional] |
| **manages_legal_commitment** | **Boolean** | Indicates whether the public structure requires a legal commitment number. This attribute is only returned if the directory line is defined for a public structure at the SIREN / SIRET or SIREN / SIRET / Routing code level. | [optional] |
| **administrative_status** | [**AFNORRoutingCodeAdministrativeStatus**](AFNORRoutingCodeAdministrativeStatus.md) |  | [optional] |
| **address** | [**AFNORAddressRead**](AFNORAddressRead.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodeRoutingCode.new(
  routing_identifier: dcsc456sdcsdcs556,
  routing_identifier_type: 0224,
  routing_code_name: Libellé Code routage,
  manages_legal_commitment: true,
  administrative_status: null,
  address: null
)
```

