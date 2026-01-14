# FactPulse::ValidateEReportingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **valid** | **Boolean** | Whether the data is valid |  |
| **report_id** | **String** | Report identifier |  |
| **flow_type** | **String** | Flux type |  |
| **errors** | [**Array&lt;FactureElectroniqueRestApiSchemasEreportingValidationError&gt;**](FactureElectroniqueRestApiSchemasEreportingValidationError.md) | List of validation errors (if any) | [optional] |
| **warnings** | [**Array&lt;FactureElectroniqueRestApiSchemasEreportingValidationError&gt;**](FactureElectroniqueRestApiSchemasEreportingValidationError.md) | List of validation warnings (if any) | [optional] |
| **message** | **String** | Status message |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidateEReportingResponse.new(
  valid: null,
  report_id: null,
  flow_type: null,
  errors: null,
  warnings: null,
  message: null
)
```

