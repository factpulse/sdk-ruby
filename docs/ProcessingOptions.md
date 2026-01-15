# FactPulse::ProcessingOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **facturx_profile** | [**APIProfile**](APIProfile.md) | Factur-X profile to use | [optional] |
| **auto_enrich** | **Boolean** | Auto-enrich data (Company APIs, Chorus Pro, etc.) | [optional][default to true] |
| **validate_xml** | **Boolean** | Validate Factur-X XML with Schematron | [optional][default to true] |
| **verify_destination_parameters** | **Boolean** | Verify required parameters for destination (e.g., service_code for Chorus) | [optional][default to true] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ProcessingOptions.new(
  facturx_profile: null,
  auto_enrich: null,
  validate_xml: null,
  verify_destination_parameters: null
)
```

