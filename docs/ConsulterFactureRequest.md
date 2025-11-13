# FactPulse::ConsulterFactureRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credentials** | [**ChorusProCredentials**](ChorusProCredentials.md) |  | [optional] |
| **identifiant_facture_cpp** | **Integer** | ID Chorus Pro de la facture |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConsulterFactureRequest.new(
  credentials: null,
  identifiant_facture_cpp: null
)
```

