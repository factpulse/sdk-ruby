# FactPulse::Invoicedata

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'factpulse'

FactPulse::Invoicedata.openapi_one_of
# =>
# [
#   :'FacturXInvoice',
#   :'SimplifiedInvoiceData'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'factpulse'

FactPulse::Invoicedata.build(data)
# => #<FacturXInvoice:0x00007fdd4aab02a0>

FactPulse::Invoicedata.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `FacturXInvoice`
- `SimplifiedInvoiceData`
- `nil` (if no type matches)

