# FactPulse::ValidateCDARResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **valid** | **Boolean** | Résultat de validation |  |
| **errors** | [**Array&lt;FactureElectroniqueRestApiSchemasCdarValidationErrorResponse&gt;**](FactureElectroniqueRestApiSchemasCdarValidationErrorResponse.md) | Liste des erreurs | [optional] |
| **warnings** | [**Array&lt;FactureElectroniqueRestApiSchemasCdarValidationErrorResponse&gt;**](FactureElectroniqueRestApiSchemasCdarValidationErrorResponse.md) | Liste des avertissements | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidateCDARResponse.new(
  valid: null,
  errors: null,
  warnings: null
)
```

