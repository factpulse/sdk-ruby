# FactPulse::IncomingSupplier

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Supplier business name (BT-27) |  |
| **siren** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **vat_number** | **String** |  | [optional] |
| **tax_registration_id** | **String** |  | [optional] |
| **postal_address** | [**PostalAddressOutput**](PostalAddressOutput.md) |  | [optional] |
| **electronic_address** | [**ElectronicAddressOutput**](ElectronicAddressOutput.md) |  | [optional] |
| **email** | **String** |  | [optional] |
| **phone** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::IncomingSupplier.new(
  name: null,
  siren: null,
  siret: null,
  vat_number: null,
  tax_registration_id: null,
  postal_address: null,
  electronic_address: null,
  email: null,
  phone: null
)
```

