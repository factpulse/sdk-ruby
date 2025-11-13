# FactPulse::ResultatChorusPro

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **identifiant_facture_cpp** | **Integer** | ID Chorus Pro de la facture soumise |  |
| **numero_flux_depot** | **String** |  | [optional] |
| **piece_jointe_id** | **Integer** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ResultatChorusPro.new(
  identifiant_facture_cpp: null,
  numero_flux_depot: null,
  piece_jointe_id: null
)
```

