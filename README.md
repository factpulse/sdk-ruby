# FactPulse SDK Ruby

Official Ruby client for the FactPulse API - French electronic invoicing.

## Features

- **Factur-X**: Generation and validation of electronic invoices (MINIMUM, BASIC, EN16931, EXTENDED profiles)
- **Chorus Pro**: Integration with the French public invoicing platform
- **AFNOR PDP/PA**: Submission of flows compliant with XP Z12-013 standard
- **Electronic signature**: PDF signing (PAdES-B-B, PAdES-B-T, PAdES-B-LT)
- **Thin HTTP wrapper**: Generic `post` and `get` methods with automatic JWT auth and polling

## Installation

```bash
gem install factpulse
```

Or in your Gemfile:

```ruby
gem 'factpulse'
```

## Quick Start

```ruby
require 'factpulse'
require 'base64'

# Create the client
client = FactPulse::Client.new(
  email: 'your_email@example.com',
  password: 'your_password',
  client_uid: 'your-client-uuid'  # From dashboard: Configuration > Clients
)

# Read your source PDF
pdf_b64 = Base64.strict_encode64(File.binread('source_invoice.pdf'))

# Generate Factur-X and submit to PDP in one call
result = client.post('processing/invoices/submit-complete-async',
  invoiceData: {
    number: 'INV-2025-001',
    supplier: {
      name: 'ACME Corporation',
      siret: '12345678901234',
      iban: 'FR7630001007941234567890185',
      routing_address: '12345678901234'
    },
    recipient: {
      name: 'Client Company SA',
      siret: '98765432109876',
      routing_address: '98765432109876'
    },
    lines: [
      {
        description: 'Consulting services',
        quantity: 10,
        unitPrice: 100.0,
        vatRate: 20.0
      }
    ]
  },
  sourcePdf: pdf_b64,
  profile: 'EN16931',
  destination: { type: 'afnor' }
)

# PDF is in result['content'] (auto-polled, auto-decoded)
File.binwrite('facturx_invoice.pdf', result['content'])

puts "Flow ID: #{result['afnorResult']['flowId']}"
```

## API Methods

The SDK provides two generic methods that map directly to API endpoints:

```ruby
# POST /api/v1/{path}
result = client.post('path/to/endpoint', key1: value1, key2: value2)

# GET /api/v1/{path}
result = client.get('path/to/endpoint', param1: value1)
```

### Common Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `processing/invoices/submit-complete-async` | POST | Generate Factur-X + submit to PDP |
| `processing/generate-invoice` | POST | Generate Factur-X XML or PDF |
| `processing/validate-xml` | POST | Validate Factur-X XML |
| `processing/validate-facturx-pdf` | POST | Validate Factur-X PDF |
| `processing/sign-pdf` | POST | Sign PDF with certificate |
| `afnor/flow/v1/flows` | POST | Submit flow to AFNOR PDP |
| `afnor/incoming-flows/{flow_id}` | GET | Get incoming invoice |
| `chorus-pro/factures/soumettre` | POST | Submit to Chorus Pro |

## Webhooks

Instead of polling, you can receive results via webhook by adding `callbackUrl`:

```ruby
result = client.post('processing/invoices/submit-complete-async',
  invoiceData: invoice_data,
  sourcePdf: pdf_b64,
  destination: { type: 'afnor' },
  callbackUrl: 'https://your-server.com/webhook/factpulse',
  webhookMode: 'INLINE'  # or 'DOWNLOAD_URL'
)

task_id = result['taskId']
# Result will be POSTed to your webhook URL
```

### Webhook Receiver Example (Sinatra)

```ruby
require 'sinatra'
require 'json'
require 'openssl'

WEBHOOK_SECRET = 'your-shared-secret'

def verify_signature(payload, signature)
  return false unless signature&.start_with?('sha256=')

  expected = OpenSSL::HMAC.hexdigest('SHA256', WEBHOOK_SECRET, payload)
  Rack::Utils.secure_compare(expected, signature[7..])
end

post '/webhook/factpulse' do
  payload = request.body.read
  signature = request.env['HTTP_X_WEBHOOK_SIGNATURE']

  unless verify_signature(payload, signature)
    halt 401, { error: 'Invalid signature' }.to_json
  end

  event = JSON.parse(payload)
  event_type = event['event_type']
  data = event['data']

  case event_type
  when 'submission.completed'
    flow_id = data.dig('afnorResult', 'flowId')
    puts "Invoice submitted: #{flow_id}"
  when 'submission.failed'
    puts "Submission failed: #{data['error']}"
  end

  content_type :json
  { status: 'received' }.to_json
end
```

### Webhook Event Types

| Event | Description |
|-------|-------------|
| `generation.completed` | Factur-X generated successfully |
| `generation.failed` | Generation failed |
| `validation.completed` | Validation passed |
| `validation.failed` | Validation failed |
| `signature.completed` | PDF signed |
| `submission.completed` | Submitted to PDP/Chorus |
| `submission.failed` | Submission failed |

## Zero-Storage Mode

Pass PDP credentials directly in the request (no server-side storage):

```ruby
result = client.post('processing/invoices/submit-complete-async',
  invoiceData: invoice_data,
  sourcePdf: pdf_b64,
  destination: {
    type: 'afnor',
    flowServiceUrl: 'https://api.pdp.example.com/flow/v1',
    tokenUrl: 'https://auth.pdp.example.com/oauth/token',
    clientId: 'your_pdp_client_id',
    clientSecret: 'your_pdp_client_secret'
  }
)
```

## Error Handling

```ruby
require 'factpulse'

begin
  result = client.post('processing/validate-xml', xmlContent: xml_string)
rescue FactPulse::Error => e
  puts "Error: #{e.message}"
  puts "Status code: #{e.status_code}"
  puts "Details: #{e.details}"
end
```

## Available Helpers

The SDK provides the following helper classes:

- `FactPulse::Client`: Main HTTP client with auto-auth and polling
- `FactPulse::Error`: Base exception class
- `FactPulse::AuthError`: Authentication failure
- `FactPulse::ValidationError`: Validation errors with details
- `FactPulse::PollingTimeout`: Task polling timeout

## Resources

- **API Documentation**: https://factpulse.fr/api/facturation/documentation
- **Support**: contact@factpulse.fr

## License

MIT License - Copyright (c) 2025 FactPulse
