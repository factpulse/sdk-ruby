# FactPulse::AFNORSearchSirenFilters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | [**AFNORSearchSirenFiltersSiren**](AFNORSearchSirenFiltersSiren.md) |  | [optional] |
| **business_name** | [**AFNORSearchSirenFiltersBusinessName**](AFNORSearchSirenFiltersBusinessName.md) |  | [optional] |
| **entity_type** | [**AFNORSearchSirenFiltersEntityType**](AFNORSearchSirenFiltersEntityType.md) |  | [optional] |
| **administrative_status** | [**AFNORSearchSirenFiltersAdministrativeStatus**](AFNORSearchSirenFiltersAdministrativeStatus.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSirenFilters.new(
  siren: null,
  business_name: null,
  entity_type: null,
  administrative_status: null
)
```

