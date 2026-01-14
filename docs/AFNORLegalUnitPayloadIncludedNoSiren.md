# OpenapiClient::AFNORLegalUnitPayloadIncludedNoSiren

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **business_name** | **String** | Business name | [optional] |
| **entity_type** | [**AFNOREntityType**](AFNOREntityType.md) |  | [optional] |
| **administrative_status** | [**AFNORLegalUnitAdministrativeStatus**](AFNORLegalUnitAdministrativeStatus.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORLegalUnitPayloadIncludedNoSiren.new(
  business_name: Boulangerie Pascale,
  entity_type: null,
  administrative_status: null
)
```

