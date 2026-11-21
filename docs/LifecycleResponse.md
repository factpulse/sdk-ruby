# FactPulse::LifecycleResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoices** | [**Array&lt;InvoiceLifecycle&gt;**](InvoiceLifecycle.md) | Cycles de vie par facture | [optional] |
| **total_invoices** | **Integer** | Nombre de factures |  |
| **cutoff_days** | **Integer** | Nombre de jours de la fenetre de recherche |  |
| **total_flows** | **Integer** | Nombre de flux de statut (CDAR) lus sur la PA | [optional][default to 0] |
| **truncated** | **Boolean** | True si la limite de flux lus par appel a ete atteinte : la reponse est incomplete, reduire la fenetre (dateFrom/dateTo ou days) | [optional][default to false] |
| **date_from** | **String** |  | [optional] |
| **date_to** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::LifecycleResponse.new(
  invoices: null,
  total_invoices: null,
  cutoff_days: null,
  total_flows: null,
  truncated: null,
  date_from: null,
  date_to: null
)
```

