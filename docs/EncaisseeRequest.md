# FactPulse::EncaisseeRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_id** | **String** | Identifiant de la facture (BT-1) |  |
| **invoice_issue_date** | **Date** | Date d&#39;émission de la facture (YYYY-MM-DD) |  |
| **invoice_buyer_siren** | **String** | SIREN de l&#39;acheteur (destinataire du statut) |  |
| **invoice_buyer_electronic_address** | **String** | Adresse électronique de l&#39;acheteur (MDT-73) |  |
| **amount** | [**Amount**](Amount.md) |  |  |
| **currency** | **String** | Code devise ISO 4217 | [optional][default to &#39;EUR&#39;] |
| **sender_siren** | **String** |  | [optional] |
| **flow_type** | **String** | Type de flux (CustomerInvoiceLC pour facture émise) | [optional][default to &#39;CustomerInvoiceLC&#39;] |
| **pdp_flow_service_url** | **String** |  | [optional] |
| **pdp_token_url** | **String** |  | [optional] |
| **pdp_client_id** | **String** |  | [optional] |
| **pdp_client_secret** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::EncaisseeRequest.new(
  invoice_id: null,
  invoice_issue_date: null,
  invoice_buyer_siren: null,
  invoice_buyer_electronic_address: null,
  amount: null,
  currency: null,
  sender_siren: null,
  flow_type: null,
  pdp_flow_service_url: null,
  pdp_token_url: null,
  pdp_client_id: null,
  pdp_client_secret: null
)
```

