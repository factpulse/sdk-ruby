# OpenapiClient::CertificateInfoResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cn** | **String** | Common Name |  |
| **organization** | **String** | Organization |  |
| **country** | **String** | Country code |  |
| **city** | **String** | City |  |
| **state** | **String** | State/Province |  |
| **email** | **String** |  | [optional] |
| **subject** | **String** | Full subject (RFC4514) |  |
| **issuer** | **String** | Issuer (self-signed &#x3D; same as subject) |  |
| **serial_number** | **Integer** | Certificate serial number |  |
| **valid_from** | **String** | Validity start date (ISO 8601) |  |
| **valid_to** | **String** | Validity end date (ISO 8601) |  |
| **algorithm** | **String** | Signature algorithm |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CertificateInfoResponse.new(
  cn: Test Signature Client XYZ,
  organization: Client XYZ SARL,
  country: FR,
  city: Lyon,
  state: Rhone-Alpes,
  email: null,
  subject: CN&#x3D;Test Signature Client XYZ,O&#x3D;Client XYZ SARL,L&#x3D;Lyon,ST&#x3D;Rhone-Alpes,C&#x3D;FR,
  issuer: CN&#x3D;Test Signature Client XYZ,O&#x3D;Client XYZ SARL,L&#x3D;Lyon,ST&#x3D;Rhone-Alpes,C&#x3D;FR,
  serial_number: 123456789,
  valid_from: 2025-01-07T12:00:00+00:00,
  valid_to: 2026-01-07T12:00:00+00:00,
  algorithm: sha256WithRSAEncryption
)
```

