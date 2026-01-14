# OpenapiClient::SubmitCompleteInvoiceRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_data** | [**SimplifiedInvoiceData**](SimplifiedInvoiceData.md) | Invoice data in simplified format (see examples) |  |
| **source_pdf** | **String** | Base64-encoded source PDF (will be transformed to Factur-X) |  |
| **destination** | [**Destination**](Destination.md) |  |  |
| **signature** | [**SignatureParameters**](SignatureParameters.md) |  | [optional] |
| **options** | [**ProcessingOptions**](ProcessingOptions.md) | Processing options | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SubmitCompleteInvoiceRequest.new(
  invoice_data: null,
  source_pdf: null,
  destination: null,
  signature: null,
  options: null
)
```

