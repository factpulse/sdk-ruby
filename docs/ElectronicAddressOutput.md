# FactPulse::ElectronicAddressOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **identifier** | **String** | Electronic address identifier (e.g., SIREN, SIRET, routing code) |  |
| **scheme_id** | [**SchemeID**](SchemeID.md) | Identification scheme (EAS code) | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ElectronicAddressOutput.new(
  identifier: null,
  scheme_id: null
)
```

