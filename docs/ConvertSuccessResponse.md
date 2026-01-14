# OpenapiClient::ConvertSuccessResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Statut de la conversion | [optional][default to &#39;success&#39;] |
| **conversion_id** | **String** | Identifiant unique de conversion |  |
| **document_type** | [**DocumentTypeInfo**](DocumentTypeInfo.md) |  |  |
| **invoice** | **Hash&lt;String, Object&gt;** | Donnees facture au format FacturXInvoice (cf. models.py) |  |
| **extraction** | [**ExtractionInfo**](ExtractionInfo.md) |  |  |
| **validation** | [**ValidationInfo**](ValidationInfo.md) |  |  |
| **files** | [**FilesInfo**](FilesInfo.md) |  |  |
| **processing_time_ms** | **Integer** | Temps de traitement en ms |  |
| **pdf_regenerated** | **Boolean** | True si le PDF a ete regenere (source non exploitable) | [optional][default to false] |
| **pdf_regenerated_reason** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ConvertSuccessResponse.new(
  status: null,
  conversion_id: null,
  document_type: null,
  invoice: null,
  extraction: null,
  validation: null,
  files: null,
  processing_time_ms: null,
  pdf_regenerated: null,
  pdf_regenerated_reason: null
)
```

