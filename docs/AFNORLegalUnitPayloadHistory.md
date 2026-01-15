# FactPulse::AFNORLegalUnitPayloadHistory

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** | SIREN number | [optional] |
| **business_name** | **String** | Business name | [optional] |
| **entity_type** | [**AFNOREntityType**](AFNOREntityType.md) |  | [optional] |
| **administrative_status** | [**AFNORLegalUnitAdministrativeStatus**](AFNORLegalUnitAdministrativeStatus.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORLegalUnitPayloadHistory.new(
  siren: 702042755,
  business_name: Boulangerie Pascale,
  entity_type: null,
  administrative_status: null
)
```

