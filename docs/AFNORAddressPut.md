# OpenapiClient::AFNORAddressPut

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ligne_adresse1** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). |  |
| **ligne_adresse2** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). |  |
| **ligne_adresse3** | **String** | Corresponds to the address of the recipient structure having defined the directory line(s). |  |
| **postal_code** | **String** | Service postal code |  |
| **country_subdivision** | **String** | Subdivision of the country |  |
| **locality** | **String** | Corresponds to the municipality of the recipient structure having defined the directory line(s). |  |
| **code_pays** | **String** | Corresponds to the country code of the recipient structure |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORAddressPut.new(
  ligne_adresse1: 16 BIS RUE HENRI BARBUSSE,
  ligne_adresse2: CEDEX 1,
  ligne_adresse3: Bâtiment le Callipso,
  postal_code: 38100,
  country_subdivision: Bretagne,
  locality: Grenoble,
  code_pays: FR
)
```

