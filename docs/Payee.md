# FactPulse::Payee

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nom** | **String** | Payee name (BT-59). Mandatory. |  |
| **siret** | **String** |  | [optional] |
| **siren** | **String** |  | [optional] |
| **electronic_address** | [**ElectronicAddress**](ElectronicAddress.md) |  | [optional] |
| **iban** | **String** |  | [optional] |
| **bic** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Payee.new(
  nom: null,
  siret: null,
  siren: null,
  electronic_address: null,
  iban: null,
  bic: null
)
```

