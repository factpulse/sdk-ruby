# FactPulse::AFNORDirectoryServiceMtierApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_siren_metier_api_v1_afnor_directory_siren_siren_get**](AFNORDirectoryServiceMtierApi.md#get_siren_metier_api_v1_afnor_directory_siren_siren_get) | **GET** /api/v1/afnor/directory/siren/{siren} | Récupérer une entreprise par SIREN (multi-tenant) |
| [**get_siret_metier_api_v1_afnor_directory_siret_siret_get**](AFNORDirectoryServiceMtierApi.md#get_siret_metier_api_v1_afnor_directory_siret_siret_get) | **GET** /api/v1/afnor/directory/siret/{siret} | Récupérer un établissement par SIRET (multi-tenant) |
| [**search_siren_metier_api_v1_afnor_directory_siren_search_post**](AFNORDirectoryServiceMtierApi.md#search_siren_metier_api_v1_afnor_directory_siren_search_post) | **POST** /api/v1/afnor/directory/siren/search | Rechercher des entreprises (multi-tenant) |
| [**search_siret_metier_api_v1_afnor_directory_siret_search_post**](AFNORDirectoryServiceMtierApi.md#search_siret_metier_api_v1_afnor_directory_siret_search_post) | **POST** /api/v1/afnor/directory/siret/search | Rechercher des établissements (multi-tenant) |


## get_siren_metier_api_v1_afnor_directory_siren_siren_get

> Object get_siren_metier_api_v1_afnor_directory_siren_siren_get(siren, opts)

Récupérer une entreprise par SIREN (multi-tenant)

Récupère les informations d'une entreprise dans le Directory Service AFNOR. Les credentials PDP sont récupérés automatiquement via le client_uid du JWT, ou peuvent être fournis directement dans le body (zero-storage).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORDirectoryServiceMtierApi.new
siren = 'siren_example' # String | 
opts = {
  pdp_credentials: FactPulse::PDPCredentials.new({flow_service_url: 'https://api.pdp-example.fr/flow/v1', token_url: 'https://auth.pdp-example.fr/oauth/token', client_id: 'factpulse_prod_abc123', client_secret: 'secret_xyz789'}) # PDPCredentials | 
}

begin
  # Récupérer une entreprise par SIREN (multi-tenant)
  result = api_instance.get_siren_metier_api_v1_afnor_directory_siren_siren_get(siren, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->get_siren_metier_api_v1_afnor_directory_siren_siren_get: #{e}"
end
```

#### Using the get_siren_metier_api_v1_afnor_directory_siren_siren_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_siren_metier_api_v1_afnor_directory_siren_siren_get_with_http_info(siren, opts)

```ruby
begin
  # Récupérer une entreprise par SIREN (multi-tenant)
  data, status_code, headers = api_instance.get_siren_metier_api_v1_afnor_directory_siren_siren_get_with_http_info(siren, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->get_siren_metier_api_v1_afnor_directory_siren_siren_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** |  |  |
| **pdp_credentials** | [**PDPCredentials**](PDPCredentials.md) |  | [optional] |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_siret_metier_api_v1_afnor_directory_siret_siret_get

> Object get_siret_metier_api_v1_afnor_directory_siret_siret_get(siret, opts)

Récupérer un établissement par SIRET (multi-tenant)

Récupère les informations d'un établissement dans le Directory Service AFNOR. Les credentials PDP sont récupérés automatiquement via le client_uid du JWT, ou peuvent être fournis directement dans le body (zero-storage).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORDirectoryServiceMtierApi.new
siret = 'siret_example' # String | 
opts = {
  pdp_credentials: FactPulse::PDPCredentials.new({flow_service_url: 'https://api.pdp-example.fr/flow/v1', token_url: 'https://auth.pdp-example.fr/oauth/token', client_id: 'factpulse_prod_abc123', client_secret: 'secret_xyz789'}) # PDPCredentials | 
}

begin
  # Récupérer un établissement par SIRET (multi-tenant)
  result = api_instance.get_siret_metier_api_v1_afnor_directory_siret_siret_get(siret, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->get_siret_metier_api_v1_afnor_directory_siret_siret_get: #{e}"
end
```

#### Using the get_siret_metier_api_v1_afnor_directory_siret_siret_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_siret_metier_api_v1_afnor_directory_siret_siret_get_with_http_info(siret, opts)

```ruby
begin
  # Récupérer un établissement par SIRET (multi-tenant)
  data, status_code, headers = api_instance.get_siret_metier_api_v1_afnor_directory_siret_siret_get_with_http_info(siret, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->get_siret_metier_api_v1_afnor_directory_siret_siret_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siret** | **String** |  |  |
| **pdp_credentials** | [**PDPCredentials**](PDPCredentials.md) |  | [optional] |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## search_siren_metier_api_v1_afnor_directory_siren_search_post

> Object search_siren_metier_api_v1_afnor_directory_siren_search_post(body_search_siren_metier_api_v1_afnor_directory_siren_search_post)

Rechercher des entreprises (multi-tenant)

Recherche multi-critères d'entreprises dans le Directory Service AFNOR. Les credentials PDP sont récupérés automatiquement via le client_uid du JWT, ou peuvent être fournis directement dans le body (zero-storage).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORDirectoryServiceMtierApi.new
body_search_siren_metier_api_v1_afnor_directory_siren_search_post = FactPulse::BodySearchSirenMetierApiV1AfnorDirectorySirenSearchPost.new({criteria: { key: 3.56}}) # BodySearchSirenMetierApiV1AfnorDirectorySirenSearchPost | 

begin
  # Rechercher des entreprises (multi-tenant)
  result = api_instance.search_siren_metier_api_v1_afnor_directory_siren_search_post(body_search_siren_metier_api_v1_afnor_directory_siren_search_post)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->search_siren_metier_api_v1_afnor_directory_siren_search_post: #{e}"
end
```

#### Using the search_siren_metier_api_v1_afnor_directory_siren_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_siren_metier_api_v1_afnor_directory_siren_search_post_with_http_info(body_search_siren_metier_api_v1_afnor_directory_siren_search_post)

```ruby
begin
  # Rechercher des entreprises (multi-tenant)
  data, status_code, headers = api_instance.search_siren_metier_api_v1_afnor_directory_siren_search_post_with_http_info(body_search_siren_metier_api_v1_afnor_directory_siren_search_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->search_siren_metier_api_v1_afnor_directory_siren_search_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body_search_siren_metier_api_v1_afnor_directory_siren_search_post** | [**BodySearchSirenMetierApiV1AfnorDirectorySirenSearchPost**](BodySearchSirenMetierApiV1AfnorDirectorySirenSearchPost.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## search_siret_metier_api_v1_afnor_directory_siret_search_post

> Object search_siret_metier_api_v1_afnor_directory_siret_search_post(body_search_siret_metier_api_v1_afnor_directory_siret_search_post)

Rechercher des établissements (multi-tenant)

Recherche multi-critères d'établissements dans le Directory Service AFNOR. Les credentials PDP sont récupérés automatiquement via le client_uid du JWT, ou peuvent être fournis directement dans le body (zero-storage).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORDirectoryServiceMtierApi.new
body_search_siret_metier_api_v1_afnor_directory_siret_search_post = FactPulse::BodySearchSiretMetierApiV1AfnorDirectorySiretSearchPost.new({criteria: { key: 3.56}}) # BodySearchSiretMetierApiV1AfnorDirectorySiretSearchPost | 

begin
  # Rechercher des établissements (multi-tenant)
  result = api_instance.search_siret_metier_api_v1_afnor_directory_siret_search_post(body_search_siret_metier_api_v1_afnor_directory_siret_search_post)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->search_siret_metier_api_v1_afnor_directory_siret_search_post: #{e}"
end
```

#### Using the search_siret_metier_api_v1_afnor_directory_siret_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_siret_metier_api_v1_afnor_directory_siret_search_post_with_http_info(body_search_siret_metier_api_v1_afnor_directory_siret_search_post)

```ruby
begin
  # Rechercher des établissements (multi-tenant)
  data, status_code, headers = api_instance.search_siret_metier_api_v1_afnor_directory_siret_search_post_with_http_info(body_search_siret_metier_api_v1_afnor_directory_siret_search_post)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORDirectoryServiceMtierApi->search_siret_metier_api_v1_afnor_directory_siret_search_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **body_search_siret_metier_api_v1_afnor_directory_siret_search_post** | [**BodySearchSiretMetierApiV1AfnorDirectorySiretSearchPost**](BodySearchSiretMetierApiV1AfnorDirectorySiretSearchPost.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

