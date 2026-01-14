# OpenapiClient::AFNORAddressEdit

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ligne_adresse1** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). | [optional] |
| **ligne_adresse2** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). | [optional] |
| **ligne_adresse3** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). | [optional] |
| **postal_code** | **String** | Service postal code | [optional] |
| **country_subdivision** | **String** | Subdivision of the country | [optional] |
| **locality** | **String** | Municipality of the recipient structure having defined the directory line(s). | [optional] |
| **code_pays** | **String** | Corresponds to the country of the recipient structure. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORAddressEdit.new(
  ligne_adresse1: 16 BIS RUE HENRI BARBUSSE,
  ligne_adresse2: CEDEX 1,
  ligne_adresse3: Bâtiment le Callipso,
  postal_code: 38100,
  country_subdivision: Bretagne,
  locality: Grenoble,
  code_pays: FR
)
```

