# FactPulse::ParseFacturXResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Parsing status |  |
| **invoice** | **Hash&lt;String, Object&gt;** | Parsed invoice data. For CII/Factur-X: FacturXInvoice format (round-trip with /generate-invoice). For UBL: IncomingInvoice format (summary extraction). |  |
| **detected_format** | **String** |  | [optional] |
| **detected_profile** | **String** |  | [optional] |
| **error** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ParseFacturXResponse.new(
  status: null,
  invoice: null,
  detected_format: null,
  detected_profile: null,
  error: null
)
```

