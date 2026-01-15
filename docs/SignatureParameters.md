# FactPulse::SignatureParameters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key_pem** | **String** |  | [optional] |
| **cert_pem** | **String** |  | [optional] |
| **key_passphrase** | **String** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **location** | **String** |  | [optional] |
| **contact** | **String** |  | [optional] |
| **field_name** | **String** | PDF signature field name | [optional][default to &#39;FactPulseSignature&#39;] |
| **use_pades_lt** | **Boolean** | Enable PAdES-B-LT (long-term archival). REQUIRES certificate with OCSP/CRL access | [optional][default to false] |
| **use_timestamp** | **Boolean** | Enable RFC 3161 timestamping with FreeTSA (PAdES-B-T) | [optional][default to true] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SignatureParameters.new(
  key_pem: null,
  cert_pem: null,
  key_passphrase: null,
  reason: null,
  location: null,
  contact: null,
  field_name: null,
  use_pades_lt: null,
  use_timestamp: null
)
```

