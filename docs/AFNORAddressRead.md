# FactPulse::AFNORAddressRead

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_line1** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). | [optional] |
| **address_line2** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). | [optional] |
| **address_line3** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). | [optional] |
| **postal_code** | **String** | Service postal code | [optional] |
| **country_subdivision** | **String** | Subdivision of the country | [optional] |
| **locality** | **String** | Municipality of the recipient structure having defined the directory line(s). | [optional] |
| **country_code** | **String** | Corresponds to the country of the recipient structure. | [optional] |
| **country_name** | **String** | Corresponds to the country of the recipient structure having defined the directory line(s). | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORAddressRead.new(
  address_line1: 16 BIS RUE HENRI BARBUSSE,
  address_line2: CEDEX 1,
  address_line3: Bâtiment le Callipso,
  postal_code: 38100,
  country_subdivision: Bretagne,
  locality: Grenoble,
  country_code: FR,
  country_name: France
)
```

