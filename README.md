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

The `FactPulse::Helpers` module provides a simplified API with automatic authentication and polling:

```ruby
require 'factpulse'

include FactPulse::Helpers

# Create the client
client = FactPulseClient.new(
  email: 'your_email@example.com',
  password: 'your_password'
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

## Available Helpers (FactPulse::Helpers::AmountHelpers module)

### amount(value)

Converts a value to a formatted string for monetary amounts.

```ruby
include FactPulse::Helpers

AmountHelpers.amount(1234.5)      # "1234.50"
AmountHelpers.amount('1234.56')   # "1234.56"
AmountHelpers.amount(nil)         # "0.00"
```

### invoice_totals(excl_tax, vat, incl_tax, amount_due, ...)

Creates a complete invoice totals object.

```ruby
totals = AmountHelpers.invoice_totals(
  1000.00,                  # excl_tax
  200.00,                   # vat
  1200.00,                  # incl_tax
  1200.00,                  # amount_due
  discount_incl_tax: 50.00, # optional
  discount_reason: 'Loyalty discount', # optional
  prepayment: 100.00        # optional
)
```

### invoice_line(number, description, quantity, unit_price_excl_tax, line_total_excl_tax, ...)

Creates an invoice line.

```ruby
line = AmountHelpers.invoice_line(
  1,
  'Consulting services',
  5,
  200.00,
  1000.00,
  vat_rate: '20.00',    # vatRateManual
  vat_category: 'S',    # S, Z, E, AE, K
  unit: 'LUMP_SUM',     # LUMP_SUM, PIECE, HOUR, DAY...
  reference: 'REF-001'  # optional
)
```

### vat_line(rate_manual, base_amount_excl_tax, vat_amount, category)

Creates a VAT breakdown line.

```ruby
vat = AmountHelpers.vat_line(
  '20.00',    # rate_manual
  1000.00,    # base_amount_excl_tax
  200.00,     # vat_amount
  category: 'S'  # S, Z, E, AE, K
)
```

### postal_address(line1, postal_code, city, ...)

Creates a structured postal address.

```ruby
address = AmountHelpers.postal_address(
  '123 Republic Street',
  '75001',
  'Paris',
  country: 'FR',        # default: 'FR'
  line2: 'Building A'   # optional
)
```

### supplier(name, siret, address_line1, postal_code, city, options)

Creates a complete supplier with automatic calculation of SIREN and intra-community VAT.

```ruby
s = AmountHelpers.supplier(
  'My Company SAS',
  '12345678901234',
  '123 Example Street',
  '75001',
  'Paris',
  iban: 'FR7630006000011234567890189'
)
# SIREN and intra-community VAT automatically calculated
```

### recipient(name, siret, address_line1, postal_code, city, options)

Creates a recipient (customer) with automatic calculation of SIREN.

```ruby
r = AmountHelpers.recipient(
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
include FactPulse::Helpers

chorus_creds = ChorusProCredentials.new(
  piste_client_id: 'your_client_id',
  piste_client_secret: 'your_client_secret',
  chorus_pro_login: 'your_login',
  chorus_pro_password: 'your_password',
  sandbox: true
)

afnor_creds = AFNORCredentials.new(
  flow_service_url: 'https://api.pdp.fr/flow/v1',
  token_url: 'https://auth.pdp.fr/oauth/token',
  client_id: 'your_client_id',
  client_secret: 'your_client_secret'
)

client = FactPulseClient.new(
  email: 'your_email@example.com',
  password: 'your_password',
  chorus_credentials: chorus_creds,
  afnor_credentials: afnor_creds
)
```

## Resources

- **API Documentation**: https://factpulse.fr/api/facturation/documentation
- **Support**: contact@factpulse.fr

## License

MIT License - Copyright (c) 2025 FactPulse
