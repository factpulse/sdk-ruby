# FactPulse::ParametresSignature

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key_pem** | **String** |  | [optional] |
| **cert_pem** | **String** |  | [optional] |
| **key_passphrase** | **String** |  | [optional] |
| **raison** | **String** |  | [optional] |
| **localisation** | **String** |  | [optional] |
| **contact** | **String** |  | [optional] |
| **field_name** | **String** | Nom du champ de signature PDF | [optional][default to &#39;FactPulseSignature&#39;] |
| **use_pades_lt** | **Boolean** | Activer PAdES-B-LT (archivage long terme). NÉCESSITE certificat avec accès OCSP/CRL | [optional][default to false] |
| **use_timestamp** | **Boolean** | Activer l&#39;horodatage RFC 3161 avec FreeTSA (PAdES-B-T) | [optional][default to true] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ParametresSignature.new(
  key_pem: null,
  cert_pem: null,
  key_passphrase: null,
  raison: null,
  localisation: null,
  contact: null,
  field_name: null,
  use_pades_lt: null,
  use_timestamp: null
)
```

