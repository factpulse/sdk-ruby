# FactPulse::CadreDeFacturation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_cadre_facturation** | [**CodeCadreFacturation**](CodeCadreFacturation.md) |  |  |
| **code_service_valideur** | **String** |  | [optional] |
| **code_structure_valideur** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::CadreDeFacturation.new(
  code_cadre_facturation: null,
  code_service_valideur: null,
  code_structure_valideur: null
)
```

