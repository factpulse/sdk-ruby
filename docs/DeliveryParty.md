# FactPulse::DeliveryParty

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **global_id** | [**ElectronicAddress**](ElectronicAddress.md) |  | [optional] |
| **name** | **String** |  | [optional] |
| **postal_address** | [**PostalAddress**](PostalAddress.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::DeliveryParty.new(
  id: null,
  global_id: null,
  name: null,
  postal_address: null
)
```

