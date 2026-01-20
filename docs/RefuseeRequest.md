# FactPulse::RefuseeRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_id** | **String** | Identifiant de la facture (BT-1) |  |
| **invoice_issue_date** | **Date** | Date d&#39;émission de la facture (YYYY-MM-DD) |  |
| **sender_siren** | **String** |  | [optional] |
| **flow_type** | **String** | Type de flux: SupplierInvoiceLC (acheteur) ou CustomerInvoiceLC (vendeur) | [optional][default to &#39;SupplierInvoiceLC&#39;] |
| **pdp_flow_service_url** | **String** |  | [optional] |
| **pdp_token_url** | **String** |  | [optional] |
| **pdp_client_id** | **String** |  | [optional] |
| **pdp_client_secret** | **String** |  | [optional] |
| **reason_code** | **String** | Code motif du refus (obligatoire). Valeurs autorisées: TX_TVA_ERR, MONTANTTOTAL_ERR, CALCUL_ERR, NON_CONFORME, DOUBLON, DEST_ERR, TRANSAC_INC, EMMET_INC, CONTRAT_TERM, DOUBLE_FACT, CMD_ERR, ADR_ERR, REF_CT_ABSENT |  |
| **reason_text** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::RefuseeRequest.new(
  invoice_id: null,
  invoice_issue_date: null,
  sender_siren: null,
  flow_type: null,
  pdp_flow_service_url: null,
  pdp_token_url: null,
  pdp_client_id: null,
  pdp_client_secret: null,
  reason_code: null,
  reason_text: null
)
```

