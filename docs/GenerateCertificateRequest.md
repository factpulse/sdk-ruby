# FactPulse::GenerateCertificateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cn** | **String** | Common Name (CN) - Nom du certificat | [optional][default to &#39;Test Signature FactPulse&#39;] |
| **organisation** | **String** | Organisation (O) | [optional][default to &#39;FactPulse Test&#39;] |
| **pays** | **String** | Code pays ISO 2 lettres (C) | [optional][default to &#39;FR&#39;] |
| **ville** | **String** | Ville (L) | [optional][default to &#39;Paris&#39;] |
| **province** | **String** | Province/État (ST) | [optional][default to &#39;Ile-de-France&#39;] |
| **email** | **String** |  | [optional] |
| **duree_jours** | **Integer** | Durée de validité en jours | [optional][default to 365] |
| **taille_cle** | **Integer** | Taille de la clé RSA en bits | [optional][default to 2048] |
| **passphrase_cle** | **String** |  | [optional] |
| **generer_p12** | **Boolean** | Générer aussi un fichier PKCS#12 (.p12) | [optional][default to false] |
| **passphrase_p12** | **String** | Passphrase pour le fichier PKCS#12 | [optional][default to &#39;changeme&#39;] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GenerateCertificateRequest.new(
  cn: Test Signature Client XYZ,
  organisation: Client XYZ SARL,
  pays: FR,
  ville: Paris,
  province: Ile-de-France,
  email: null,
  duree_jours: 365,
  taille_cle: 2048,
  passphrase_cle: null,
  generer_p12: false,
  passphrase_p12: changeme
)
```

