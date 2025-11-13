# FactPulse::AdressePostale

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_postal** | **String** |  | [optional] |
| **ligne_un** | **String** |  | [optional] |
| **ligne_deux** | **String** |  | [optional] |
| **nom_ville** | **String** |  | [optional] |
| **pays_code_iso** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AdressePostale.new(
  code_postal: null,
  ligne_un: null,
  ligne_deux: null,
  nom_ville: null,
  pays_code_iso: null
)
```

