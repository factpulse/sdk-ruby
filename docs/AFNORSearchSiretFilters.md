# FactPulse::AFNORSearchSiretFilters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siret** | [**AFNORSearchSiretFiltersSiret**](AFNORSearchSiretFiltersSiret.md) |  | [optional] |
| **siren** | [**AFNORSearchSirenFiltersSiren**](AFNORSearchSirenFiltersSiren.md) |  | [optional] |
| **facility_type** | [**AFNORSearchSiretFiltersFacilityType**](AFNORSearchSiretFiltersFacilityType.md) |  | [optional] |
| **name** | [**AFNORSearchSiretFiltersName**](AFNORSearchSiretFiltersName.md) |  | [optional] |
| **address_lines** | [**AFNORSearchSiretFiltersAddressLines**](AFNORSearchSiretFiltersAddressLines.md) |  | [optional] |
| **postal_code** | [**AFNORSearchSiretFiltersPostalCode**](AFNORSearchSiretFiltersPostalCode.md) |  | [optional] |
| **country_subdivision** | [**AFNORSearchSiretFiltersCountrySubdivision**](AFNORSearchSiretFiltersCountrySubdivision.md) |  | [optional] |
| **locality** | [**AFNORSearchSiretFiltersLocality**](AFNORSearchSiretFiltersLocality.md) |  | [optional] |
| **administrative_status** | [**AFNORSearchSiretFiltersAdministrativeStatus**](AFNORSearchSiretFiltersAdministrativeStatus.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchSiretFilters.new(
  siret: null,
  siren: null,
  facility_type: null,
  name: null,
  address_lines: null,
  postal_code: null,
  country_subdivision: null,
  locality: null,
  administrative_status: null
)
```

