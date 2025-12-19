# FactPulse::Recipient

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **electronic_address** | [**ElectronicAddress**](ElectronicAddress.md) |  |  |
| **executing_service_code** | **String** |  | [optional] |
| **name** | **String** |  | [optional] |
| **siren** | **String** |  | [optional] |
| **siret** | **String** |  | [optional] |
| **postal_address** | [**PostalAddress**](PostalAddress.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::Recipient.new(
  electronic_address: null,
  executing_service_code: null,
  name: null,
  siren: null,
  siret: null,
  postal_address: null
)
```

