# FactPulse::AFNORRoutingCodePayloadHistoryLegalUnitFacility

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **routing_identifier** | **String** | Routing identifier od a routing code. | [optional] |
| **siret** | **String** | SIRET Number | [optional] |
| **routing_identifier_type** | **String** | Routing Identifier type. | [optional] |
| **routing_code_name** | **String** | Name of the directory line routing code. This attribute is only returned if the directory line is defined at the SIREN / SIRET / Routing code mesh. | [optional] |
| **manages_legal_commitment_code** | **Boolean** | Indicates whether the public structure requires a legal commitment number. This attribute is only returned if the directory line is defined for a public structure at the SIREN / SIRET or SIREN / SIRET / Routing code level. | [optional] |
| **administrative_status** | [**AFNORRoutingCodeAdministrativeStatus**](AFNORRoutingCodeAdministrativeStatus.md) |  | [optional] |
| **address** | [**AFNORAddressRead**](AFNORAddressRead.md) |  | [optional] |
| **legal_unit** | [**AFNORLegalUnitPayloadIncluded**](AFNORLegalUnitPayloadIncluded.md) |  | [optional] |
| **facility** | [**AFNORFacilityPayloadIncluded**](AFNORFacilityPayloadIncluded.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORRoutingCodePayloadHistoryLegalUnitFacility.new(
  routing_identifier: dcsc456sdcsdcs556,
  siret: 70204275500240,
  routing_identifier_type: 0224,
  routing_code_name: Libellé Code routage,
  manages_legal_commitment_code: true,
  administrative_status: null,
  address: null,
  legal_unit: null,
  facility: null
)
```

