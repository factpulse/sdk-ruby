# FactPulse::AFNORPDPPADirectoryServiceApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get**](AFNORPDPPADirectoryServiceApi.md#directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get) | **GET** /api/v1/afnor/directory/v1/healthcheck | Healthcheck Directory Service |
| [**get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get**](AFNORPDPPADirectoryServiceApi.md#get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get) | **GET** /api/v1/afnor/directory/v1/companies/{siren} | Récupérer une entreprise |
| [**search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post**](AFNORPDPPADirectoryServiceApi.md#search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post) | **POST** /api/v1/afnor/directory/v1/companies/search | Rechercher des entreprises |


## directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get

> Object directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get

Healthcheck Directory Service

Vérifier la disponibilité du Directory Service

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # Healthcheck Directory Service
  result = api_instance.directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get: #{e}"
end
```

#### Using the directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get_with_http_info

```ruby
begin
  # Healthcheck Directory Service
  data, status_code, headers = api_instance.directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get

> Object get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get(siren)

Récupérer une entreprise

Récupérer les informations d'une entreprise par son SIREN

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
siren = 'siren_example' # String | 

begin
  # Récupérer une entreprise
  result = api_instance.get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get(siren)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get: #{e}"
end
```

#### Using the get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get_with_http_info(siren)

```ruby
begin
  # Récupérer une entreprise
  data, status_code, headers = api_instance.get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get_with_http_info(siren)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_company_proxy_api_v1_afnor_directory_v1_companies_siren_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** |  |  |

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post

> Object search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post

Rechercher des entreprises

Rechercher des entreprises dans l'annuaire AFNOR

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # Rechercher des entreprises
  result = api_instance.search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post: #{e}"
end
```

#### Using the search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post_with_http_info

```ruby
begin
  # Rechercher des entreprises
  data, status_code, headers = api_instance.search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_companies_proxy_api_v1_afnor_directory_v1_companies_search_post_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

