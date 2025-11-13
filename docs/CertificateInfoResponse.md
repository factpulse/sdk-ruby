# FactPulse::CertificateInfoResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cn** | **String** | Common Name |  |
| **organisation** | **String** | Organisation |  |
| **pays** | **String** | Code pays |  |
| **ville** | **String** | Ville |  |
| **province** | **String** | Province |  |
| **email** | **String** |  | [optional] |
| **sujet** | **String** | Sujet complet (RFC4514) |  |
| **emetteur** | **String** | Émetteur (auto-signé &#x3D; même que sujet) |  |
| **numero_serie** | **Integer** | Numéro de série du certificat |  |
| **valide_du** | **String** | Date de début de validité (ISO 8601) |  |
| **valide_au** | **String** | Date de fin de validité (ISO 8601) |  |
| **algorithme** | **String** | Algorithme de signature |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::CertificateInfoResponse.new(
  cn: Test Signature Client XYZ,
  organisation: Client XYZ SARL,
  pays: FR,
  ville: Lyon,
  province: Rhône-Alpes,
  email: null,
  sujet: CN&#x3D;Test Signature Client XYZ,O&#x3D;Client XYZ SARL,L&#x3D;Lyon,ST&#x3D;Rhône-Alpes,C&#x3D;FR,
  emetteur: CN&#x3D;Test Signature Client XYZ,O&#x3D;Client XYZ SARL,L&#x3D;Lyon,ST&#x3D;Rhône-Alpes,C&#x3D;FR,
  numero_serie: 123456789,
  valide_du: 2025-01-07T12:00:00+00:00,
  valide_au: 2026-01-07T12:00:00+00:00,
  algorithme: sha256WithRSAEncryption
)
```

