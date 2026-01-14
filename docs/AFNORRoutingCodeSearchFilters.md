# FactPulse::AFNORRoutingCodeSearchFilters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **routing_identifier** | [**AFNORRoutingCodeSearchFiltersRoutingIdentifier**](AFNORRoutingCodeSearchFiltersRoutingIdentifier.md) |  | [optional] |
| **siret** | [**AFNORSearchSiretFiltersSiret**](AFNORSearchSiretFiltersSiret.md) |  | [optional] |
| **routing_code_name** | [**AFNORRoutingCodeSearchFiltersRoutingCodeName**](AFNORRoutingCodeSearchFiltersRoutingCodeName.md) |  | [optional] |
| **administrative_status** | [**AFNORRoutingCodeSearchFiltersAdministrativeStatus**](AFNORRoutingCodeSearchFiltersAdministrativeStatus.md) |  | [optional] |
| **address_lines** | [**AFNORSearchSiretFiltersAddressLines**](AFNORSearchSiretFiltersAddressLines.md) |  | [optional] |
| **postal_code** | [**AFNORSearchSiretFiltersPostalCode**](AFNORSearchSiretFiltersPostalCode.md) |  | [optional] |
| **locality** | [**AFNORSearchSiretFiltersLocality**](AFNORSearchSiretFiltersLocality.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORRoutingCodeSearchFilters.new(
  routing_identifier: null,
  siret: null,
  routing_code_name: null,
  administrative_status: null,
  address_lines: null,
  postal_code: null,
  locality: null
)
```

