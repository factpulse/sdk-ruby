# FactPulse SDK Ruby

Official Ruby client for the FactPulse API - French electronic invoicing.

## Features

- **Factur-X**: Generation and validation of electronic invoices (MINIMUM, BASIC, EN16931, EXTENDED profiles)
- **Chorus Pro**: Integration with the French public sector invoicing platform
- **AFNOR PDP/PA**: Submission of flows compliant with the XP Z12-013 standard
- **Electronic signature**: PDF signature (PAdES-B-B, PAdES-B-T, PAdES-B-LT)
- **Simplified client**: JWT authentication and integrated polling via `helpers`

## Installation

```bash
gem install factpulse
```

Or in your Gemfile:

```ruby
gem 'factpulse'
```

## Quick Start

The `helpers` module provides a simplified API with automatic authentication and polling:

```ruby
require 'factpulse'
require 'factpulse/helpers'

include Factpulse::Helpers

# Create the client
client = FactPulseClient.new(
  'your_email@example.com',
  'your_password'
)

# Build the invoice using simplified format (auto-calculates totals)
invoice_data = {
  'number' => 'INV-2025-001',
  'supplier' => {
    'name' => 'My Company SAS',
    'siret' => '12345678901234',
    'iban' => 'FR7630001007941234567890185'
  },
  'recipient' => {
    'name' => 'Client SARL',
    'siret' => '98765432109876'
  },
  'lines' => [
    {
      'description' => 'Consulting services',
      'quantity' => 10,
      'unitPrice' => 100.0,
      'vatRate' => 20
    }
  ]
}

# Generate the Factur-X PDF
pdf_bytes = client.generate_facturx(invoice_data, 'source_invoice.pdf')

File.binwrite('invoice_facturx.pdf', pdf_bytes)
```

## Available Helpers (Factpulse::Helpers module)

### amount(value)

Converts a value to a formatted string for monetary amounts.

```ruby
include Factpulse::Helpers

amount(1234.5)      # "1234.50"
amount('1234.56')   # "1234.56"
amount(nil)         # "0.00"
```

### invoice_totals(excl_tax, vat, incl_tax, amount_due, ...)

Creates a complete invoice totals object.

```ruby
totals = invoice_totals(
  1000.00,                  # excl_tax
  200.00,                   # vat
  1200.00,                  # incl_tax
  1200.00,                  # amount_due
  discount_incl_tax: 50.00, # optional
  discount_reason: 'Loyalty discount', # optional
  prepayment: 100.00        # optional
)
```

### invoice_line(line_number, item_name, quantity, unit_net_price, line_net_amount, ...)

Creates an invoice line.

```ruby
line = invoice_line(
  1,
  'Consulting services',
  5,
  200.00,
  1000.00,
  'S',      # vat_category: S, Z, E, AE, K
  'HOUR',   # unit: LUMP_SUM, PIECE, HOUR, DAY...
  {
    vat_rate: 'TVA20',        # Or manual_vat_rate: '20.00'
    reference: 'REF-001'
  }
)
```

### vat_line(taxable_amount, vat_amount, ...)

Creates a VAT breakdown line.

```ruby
vat = vat_line(
  1000.00,    # taxable_amount
  200.00,     # vat_amount
  'S',        # category: S, Z, E, AE, K
  { rate: 'TVA20' }  # Or manual_rate: '20.00'
)
```

### postal_address(line1, postal_code, city, ...)

Creates a structured postal address.

```ruby
address = postal_address(
  '123 Republic Street',
  '75001',
  'Paris',
  'FR',           # country (default: 'FR')
  'Building A'    # line2 (optional)
)
```

### supplier(name, siret, address_line1, postal_code, city, options)

Creates a complete supplier with automatic calculation of SIREN and intra-community VAT.

```ruby
s = supplier(
  'My Company SAS',
  '12345678901234',
  '123 Example Street',
  '75001',
  'Paris',
  { iban: 'FR7630006000011234567890189' }
)
# SIREN and intra-community VAT automatically calculated
```

### recipient(name, siret, address_line1, postal_code, city, options)

Creates a recipient (customer) with automatic calculation of SIREN.

```ruby
r = recipient(
  'Client SARL',
  '98765432109876',
  '456 Test Avenue',
  '69001',
  'Lyon'
)
```

## Zero-Trust Mode (Chorus Pro / AFNOR)

To pass your own credentials without server-side storage:

```ruby
include Factpulse::Helpers

chorus_creds = ChorusProCredentials.new(
  'your_client_id',
  'your_client_secret',
  'your_login',
  'your_password',
  true  # sandbox
)

afnor_creds = AFNORCredentials.new(
  'https://api.pdp.fr/flow/v1',
  'https://auth.pdp.fr/oauth/token',
  'your_client_id',
  'your_client_secret'
)

client = FactPulseClient.new(
  'your_email@example.com',
  'your_password',
  nil,  # api_url
  nil,  # client_uid
  chorus_creds,
  afnor_creds
)
```

## Resources

- **API Documentation**: https://factpulse.fr/api/facturation/documentation
- **Support**: contact@factpulse.fr

## License

MIT License - Copyright (c) 2025 FactPulse
