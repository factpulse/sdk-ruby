# FactPulse::ReportSender

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** | SIREN or SIRET number of the sender (PA or company) |  |
| **name** | **String** | Company name |  |
| **scheme_id** | **String** |  | [optional] |
| **vat_id** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ReportSender.new(
  siren: 123456789,
  name: Ma Société SARL,
  scheme_id: null,
  vat_id: null
)
```

