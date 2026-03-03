# FactPulse::AFNORDirectoryLinePayloadStatusLegalUnitFacilityRoutingCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **addressing_identifier** | **String** | Addressing identifier of the directory line. | [optional] |
| **platform_type** | [**AFNORRecipientPlatformType**](AFNORRecipientPlatformType.md) |  | [optional] |
| **directory_line_status** | [**AFNORDirectoryLineStatus**](AFNORDirectoryLineStatus.md) |  | [optional] |
| **siren** | **String** | SIREN number | [optional] |
| **siret** | **String** | SIRET Number | [optional] |
| **addressing_suffix** | **String** | suffix of the directory line which defines an address mesh not attached to a facility | [optional] |
| **routing_code** | [**AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodeRoutingCode**](AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodeRoutingCode.md) |  | [optional] |
| **legal_unit** | [**AFNORLegalUnitPayloadIncluded**](AFNORLegalUnitPayloadIncluded.md) |  | [optional] |
| **facility** | [**AFNORFacilityPayloadIncluded**](AFNORFacilityPayloadIncluded.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORDirectoryLinePayloadStatusLegalUnitFacilityRoutingCode.new(
  addressing_identifier: dcsc456sdcsdcs556,
  platform_type: null,
  directory_line_status: null,
  siren: 702042755,
  siret: 70204275500240,
  addressing_suffix: dcsc456sdcsdcs556,
  routing_code: null,
  legal_unit: null,
  facility: null
)
```

