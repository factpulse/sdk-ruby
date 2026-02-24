# FactPulse::FacturXInvoice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_number** | **String** |  |  |
| **payment_due_date** | **String** |  |  |
| **invoice_date** | **String** |  | [optional] |
| **submission_mode** | [**SubmissionMode**](SubmissionMode.md) |  | [optional] |
| **recipient** | [**Recipient**](Recipient.md) |  |  |
| **supplier** | [**Supplier**](Supplier.md) |  |  |
| **invoicing_framework** | [**InvoicingFramework**](InvoicingFramework.md) |  | [optional] |
| **references** | [**InvoiceReferences**](InvoiceReferences.md) |  |  |
| **totals** | [**InvoiceTotals**](InvoiceTotals.md) |  |  |
| **invoice_lines** | [**Array&lt;InvoiceLine&gt;**](InvoiceLine.md) |  | [optional] |
| **vat_lines** | [**Array&lt;VATLine&gt;**](VATLine.md) |  | [optional] |
| **notes** | [**Array&lt;InvoiceNote&gt;**](InvoiceNote.md) |  | [optional] |
| **comment** | **String** |  | [optional] |
| **current_user_id** | **Integer** |  | [optional] |
| **supplementary_attachments** | [**Array&lt;SupplementaryAttachment&gt;**](SupplementaryAttachment.md) |  | [optional] |
| **payee** | [**Payee**](Payee.md) |  | [optional] |
| **delivery_party** | [**DeliveryParty**](DeliveryParty.md) |  | [optional] |
| **tax_representative** | [**TaxRepresentative**](TaxRepresentative.md) |  | [optional] |
| **delivery_date** | **String** |  | [optional] |
| **billing_period_start** | **String** |  | [optional] |
| **billing_period_end** | **String** |  | [optional] |
| **payment_reference** | **String** |  | [optional] |
| **creditor_reference_id** | **String** |  | [optional] |
| **direct_debit_mandate_id** | **String** |  | [optional] |
| **debtor_iban** | **String** |  | [optional] |
| **payment_terms** | **String** |  | [optional] |
| **allowances_charges** | [**Array&lt;AllowanceCharge&gt;**](AllowanceCharge.md) |  | [optional] |
| **additional_documents** | [**Array&lt;AdditionalDocument&gt;**](AdditionalDocument.md) |  | [optional] |
| **buyer_accounting_reference** | **String** |  | [optional] |
| **payment_card** | [**PaymentCard**](PaymentCard.md) |  | [optional] |

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
  payee: null,
  delivery_party: null,
  tax_representative: null,
  delivery_date: null,
  billing_period_start: null,
  billing_period_end: null,
  payment_reference: null,
  creditor_reference_id: null,
  direct_debit_mandate_id: null,
  debtor_iban: null,
  payment_terms: null,
  allowances_charges: null,
  additional_documents: null,
  buyer_accounting_reference: null,
  payment_card: null
)
```

