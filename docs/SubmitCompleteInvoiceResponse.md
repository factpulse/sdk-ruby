# FactPulse::SubmitCompleteInvoiceResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** | Invoice was successfully submitted |  |
| **destination_type** | **String** | Destination type |  |
| **chorus_result** | [**ChorusProResult**](ChorusProResult.md) |  | [optional] |
| **afnor_result** | [**AFNORResult**](AFNORResult.md) |  | [optional] |
| **enriched_invoice** | [**EnrichedInvoiceInfo**](EnrichedInvoiceInfo.md) | Enriched invoice data |  |
| **facturx_pdf** | [**FacturXPDFInfo**](FacturXPDFInfo.md) | Generated PDF information |  |
| **signature** | [**SignatureInfo**](SignatureInfo.md) |  | [optional] |
| **content_b64** | **String** | Generated Factur-X PDF (and signed if requested) base64-encoded |  |
| **message** | **String** | Return message |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitCompleteInvoiceResponse.new(
  success: null,
  destination_type: null,
  chorus_result: null,
  afnor_result: null,
  enriched_invoice: null,
  facturx_pdf: null,
  signature: null,
  content_b64: null,
  message: null
)
```

