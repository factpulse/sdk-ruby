# FactPulse::AFNORSearchDirectoryLineFilters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **addressing_identifier** | [**AFNORSearchDirectoryLineFiltersAddressingIdentifier**](AFNORSearchDirectoryLineFiltersAddressingIdentifier.md) |  | [optional] |
| **siren** | [**AFNORSearchSirenFiltersSiren**](AFNORSearchSirenFiltersSiren.md) |  | [optional] |
| **siret** | [**AFNORSearchSiretFiltersSiret**](AFNORSearchSiretFiltersSiret.md) |  | [optional] |
| **routing_identifier** | [**AFNORRoutingCodeSearchFiltersRoutingIdentifier**](AFNORRoutingCodeSearchFiltersRoutingIdentifier.md) |  | [optional] |
| **addressing_suffix** | [**AFNORSearchDirectoryLineFiltersAddressingSuffix**](AFNORSearchDirectoryLineFiltersAddressingSuffix.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchDirectoryLineFilters.new(
  addressing_identifier: null,
  siren: null,
  siret: null,
  routing_identifier: null,
  addressing_suffix: null
)
```

