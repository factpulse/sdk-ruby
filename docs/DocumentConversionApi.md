# FactPulse::DocumentConversionApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**convert_document_async_api_v1_convert_async_post**](DocumentConversionApi.md#convert_document_async_api_v1_convert_async_post) | **POST** /api/v1/convert/async | Convertir un document en Factur-X (mode asynchrone) |
| [**download_file_api_v1_convert_conversion_id_download_filename_get**](DocumentConversionApi.md#download_file_api_v1_convert_conversion_id_download_filename_get) | **GET** /api/v1/convert/{conversion_id}/download/{filename} | Télécharger un fichier généré |
| [**get_conversion_status_api_v1_convert_conversion_id_status_get**](DocumentConversionApi.md#get_conversion_status_api_v1_convert_conversion_id_status_get) | **GET** /api/v1/convert/{conversion_id}/status | Vérifier le statut d&#39;une conversion |
| [**resume_conversion_api_v1_convert_conversion_id_resume_post**](DocumentConversionApi.md#resume_conversion_api_v1_convert_conversion_id_resume_post) | **POST** /api/v1/convert/{conversion_id}/resume | Reprendre une conversion avec corrections |


## convert_document_async_api_v1_convert_async_post

> Object convert_document_async_api_v1_convert_async_post(file, opts)

Convertir un document en Factur-X (mode asynchrone)

Lance une conversion asynchrone via Celery.  ## Workflow  1. **Upload** : Le document est envoyé en multipart/form-data 2. **Task Celery** : La tâche est mise en file d'attente 3. **Callback** : Notification par webhook à la fin  ## Réponses possibles  - **202** : Tâche acceptée, en cours de traitement - **400** : Fichier invalide

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::DocumentConversionApi.new
file = File.new('/path/to/some/file') # File | Document à convertir (PDF, DOCX, XLSX, JPG, PNG)
opts = {
  output: 'output_example', # String | Format de sortie: pdf, xml, both
  callback_url: 'callback_url_example', # String | 
  webhook_mode: 'webhook_mode_example' # String | Mode de livraison du contenu: 'inline' (base64 dans webhook) ou 'download_url' (URL temporaire 1h)
}

begin
  # Convertir un document en Factur-X (mode asynchrone)
  result = api_instance.convert_document_async_api_v1_convert_async_post(file, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->convert_document_async_api_v1_convert_async_post: #{e}"
end
```

#### Using the convert_document_async_api_v1_convert_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> convert_document_async_api_v1_convert_async_post_with_http_info(file, opts)

```ruby
begin
  # Convertir un document en Factur-X (mode asynchrone)
  data, status_code, headers = api_instance.convert_document_async_api_v1_convert_async_post_with_http_info(file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->convert_document_async_api_v1_convert_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **file** | **File** | Document à convertir (PDF, DOCX, XLSX, JPG, PNG) |  |
| **output** | **String** | Format de sortie: pdf, xml, both | [optional][default to &#39;pdf&#39;] |
| **callback_url** | **String** |  | [optional] |
| **webhook_mode** | **String** | Mode de livraison du contenu: &#39;inline&#39; (base64 dans webhook) ou &#39;download_url&#39; (URL temporaire 1h) | [optional][default to &#39;inline&#39;] |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## download_file_api_v1_convert_conversion_id_download_filename_get

> Object download_file_api_v1_convert_conversion_id_download_filename_get(conversion_id, filename)

Télécharger un fichier généré

Télécharge le fichier Factur-X PDF ou XML généré.  ## Fichiers disponibles  - `facturx.pdf` : PDF/A-3 avec XML embarqué - `facturx.xml` : XML CII seul (Cross Industry Invoice)  Les fichiers sont disponibles pendant 24 heures après génération.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::DocumentConversionApi.new
conversion_id = 'conversion_id_example' # String | Conversion ID returned by POST /convert (UUID format)
filename = 'filename_example' # String | File to download: 'facturx.pdf' or 'facturx.xml'

begin
  # Télécharger un fichier généré
  result = api_instance.download_file_api_v1_convert_conversion_id_download_filename_get(conversion_id, filename)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->download_file_api_v1_convert_conversion_id_download_filename_get: #{e}"
end
```

#### Using the download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info(conversion_id, filename)

```ruby
begin
  # Télécharger un fichier généré
  data, status_code, headers = api_instance.download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info(conversion_id, filename)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->download_file_api_v1_convert_conversion_id_download_filename_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversion_id** | **String** | Conversion ID returned by POST /convert (UUID format) |  |
| **filename** | **String** | File to download: &#39;facturx.pdf&#39; or &#39;facturx.xml&#39; |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_conversion_status_api_v1_convert_conversion_id_status_get

> Hash&lt;String, Object&gt; get_conversion_status_api_v1_convert_conversion_id_status_get(conversion_id)

Vérifier le statut d'une conversion

Retourne le statut actuel d'une conversion asynchrone.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::DocumentConversionApi.new
conversion_id = 'conversion_id_example' # String | Conversion ID returned by POST /convert (UUID format)

begin
  # Vérifier le statut d'une conversion
  result = api_instance.get_conversion_status_api_v1_convert_conversion_id_status_get(conversion_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->get_conversion_status_api_v1_convert_conversion_id_status_get: #{e}"
end
```

#### Using the get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info(conversion_id)

```ruby
begin
  # Vérifier le statut d'une conversion
  data, status_code, headers = api_instance.get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info(conversion_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->get_conversion_status_api_v1_convert_conversion_id_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversion_id** | **String** | Conversion ID returned by POST /convert (UUID format) |  |

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## resume_conversion_api_v1_convert_conversion_id_resume_post

> <ConvertSuccessResponse> resume_conversion_api_v1_convert_conversion_id_resume_post(conversion_id, convert_resume_request)

Reprendre une conversion avec corrections

Reprend une conversion après complétion des données manquantes ou correction des erreurs.  L'extraction OCR est conservée, les données sont mises à jour avec les corrections, puis une nouvelle validation Schematron est effectuée.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::DocumentConversionApi.new
conversion_id = 'conversion_id_example' # String | Conversion ID returned by POST /convert (UUID format)
convert_resume_request = FactPulse::ConvertResumeRequest.new # ConvertResumeRequest | 

begin
  # Reprendre une conversion avec corrections
  result = api_instance.resume_conversion_api_v1_convert_conversion_id_resume_post(conversion_id, convert_resume_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->resume_conversion_api_v1_convert_conversion_id_resume_post: #{e}"
end
```

#### Using the resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConvertSuccessResponse>, Integer, Hash)> resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info(conversion_id, convert_resume_request)

```ruby
begin
  # Reprendre une conversion avec corrections
  data, status_code, headers = api_instance.resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info(conversion_id, convert_resume_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConvertSuccessResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling DocumentConversionApi->resume_conversion_api_v1_convert_conversion_id_resume_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **conversion_id** | **String** | Conversion ID returned by POST /convert (UUID format) |  |
| **convert_resume_request** | [**ConvertResumeRequest**](ConvertResumeRequest.md) |  |  |

### Return type

[**ConvertSuccessResponse**](ConvertSuccessResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

