# FactPulse::AFNORCreateDirectoryLineBodyAddressingInformation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** | SIREN number |  |
| **siret** | **String** | SIRET Number | [optional] |
| **routing_identifier** | **String** | Routing identifier od a routing code. | [optional] |
| **addressing_suffix** | **String** | suffix of the directory line which defines an address mesh not attached to a facility | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORCreateDirectoryLineBodyAddressingInformation.new(
  siren: 702042755,
  siret: 70204275500240,
  routing_identifier: dcsc456sdcsdcs556,
  addressing_suffix: dcsc456sdcsdcs556
)
```

