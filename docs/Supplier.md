# FactPulse::Supplier

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **electronic_address** | [**ElectronicAddress**](ElectronicAddress.md) |  |  |
| **supplier_id** | **Integer** |  |  |
| **supplier_bank_account_code** | **Integer** |  | [optional] |
| **supplier_service_id** | **Integer** |  | [optional] |
| **name** | **String** |  | [optional] |
| **siren** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **vat_number** | **String** |  | [optional] |
| **iban** | **String** |  | [optional] |
| **postal_address** | [**PostalAddress**](PostalAddress.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Supplier.new(
  electronic_address: null,
  supplier_id: null,
  supplier_bank_account_code: null,
  supplier_service_id: null,
  name: null,
  siren: null,
  siret: null,
  vat_number: null,
  iban: null,
  postal_address: null
)
```

