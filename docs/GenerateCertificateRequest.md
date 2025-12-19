# FactPulse::GenerateCertificateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cn** | **String** | Common Name (CN) - Certificate name | [optional][default to &#39;Test Signature FactPulse&#39;] |
| **organization** | **String** | Organization (O) | [optional][default to &#39;FactPulse Test&#39;] |
| **country** | **String** | ISO 2-letter country code (C) | [optional][default to &#39;FR&#39;] |
| **city** | **String** | City (L) | [optional][default to &#39;Paris&#39;] |
| **state** | **String** | State/Province (ST) | [optional][default to &#39;Ile-de-France&#39;] |
| **email** | **String** |  | [optional] |
| **validity_days** | **Integer** | Validity duration in days | [optional][default to 365] |
| **key_size** | **Integer** | RSA key size in bits | [optional][default to 2048] |
| **key_passphrase** | **String** |  | [optional] |
| **generate_p12** | **Boolean** | Also generate a PKCS#12 (.p12) file | [optional][default to false] |
| **p12_passphrase** | **String** | Passphrase for PKCS#12 file | [optional][default to &#39;changeme&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GenerateCertificateRequest.new(
  cn: Test Signature Client XYZ,
  organization: Client XYZ SARL,
  country: FR,
  city: Paris,
  state: Ile-de-France,
  email: null,
  validity_days: 365,
  key_size: 2048,
  key_passphrase: null,
  generate_p12: false,
  p12_passphrase: changeme
)
```

