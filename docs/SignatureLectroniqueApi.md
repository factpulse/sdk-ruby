# FactPulse::SignatureLectroniqueApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**generer_certificat_test_api_v1_traitement_generer_certificat_test_post**](SignatureLectroniqueApi.md#generer_certificat_test_api_v1_traitement_generer_certificat_test_post) | **POST** /api/v1/traitement/generer-certificat-test | Générer un certificat X.509 auto-signé de test |
| [**signer_pdf_api_v1_traitement_signer_pdf_post**](SignatureLectroniqueApi.md#signer_pdf_api_v1_traitement_signer_pdf_post) | **POST** /api/v1/traitement/signer-pdf | Signer un PDF avec le certificat du client (PAdES-B-LT) |
| [**signer_pdf_async_api_v1_traitement_signer_pdf_async_post**](SignatureLectroniqueApi.md#signer_pdf_async_api_v1_traitement_signer_pdf_async_post) | **POST** /api/v1/traitement/signer-pdf-async | Signer un PDF de manière asynchrone (Celery) |
| [**valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post**](SignatureLectroniqueApi.md#valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post) | **POST** /api/v1/traitement/valider-signature-pdf | Valider les signatures électroniques d&#39;un PDF |


## generer_certificat_test_api_v1_traitement_generer_certificat_test_post

> <GenerateCertificateResponse> generer_certificat_test_api_v1_traitement_generer_certificat_test_post(generate_certificate_request)

Générer un certificat X.509 auto-signé de test

Génère un certificat X.509 auto-signé pour les tests de signature électronique PDF.      **⚠️ ATTENTION : Certificat de TEST uniquement !**      Ce certificat est :     - ✅ Adapté pour tests et développement     - ✅ Compatible signature PDF (PAdES)     - ✅ Conforme eIDAS niveau **SES** (Simple Electronic Signature)     - ❌ **JAMAIS utilisable en production**     - ❌ **Non reconnu** par les navigateurs et lecteurs PDF     - ❌ **Aucune valeur juridique**      ## Niveaux eIDAS      - **SES** (Simple) : Certificat auto-signé ← Généré par cet endpoint     - **AdES** (Advanced) : Certificat CA commerciale (Let's Encrypt, etc.)     - **QES** (Qualified) : Certificat qualifié PSCO (CertEurope, Universign, etc.)      ## Utilisation      Une fois généré, le certificat peut être :      1. **Enregistré dans Django** (recommandé) :        - Django Admin > Certificats de signature        - Upload `certificat_pem` et `cle_privee_pem`      2. **Utilisé directement** :        - Signer un PDF avec `/signer-pdf`        - Le certificat sera automatiquement utilisé      ## Exemple d'appel      ```bash     curl -X POST \"https://www.factpulse.fr/api/facturation/generer-certificat-test\" \\       -H \"Authorization: Bearer eyJ0eXAi...\" \\       -H \"Content-Type: application/json\" \\       -d '{         \"cn\": \"Test Client XYZ\",         \"organisation\": \"Client XYZ SARL\",         \"email\": \"contact@xyz.fr\",         \"duree_jours\": 365       }'     ```      ## Cas d'usage      - Tests de signature PDF en développement     - POC de signature électronique     - Formation et démos     - Tests d'intégration automatisés      ## Conformité technique      Certificat généré avec :     - Clé RSA 2048 ou 4096 bits     - Algorithme SHA-256     - Extensions Key Usage : `digitalSignature`, `contentCommitment` (non-repudiation)     - Extensions Extended Key Usage : `codeSigning`, `emailProtection`     - Validité : 1 jour à 10 ans (configurable)     - Format : PEM (certificat et clé)     - Optionnel : PKCS#12 (.p12)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::SignatureLectroniqueApi.new
generate_certificate_request = FactPulse::GenerateCertificateRequest.new # GenerateCertificateRequest | 

begin
  # Générer un certificat X.509 auto-signé de test
  result = api_instance.generer_certificat_test_api_v1_traitement_generer_certificat_test_post(generate_certificate_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->generer_certificat_test_api_v1_traitement_generer_certificat_test_post: #{e}"
end
```

#### Using the generer_certificat_test_api_v1_traitement_generer_certificat_test_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateCertificateResponse>, Integer, Hash)> generer_certificat_test_api_v1_traitement_generer_certificat_test_post_with_http_info(generate_certificate_request)

```ruby
begin
  # Générer un certificat X.509 auto-signé de test
  data, status_code, headers = api_instance.generer_certificat_test_api_v1_traitement_generer_certificat_test_post_with_http_info(generate_certificate_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateCertificateResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->generer_certificat_test_api_v1_traitement_generer_certificat_test_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **generate_certificate_request** | [**GenerateCertificateRequest**](GenerateCertificateRequest.md) |  |  |

### Return type

[**GenerateCertificateResponse**](GenerateCertificateResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## signer_pdf_api_v1_traitement_signer_pdf_post

> Object signer_pdf_api_v1_traitement_signer_pdf_post(fichier_pdf, opts)

Signer un PDF avec le certificat du client (PAdES-B-LT)

Signe un PDF uploadé avec le certificat électronique configuré pour le client (via client_uid du JWT).      **Standards supportés** : PAdES-B-B, PAdES-B-T (horodatage), PAdES-B-LT (archivage long terme).      **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO - hors scope).      **⚠️ Disclaimer légal** : Les signatures générées sont des cachets électroniques au sens     du règlement eIDAS. Le niveau de validité juridique dépend du certificat utilisé (SES/AdES/QES).     FactPulse ne fournit pas de certificats qualifiés QES - vous devez obtenir un certificat auprès     d'un PSCO (Prestataire de Services de Confiance qualifié) pour une validité juridique maximale.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::SignatureLectroniqueApi.new
fichier_pdf = File.new('/path/to/some/file') # File | Fichier PDF à signer (sera traité puis retourné signé en base64)
opts = {
  raison: 'raison_example', # String | 
  localisation: 'localisation_example', # String | 
  contact: 'contact_example', # String | 
  field_name: 'field_name_example', # String | Nom du champ de signature PDF
  use_pades_lt: true, # Boolean | Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL.
  use_timestamp: true # Boolean | Activer l'horodatage RFC 3161 avec FreeTSA (PAdES-B-T)
}

begin
  # Signer un PDF avec le certificat du client (PAdES-B-LT)
  result = api_instance.signer_pdf_api_v1_traitement_signer_pdf_post(fichier_pdf, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->signer_pdf_api_v1_traitement_signer_pdf_post: #{e}"
end
```

#### Using the signer_pdf_api_v1_traitement_signer_pdf_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> signer_pdf_api_v1_traitement_signer_pdf_post_with_http_info(fichier_pdf, opts)

```ruby
begin
  # Signer un PDF avec le certificat du client (PAdES-B-LT)
  data, status_code, headers = api_instance.signer_pdf_api_v1_traitement_signer_pdf_post_with_http_info(fichier_pdf, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->signer_pdf_api_v1_traitement_signer_pdf_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fichier_pdf** | **File** | Fichier PDF à signer (sera traité puis retourné signé en base64) |  |
| **raison** | **String** |  | [optional] |
| **localisation** | **String** |  | [optional] |
| **contact** | **String** |  | [optional] |
| **field_name** | **String** | Nom du champ de signature PDF | [optional][default to &#39;FactPulseSignature&#39;] |
| **use_pades_lt** | **Boolean** | Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL. | [optional][default to false] |
| **use_timestamp** | **Boolean** | Activer l&#39;horodatage RFC 3161 avec FreeTSA (PAdES-B-T) | [optional][default to true] |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## signer_pdf_async_api_v1_traitement_signer_pdf_async_post

> Object signer_pdf_async_api_v1_traitement_signer_pdf_async_post(fichier_pdf, opts)

Signer un PDF de manière asynchrone (Celery)

Signe un PDF uploadé de manière asynchrone via une tâche Celery.      **Différence avec /signer-pdf** :     - `/signer-pdf` : Signature synchrone (blocage jusqu'à la fin)     - `/signer-pdf-async` : Signature asynchrone (retourne immédiatement un task_id)      **Avantages de l'async** :     - Pas de timeout pour les gros fichiers     - Pas de blocage du worker FastAPI     - Possibilité de suivre la progression via le task_id     - Idéal pour les traitements par lot      **Standards supportés** : PAdES-B-B, PAdES-B-T (horodatage), PAdES-B-LT (archivage long terme).      **⚠️ Disclaimer légal** : Identique à /signer-pdf (voir documentation de cet endpoint).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::SignatureLectroniqueApi.new
fichier_pdf = File.new('/path/to/some/file') # File | Fichier PDF à signer (traité de manière asynchrone)
opts = {
  raison: 'raison_example', # String | 
  localisation: 'localisation_example', # String | 
  contact: 'contact_example', # String | 
  field_name: 'field_name_example', # String | Nom du champ de signature PDF
  use_pades_lt: true, # Boolean | Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL.
  use_timestamp: true # Boolean | Activer l'horodatage RFC 3161 avec FreeTSA (PAdES-B-T)
}

begin
  # Signer un PDF de manière asynchrone (Celery)
  result = api_instance.signer_pdf_async_api_v1_traitement_signer_pdf_async_post(fichier_pdf, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->signer_pdf_async_api_v1_traitement_signer_pdf_async_post: #{e}"
end
```

#### Using the signer_pdf_async_api_v1_traitement_signer_pdf_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> signer_pdf_async_api_v1_traitement_signer_pdf_async_post_with_http_info(fichier_pdf, opts)

```ruby
begin
  # Signer un PDF de manière asynchrone (Celery)
  data, status_code, headers = api_instance.signer_pdf_async_api_v1_traitement_signer_pdf_async_post_with_http_info(fichier_pdf, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->signer_pdf_async_api_v1_traitement_signer_pdf_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fichier_pdf** | **File** | Fichier PDF à signer (traité de manière asynchrone) |  |
| **raison** | **String** |  | [optional] |
| **localisation** | **String** |  | [optional] |
| **contact** | **String** |  | [optional] |
| **field_name** | **String** | Nom du champ de signature PDF | [optional][default to &#39;FactPulseSignature&#39;] |
| **use_pades_lt** | **Boolean** | Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL. | [optional][default to false] |
| **use_timestamp** | **Boolean** | Activer l&#39;horodatage RFC 3161 avec FreeTSA (PAdES-B-T) | [optional][default to true] |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post

> Object valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post(fichier_pdf)

Valider les signatures électroniques d'un PDF

Valide les signatures électroniques présentes dans un PDF uploadé.      **Vérifications effectuées** :     - Présence de signatures     - Intégrité du document (non modifié depuis signature)     - Validité des certificats     - Chaîne de confiance (si disponible)     - Présence d'horodatage (PAdES-B-T)     - Données de validation (PAdES-B-LT)      **Standards supportés** : PAdES-B-B, PAdES-B-T, PAdES-B-LT, ISO 32000-2.      **⚠️ Note** : Cette validation est technique (intégrité cryptographique). La validité juridique     dépend du niveau eIDAS du certificat (SES/AdES/QES) et du contexte d'utilisation.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::SignatureLectroniqueApi.new
fichier_pdf = File.new('/path/to/some/file') # File | Fichier PDF à valider (sera analysé pour détecter et valider les signatures)

begin
  # Valider les signatures électroniques d'un PDF
  result = api_instance.valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post(fichier_pdf)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post: #{e}"
end
```

#### Using the valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post_with_http_info(fichier_pdf)

```ruby
begin
  # Valider les signatures électroniques d'un PDF
  data, status_code, headers = api_instance.valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post_with_http_info(fichier_pdf)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling SignatureLectroniqueApi->valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fichier_pdf** | **File** | Fichier PDF à valider (sera analysé pour détecter et valider les signatures) |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

