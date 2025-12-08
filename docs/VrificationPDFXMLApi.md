# FactPulse::VrificationPDFXMLApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get**](VrificationPDFXMLApi.md#obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get) | **GET** /api/v1/verification/verifier-async/{id_tache}/statut | Obtenir le statut d&#39;une vérification asynchrone |
| [**obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0**](VrificationPDFXMLApi.md#obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0) | **GET** /api/v1/verification/verifier-async/{id_tache}/statut | Obtenir le statut d&#39;une vérification asynchrone |
| [**verifier_pdf_async_api_v1_verification_verifier_async_post**](VrificationPDFXMLApi.md#verifier_pdf_async_api_v1_verification_verifier_async_post) | **POST** /api/v1/verification/verifier-async | Vérifier la conformité PDF/XML Factur-X (asynchrone) |
| [**verifier_pdf_async_api_v1_verification_verifier_async_post_0**](VrificationPDFXMLApi.md#verifier_pdf_async_api_v1_verification_verifier_async_post_0) | **POST** /api/v1/verification/verifier-async | Vérifier la conformité PDF/XML Factur-X (asynchrone) |
| [**verifier_pdf_sync_api_v1_verification_verifier_post**](VrificationPDFXMLApi.md#verifier_pdf_sync_api_v1_verification_verifier_post) | **POST** /api/v1/verification/verifier | Vérifier la conformité PDF/XML Factur-X (synchrone) |
| [**verifier_pdf_sync_api_v1_verification_verifier_post_0**](VrificationPDFXMLApi.md#verifier_pdf_sync_api_v1_verification_verifier_post_0) | **POST** /api/v1/verification/verifier | Vérifier la conformité PDF/XML Factur-X (synchrone) |


## obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get

> <StatutTache> obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get(id_tache)

Obtenir le statut d'une vérification asynchrone

Récupère le statut et le résultat d'une tâche de vérification asynchrone.  **Statuts possibles:** - `PENDING`: Tâche en attente dans la file - `STARTED`: Tâche en cours d'exécution - `SUCCESS`: Tâche terminée avec succès (voir `resultat`) - `FAILURE`: Erreur système (exception non gérée)  **Note:** Le champ `resultat.statut` peut être \"SUCCES\" ou \"ERREUR\" indépendamment du statut Celery (qui sera toujours SUCCESS si la tâche s'est exécutée).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::VrificationPDFXMLApi.new
id_tache = 'id_tache_example' # String | 

begin
  # Obtenir le statut d'une vérification asynchrone
  result = api_instance.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get(id_tache)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get: #{e}"
end
```

#### Using the obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StatutTache>, Integer, Hash)> obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_with_http_info(id_tache)

```ruby
begin
  # Obtenir le statut d'une vérification asynchrone
  data, status_code, headers = api_instance.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_with_http_info(id_tache)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StatutTache>
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_tache** | **String** |  |  |

### Return type

[**StatutTache**](StatutTache.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0

> <StatutTache> obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0(id_tache)

Obtenir le statut d'une vérification asynchrone

Récupère le statut et le résultat d'une tâche de vérification asynchrone.  **Statuts possibles:** - `PENDING`: Tâche en attente dans la file - `STARTED`: Tâche en cours d'exécution - `SUCCESS`: Tâche terminée avec succès (voir `resultat`) - `FAILURE`: Erreur système (exception non gérée)  **Note:** Le champ `resultat.statut` peut être \"SUCCES\" ou \"ERREUR\" indépendamment du statut Celery (qui sera toujours SUCCESS si la tâche s'est exécutée).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::VrificationPDFXMLApi.new
id_tache = 'id_tache_example' # String | 

begin
  # Obtenir le statut d'une vérification asynchrone
  result = api_instance.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0(id_tache)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0: #{e}"
end
```

#### Using the obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StatutTache>, Integer, Hash)> obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0_with_http_info(id_tache)

```ruby
begin
  # Obtenir le statut d'une vérification asynchrone
  data, status_code, headers = api_instance.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0_with_http_info(id_tache)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StatutTache>
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_tache** | **String** |  |  |

### Return type

[**StatutTache**](StatutTache.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## verifier_pdf_async_api_v1_verification_verifier_async_post

> <ReponseTache> verifier_pdf_async_api_v1_verification_verifier_async_post(fichier_pdf, opts)

Vérifier la conformité PDF/XML Factur-X (asynchrone)

Vérifie la conformité PDF/XML Factur-X de manière asynchrone.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X retourneront une erreur `NOT_FACTURX` dans le résultat.  Cette version utilise une tâche Celery et peut faire appel au service OCR si le PDF est une image ou si `forcer_ocr=true`.  **Retourne immédiatement** un ID de tâche. Utilisez `/verifier-async/{id_tache}/statut` pour récupérer le résultat.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN  **Avantages par rapport à la version synchrone:** - Support OCR pour les PDF images (via service DocTR) - Timeout plus long pour les gros documents - Ne bloque pas le serveur

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::VrificationPDFXMLApi.new
fichier_pdf = File.new('/path/to/some/file') # File | Fichier PDF Factur-X à vérifier
opts = {
  forcer_ocr: true # Boolean | Forcer l'utilisation de l'OCR même si le PDF contient du texte natif
}

begin
  # Vérifier la conformité PDF/XML Factur-X (asynchrone)
  result = api_instance.verifier_pdf_async_api_v1_verification_verifier_async_post(fichier_pdf, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_async_api_v1_verification_verifier_async_post: #{e}"
end
```

#### Using the verifier_pdf_async_api_v1_verification_verifier_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReponseTache>, Integer, Hash)> verifier_pdf_async_api_v1_verification_verifier_async_post_with_http_info(fichier_pdf, opts)

```ruby
begin
  # Vérifier la conformité PDF/XML Factur-X (asynchrone)
  data, status_code, headers = api_instance.verifier_pdf_async_api_v1_verification_verifier_async_post_with_http_info(fichier_pdf, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReponseTache>
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_async_api_v1_verification_verifier_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fichier_pdf** | **File** | Fichier PDF Factur-X à vérifier |  |
| **forcer_ocr** | **Boolean** | Forcer l&#39;utilisation de l&#39;OCR même si le PDF contient du texte natif | [optional][default to false] |

### Return type

[**ReponseTache**](ReponseTache.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## verifier_pdf_async_api_v1_verification_verifier_async_post_0

> <ReponseTache> verifier_pdf_async_api_v1_verification_verifier_async_post_0(fichier_pdf, opts)

Vérifier la conformité PDF/XML Factur-X (asynchrone)

Vérifie la conformité PDF/XML Factur-X de manière asynchrone.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X retourneront une erreur `NOT_FACTURX` dans le résultat.  Cette version utilise une tâche Celery et peut faire appel au service OCR si le PDF est une image ou si `forcer_ocr=true`.  **Retourne immédiatement** un ID de tâche. Utilisez `/verifier-async/{id_tache}/statut` pour récupérer le résultat.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN  **Avantages par rapport à la version synchrone:** - Support OCR pour les PDF images (via service DocTR) - Timeout plus long pour les gros documents - Ne bloque pas le serveur

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::VrificationPDFXMLApi.new
fichier_pdf = File.new('/path/to/some/file') # File | Fichier PDF Factur-X à vérifier
opts = {
  forcer_ocr: true # Boolean | Forcer l'utilisation de l'OCR même si le PDF contient du texte natif
}

begin
  # Vérifier la conformité PDF/XML Factur-X (asynchrone)
  result = api_instance.verifier_pdf_async_api_v1_verification_verifier_async_post_0(fichier_pdf, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_async_api_v1_verification_verifier_async_post_0: #{e}"
end
```

#### Using the verifier_pdf_async_api_v1_verification_verifier_async_post_0_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReponseTache>, Integer, Hash)> verifier_pdf_async_api_v1_verification_verifier_async_post_0_with_http_info(fichier_pdf, opts)

```ruby
begin
  # Vérifier la conformité PDF/XML Factur-X (asynchrone)
  data, status_code, headers = api_instance.verifier_pdf_async_api_v1_verification_verifier_async_post_0_with_http_info(fichier_pdf, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReponseTache>
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_async_api_v1_verification_verifier_async_post_0_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fichier_pdf** | **File** | Fichier PDF Factur-X à vérifier |  |
| **forcer_ocr** | **Boolean** | Forcer l&#39;utilisation de l&#39;OCR même si le PDF contient du texte natif | [optional][default to false] |

### Return type

[**ReponseTache**](ReponseTache.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## verifier_pdf_sync_api_v1_verification_verifier_post

> <ReponseVerificationSucces> verifier_pdf_sync_api_v1_verification_verifier_post(fichier_pdf)

Vérifier la conformité PDF/XML Factur-X (synchrone)

Vérifie la conformité entre le PDF et son XML Factur-X embarqué.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X seront rejetés avec une erreur 400.  Cette version synchrone utilise uniquement l'extraction PDF native (pdfplumber). Pour les PDF images nécessitant de l'OCR, utilisez l'endpoint `/verifier-async`.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::VrificationPDFXMLApi.new
fichier_pdf = File.new('/path/to/some/file') # File | Fichier PDF Factur-X à vérifier

begin
  # Vérifier la conformité PDF/XML Factur-X (synchrone)
  result = api_instance.verifier_pdf_sync_api_v1_verification_verifier_post(fichier_pdf)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_sync_api_v1_verification_verifier_post: #{e}"
end
```

#### Using the verifier_pdf_sync_api_v1_verification_verifier_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReponseVerificationSucces>, Integer, Hash)> verifier_pdf_sync_api_v1_verification_verifier_post_with_http_info(fichier_pdf)

```ruby
begin
  # Vérifier la conformité PDF/XML Factur-X (synchrone)
  data, status_code, headers = api_instance.verifier_pdf_sync_api_v1_verification_verifier_post_with_http_info(fichier_pdf)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReponseVerificationSucces>
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_sync_api_v1_verification_verifier_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fichier_pdf** | **File** | Fichier PDF Factur-X à vérifier |  |

### Return type

[**ReponseVerificationSucces**](ReponseVerificationSucces.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## verifier_pdf_sync_api_v1_verification_verifier_post_0

> <ReponseVerificationSucces> verifier_pdf_sync_api_v1_verification_verifier_post_0(fichier_pdf)

Vérifier la conformité PDF/XML Factur-X (synchrone)

Vérifie la conformité entre le PDF et son XML Factur-X embarqué.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X seront rejetés avec une erreur 400.  Cette version synchrone utilise uniquement l'extraction PDF native (pdfplumber). Pour les PDF images nécessitant de l'OCR, utilisez l'endpoint `/verifier-async`.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::VrificationPDFXMLApi.new
fichier_pdf = File.new('/path/to/some/file') # File | Fichier PDF Factur-X à vérifier

begin
  # Vérifier la conformité PDF/XML Factur-X (synchrone)
  result = api_instance.verifier_pdf_sync_api_v1_verification_verifier_post_0(fichier_pdf)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_sync_api_v1_verification_verifier_post_0: #{e}"
end
```

#### Using the verifier_pdf_sync_api_v1_verification_verifier_post_0_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReponseVerificationSucces>, Integer, Hash)> verifier_pdf_sync_api_v1_verification_verifier_post_0_with_http_info(fichier_pdf)

```ruby
begin
  # Vérifier la conformité PDF/XML Factur-X (synchrone)
  data, status_code, headers = api_instance.verifier_pdf_sync_api_v1_verification_verifier_post_0_with_http_info(fichier_pdf)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReponseVerificationSucces>
rescue FactPulse::ApiError => e
  puts "Error when calling VrificationPDFXMLApi->verifier_pdf_sync_api_v1_verification_verifier_post_0_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **fichier_pdf** | **File** | Fichier PDF Factur-X à vérifier |  |

### Return type

[**ReponseVerificationSucces**](ReponseVerificationSucces.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

