# OpenapiClient::AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **addressing_identifier** | **String** | Addressing identifier of the directory line. | [optional] |
| **siren** | **String** | SIREN number | [optional] |
| **siret** | **String** | SIRET Number | [optional] |
| **addressing_suffix** | **String** | suffix of the directory line which defines an address mesh not attached to a facility | [optional] |
| **routing_code** | [**AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodeRoutingCode**](AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodeRoutingCode.md) |  | [optional] |
| **platform** | [**AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodePlatform**](AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCodePlatform.md) |  | [optional] |
| **legal_unit** | [**AFNORLegalUnitPayloadIncludedNoSiren**](AFNORLegalUnitPayloadIncludedNoSiren.md) |  | [optional] |
| **facility** | [**AFNORFacilityPayloadIncluded**](AFNORFacilityPayloadIncluded.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode.new(
  addressing_identifier: dcsc456sdcsdcs556,
  siren: 702042755,
  siret: 70204275500240,
  addressing_suffix: dcsc456sdcsdcs556,
  routing_code: null,
  platform: null,
  legal_unit: null,
  facility: null
)
```

