# FactPulse::FacturXInvoice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_number** | **String** |  |  |
| **payment_due_date** | **String** |  |  |
| **invoice_date** | **String** |  | [optional] |
| **submission_mode** | [**SubmissionMode**](SubmissionMode.md) |  |  |
| **recipient** | [**Recipient**](Recipient.md) |  |  |
| **supplier** | [**Supplier**](Supplier.md) |  |  |
| **invoicing_framework** | [**InvoicingFramework**](InvoicingFramework.md) |  |  |
| **references** | [**InvoiceReferences**](InvoiceReferences.md) |  |  |
| **totals** | [**InvoiceTotals**](InvoiceTotals.md) |  |  |
| **invoice_lines** | [**Array&lt;InvoiceLine&gt;**](InvoiceLine.md) |  | [optional] |
| **vat_lines** | [**Array&lt;VATLine&gt;**](VATLine.md) |  | [optional] |
| **notes** | [**Array&lt;InvoiceNote&gt;**](InvoiceNote.md) |  | [optional] |
| **comment** | **String** |  | [optional] |
| **current_user_id** | **Integer** |  | [optional] |
| **supplementary_attachments** | [**Array&lt;SupplementaryAttachment&gt;**](SupplementaryAttachment.md) |  | [optional] |
| **payee** | [**Payee**](Payee.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FacturXInvoice.new(
  invoice_number: null,
  payment_due_date: null,
  invoice_date: null,
  submission_mode: null,
  recipient: null,
  supplier: null,
  invoicing_framework: null,
  references: null,
  totals: null,
  invoice_lines: null,
  vat_lines: null,
  notes: null,
  comment: null,
  current_user_id: null,
  supplementary_attachments: null,
  payee: null
)
```

