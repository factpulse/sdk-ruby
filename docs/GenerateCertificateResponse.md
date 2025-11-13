# FactPulse::GenerateCertificateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Statut de l&#39;opération | [optional][default to &#39;success&#39;] |
| **certificat_pem** | **String** | Certificat X.509 au format PEM |  |
| **cle_privee_pem** | **String** | Clé privée RSA au format PEM |  |
| **pkcs12_base64** | **String** |  | [optional] |
| **info** | [**CertificateInfoResponse**](CertificateInfoResponse.md) | Informations sur le certificat généré |  |
| **avertissement** | **String** | Avertissement sur l&#39;utilisation du certificat | [optional][default to &#39;⚠️ Ce certificat est AUTO-SIGNÉ et destiné uniquement aux TESTS. Ne PAS utiliser en production. Niveau eIDAS : SES (Simple Electronic Signature)&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GenerateCertificateResponse.new(
  status: success,
  certificat_pem: -----BEGIN CERTIFICATE-----
MIID...
-----END CERTIFICATE-----,
  cle_privee_pem: -----BEGIN PRIVATE KEY-----
MIIE...
-----END PRIVATE KEY-----,
  pkcs12_base64: null,
  info: null,
  avertissement: null
)
```

