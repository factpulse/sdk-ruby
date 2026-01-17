# FactPulse::SubmitCDARRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **document_id** | **String** | Identifiant unique du message CDAR |  |
| **business_process** | **String** | Code processus métier (REGULATED, B2C, B2BINT, etc.) | [optional][default to &#39;REGULATED&#39;] |
| **type_code** | **String** | Type de message (23&#x3D;Traitement, 305&#x3D;Transmission) | [optional][default to &#39;23&#39;] |
| **sender_siren** | **String** | SIREN de l&#39;émetteur (9 chiffres) |  |
| **sender_role** | **String** | Rôle de l&#39;émetteur (WK, SE, BY, etc.) | [optional][default to &#39;WK&#39;] |
| **sender_name** | **String** |  | [optional] |
| **sender_email** | **String** |  | [optional] |
| **recipients** | [**Array&lt;RecipientInput&gt;**](RecipientInput.md) | Liste des destinataires | [optional] |
| **invoice_id** | **String** | Identifiant de la facture (BT-1) |  |
| **invoice_issue_date** | **Date** | Date d&#39;émission de la facture (YYYY-MM-DD) |  |
| **invoice_type_code** | **String** | Type de document (380&#x3D;Facture, 381&#x3D;Avoir) | [optional][default to &#39;380&#39;] |
| **invoice_seller_siren** | **String** |  | [optional] |
| **invoice_buyer_siren** | **String** |  | [optional] |
| **status** | **String** | Code statut de la facture (200-601) |  |
| **reason_code** | **String** |  | [optional] |
| **reason_text** | **String** |  | [optional] |
| **action_code** | **String** |  | [optional] |
| **encaisse_amount** | [**Encaisseamount**](Encaisseamount.md) |  | [optional] |
| **flow_type** | **String** | Type de flux AFNOR (CustomerInvoiceLC, SupplierInvoiceLC, etc.) | [optional][default to &#39;CustomerInvoiceLC&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitCDARRequest.new(
  document_id: null,
  business_process: null,
  type_code: null,
  sender_siren: null,
  sender_role: null,
  sender_name: null,
  sender_email: null,
  recipients: null,
  invoice_id: null,
  invoice_issue_date: null,
  invoice_type_code: null,
  invoice_seller_siren: null,
  invoice_buyer_siren: null,
  status: null,
  reason_code: null,
  reason_text: null,
  action_code: null,
  encaisse_amount: null,
  flow_type: null
)
```

