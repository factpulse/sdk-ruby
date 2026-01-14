# FactPulse::ValidationInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **profile** | **String** | Profil Factur-X utilise |  |
| **schematron_rules_passed** | **Integer** | Regles passees |  |
| **schematron_rules_total** | **Integer** | Total regles |  |
| **pdfa_compliant** | **Boolean** | PDF/A-3 conforme | [optional][default to true] |
| **xml_embedded** | **Boolean** | XML embarque dans PDF | [optional][default to true] |
| **errors** | [**Array&lt;FactureElectroniqueRestApiSchemasConvertValidationError&gt;**](FactureElectroniqueRestApiSchemasConvertValidationError.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ValidationInfo.new(
  profile: null,
  schematron_rules_passed: null,
  schematron_rules_total: null,
  pdfa_compliant: null,
  xml_embedded: null,
  errors: null
)
```

