# FactPulse::Payee

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **nom** | **String** | Payee name (BT-59). Mandatory. |  |
| **payee_id** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **siren** | **String** |  | [optional] |
| **electronic_address** | [**ElectronicAddress**](ElectronicAddress.md) |  | [optional] |
| **iban** | **String** |  | [optional] |
| **bic** | **String** |  | [optional] |
| **global_ids** | [**Array&lt;ElectronicAddress&gt;**](ElectronicAddress.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Payee.new(
  nom: null,
  payee_id: null,
  siret: null,
  siren: null,
  electronic_address: null,
  iban: null,
  bic: null,
  global_ids: null
)
```

