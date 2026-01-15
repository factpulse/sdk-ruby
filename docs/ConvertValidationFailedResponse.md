# FactPulse::ConvertValidationFailedResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Statut de la conversion | [optional][default to &#39;validation_failed&#39;] |
| **conversion_id** | **String** | Identifiant unique de conversion |  |
| **message** | **String** | Message explicatif | [optional][default to &#39;Donnees extraites avec erreurs de validation. Completez le formulaire et appelez /resume.&#39;] |
| **extraction** | [**ExtractionInfo**](ExtractionInfo.md) | Informations sur l&#39;extraction OCR |  |
| **extracted_data** | **Hash&lt;String, Object&gt;** | Donnees extraites par OCR au format FacturXInvoice (a completer/corriger) |  |
| **missing_fields** | [**Array&lt;MissingField&gt;**](MissingField.md) | Champs manquants pour conformite Factur-X | [optional] |
| **validation** | [**ValidationInfo**](ValidationInfo.md) | Resultat de la validation Factur-X |  |
| **resume_url** | **String** | URL pour reprendre la conversion avec corrections |  |
| **expires_at** | **Time** | Expiration de la conversion (1h) |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ConvertValidationFailedResponse.new(
  status: null,
  conversion_id: null,
  message: null,
  extraction: null,
  extracted_data: null,
  missing_fields: null,
  validation: null,
  resume_url: null,
  expires_at: null
)
```

