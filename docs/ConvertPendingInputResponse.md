# FactPulse::ConvertPendingInputResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;pending_input&#39;] |
| **conversion_id** | **String** |  |  |
| **message** | **String** |  | [optional][default to &#39;Donnees manquantes requises pour la conformite&#39;] |
| **extraction** | [**ExtractionInfo**](ExtractionInfo.md) |  |  |
| **extracted_data** | **Hash&lt;String, Object&gt;** | Donnees extraites par OCR au format FacturXInvoice |  |
| **missing_fields** | [**Array&lt;MissingField&gt;**](MissingField.md) |  |  |
| **resume_url** | **String** |  |  |
| **expires_at** | **Time** |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConvertPendingInputResponse.new(
  status: null,
  conversion_id: null,
  message: null,
  extraction: null,
  extracted_data: null,
  missing_fields: null,
  resume_url: null,
  expires_at: null
)
```

