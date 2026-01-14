# FactPulse SDK Ruby

Official Ruby client for the FactPulse API.

## Installation

```ruby
gem 'factpulse'
```

Or install directly:

```bash
gem install factpulse
```

## Quick Start

```ruby
require 'factpulse'

client = FactPulse::Client.new(
  email: 'your_email@example.com',
  password: 'your_password'
)

# Generate a Factur-X invoice
pdf_bytes = client.generate_facturx(
  invoice_data: {
    number: 'INV-2025-001',
    supplier: { name: 'My Company', siret: '12345678901234' },
    recipient: { name: 'Client', siret: '98765432109876' },
    lines: [{ description: 'Service', quantity: 1, unit_price: 1000 }]
  },
  pdf_source: File.read('source.pdf'),
  profile: 'EN16931'
)

File.write('facturx.pdf', pdf_bytes)
```

## License

MIT
