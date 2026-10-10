# FactPulse::SimplifiedInvoiceData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **number** | **String** | Unique invoice number |  |
| **supplier** | **Hash&lt;String, Object&gt;** | Supplier information (siret, iban, bic, routingAddress, ...). For a seller without an intra-community VAT number (VAT franchise, article 293 B of the CGI), provide &#x60;taxRegistrationId&#x60; (BT-32, usually the SIREN): it satisfies BR-E-02 and prevents BT-31 from being auto-calculated. |  |
| **recipient** | **Hash&lt;String, Object&gt;** | Recipient information (siret, vatNumber for BT-48, ...) |  |
| **lines** | **Array&lt;Hash&lt;String, Object&gt;&gt;** | Invoice lines |  |
| **date** | **String** |  | [optional] |
| **due_days** | **Integer** | Due date in days (default: 30) | [optional][default to 30] |
| **comment** | **String** |  | [optional] |
| **purchase_order_reference** | **String** |  | [optional] |
| **contract_reference** | **String** |  | [optional] |
| **invoice_type** | [**FactureElectroniqueModelsInvoiceTypeCode**](FactureElectroniqueModelsInvoiceTypeCode.md) | Document type (UNTDID 1001). Default: 380 (Invoice). | [optional] |
| **preceding_invoice_reference** | **String** |  | [optional] |
| **operation_nature** | [**OperationNature**](OperationNature.md) |  | [optional] |
| **invoicing_framework** | [**InvoicingFrameworkCode**](InvoicingFrameworkCode.md) |  | [optional] |

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
  contract_reference: null,
  invoice_type: null,
  preceding_invoice_reference: null,
  operation_nature: null,
  invoicing_framework: null
)
```

