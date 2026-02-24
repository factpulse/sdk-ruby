# FactPulse::LifecycleResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoices** | [**Array&lt;InvoiceLifecycle&gt;**](InvoiceLifecycle.md) | Cycles de vie par facture | [optional] |
| **total_invoices** | **Integer** | Nombre de factures |  |
| **cutoff_days** | **Integer** | Nombre de jours de la fenetre de recherche |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::LifecycleResponse.new(
  invoices: null,
  total_invoices: null,
  cutoff_days: null
)
```

