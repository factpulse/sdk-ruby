# FactPulse::FactureElectroniqueRestApiSchemasCdarValidationErrorResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **field** | **String** | Champ concerné |  |
| **message** | **String** | Message d&#39;erreur |  |
| **rule** | **String** |  | [optional] |
| **severity** | **String** | Sévérité (error/warning) | [optional][default to &#39;error&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FactureElectroniqueRestApiSchemasCdarValidationErrorResponse.new(
  field: null,
  message: null,
  rule: null,
  severity: null
)
```

