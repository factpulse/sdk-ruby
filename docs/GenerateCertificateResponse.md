# OpenapiClient::GenerateCertificateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Operation status | [optional][default to &#39;success&#39;] |
| **certificate_pem** | **String** | X.509 certificate in PEM format |  |
| **private_key_pem** | **String** | RSA private key in PEM format |  |
| **pkcs12_base64** | **String** |  | [optional] |
| **info** | [**CertificateInfoResponse**](CertificateInfoResponse.md) | Generated certificate information |  |
| **warning** | **String** | Warning about certificate usage | [optional][default to &#39;WARNING: This certificate is SELF-SIGNED and intended for TESTING only. DO NOT use in production. eIDAS level: SES (Simple Electronic Signature)&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenerateCertificateResponse.new(
  status: success,
  certificate_pem: -----BEGIN CERTIFICATE-----
MIID...
-----END CERTIFICATE-----,
  private_key_pem: -----BEGIN PRIVATE KEY-----
MIIE...
-----END PRIVATE KEY-----,
  pkcs12_base64: null,
  info: null,
  warning: null
)
```

