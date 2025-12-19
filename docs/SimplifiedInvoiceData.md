# FactPulse::SimplifiedInvoiceData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **number** | **String** | Unique invoice number |  |
| **supplier** | **Hash&lt;String, Object&gt;** | Supplier information (siret, iban, ...) |  |
| **recipient** | **Hash&lt;String, Object&gt;** | Recipient information (siret, ...) |  |
| **lines** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Invoice lines |  |
| **date** | **String** |  | [optional] |
| **due_days** | **Integer** | Due date in days (default: 30) | [optional][default to 30] |
| **comment** | **String** |  | [optional] |
| **purchase_order_reference** | **String** |  | [optional] |
| **contract_reference** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SimplifiedInvoiceData.new(
  number: null,
  supplier: null,
  recipient: null,
  lines: null,
  date: null,
  due_days: null,
  comment: null,
  purchase_order_reference: null,
  contract_reference: null
)
```

