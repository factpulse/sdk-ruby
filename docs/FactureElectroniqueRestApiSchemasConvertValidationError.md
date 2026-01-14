# FactPulse::FactureElectroniqueRestApiSchemasConvertValidationError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rule** | **String** | Code de la regle (BR-XX, BR-FR-XX) |  |
| **bt_code** | **String** |  | [optional] |
| **severity** | **String** | Gravite: error, warning |  |
| **message** | **String** | Message d&#39;erreur |  |
| **suggested_value** | **String** |  | [optional] |
| **suggested_field** | **String** |  | [optional] |
| **explanation** | **String** |  | [optional] |
| **confidence** | **Float** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FactureElectroniqueRestApiSchemasConvertValidationError.new(
  rule: null,
  bt_code: null,
  severity: null,
  message: null,
  suggested_value: null,
  suggested_field: null,
  explanation: null,
  confidence: null
)
```

