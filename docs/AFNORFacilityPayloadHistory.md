# FactPulse::AFNORFacilityPayloadHistory

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siret** | **String** | SIRET Number | [optional] |
| **siren** | **String** | SIREN number | [optional] |
| **name** | **String** | business name | [optional] |
| **facility_type** | [**AFNORFacilityType**](AFNORFacilityType.md) |  | [optional] |
| **diffusible** | [**AFNORDiffusionStatus**](AFNORDiffusionStatus.md) |  | [optional] |
| **administrative_status** | [**AFNORFacilityAdministrativeStatus**](AFNORFacilityAdministrativeStatus.md) |  | [optional] |
| **address** | [**AFNORAddressRead**](AFNORAddressRead.md) |  | [optional] |
| **b2g_additional_data** | [**AFNORFacilityPayloadHistoryUleB2gAdditionalData**](AFNORFacilityPayloadHistoryUleB2gAdditionalData.md) |  | [optional] |
| **legal_unit** | [**AFNORLegalUnitPayloadIncludedNoSiren**](AFNORLegalUnitPayloadIncludedNoSiren.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORFacilityPayloadHistory.new(
  siret: 70204275500240,
  siren: 702042755,
  name: Boulangerie Pascale,
  facility_type: null,
  diffusible: null,
  administrative_status: null,
  address: null,
  b2g_additional_data: null,
  legal_unit: null
)
```

