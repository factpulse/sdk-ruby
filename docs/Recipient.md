# FactPulse::Recipient

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **electronic_address** | [**ElectronicAddressInput**](ElectronicAddressInput.md) |  | [optional] |
| **executing_service_code** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **siren** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **vat_number** | **String** |  | [optional] |
| **postal_address** | [**PostalAddressInput**](PostalAddressInput.md) |  | [optional] |
| **contact** | [**Contact**](Contact.md) |  | [optional] |
| **global_ids** | [**Array&lt;ElectronicAddressInput&gt;**](ElectronicAddressInput.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Recipient.new(
  electronic_address: null,
  executing_service_code: null,
  name: null,
  siren: null,
  siret: null,
  vat_number: null,
  postal_address: null,
  contact: null,
  global_ids: null
)
```

