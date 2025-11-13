# FactPulse::AFNORPDPPAFlowServiceApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get**](AFNORPDPPAFlowServiceApi.md#download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get) | **GET** /api/v1/afnor/flow/v1/flows/{flowId} | Télécharger un flux |
| [**flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get**](AFNORPDPPAFlowServiceApi.md#flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get) | **GET** /api/v1/afnor/flow/v1/healthcheck | Healthcheck Flow Service |
| [**search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post**](AFNORPDPPAFlowServiceApi.md#search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post) | **POST** /api/v1/afnor/flow/v1/flows/search | Rechercher des flux |
| [**submit_flow_proxy_api_v1_afnor_flow_v1_flows_post**](AFNORPDPPAFlowServiceApi.md#submit_flow_proxy_api_v1_afnor_flow_v1_flows_post) | **POST** /api/v1/afnor/flow/v1/flows | Soumettre un flux de facturation |


## download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get

> Object download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get(flow_id)

Télécharger un flux

Télécharger le fichier PDF/A-3 d'un flux de facturation (utilise le client_uid du JWT)

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPAFlowServiceApi.new
flow_id = 'flow_id_example' # String | 

begin
  # Télécharger un flux
  result = api_instance.download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get(flow_id)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get: #{e}"
end
```

#### Using the download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info(flow_id)

```ruby
begin
  # Télécharger un flux
  data, status_code, headers = api_instance.download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info(flow_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** |  |  |

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/pdf


## flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get

> Object flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get

Healthcheck Flow Service

Vérifier la disponibilité du Flow Service

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPAFlowServiceApi.new

begin
  # Healthcheck Flow Service
  result = api_instance.flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get: #{e}"
end
```

#### Using the flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get_with_http_info

```ruby
begin
  # Healthcheck Flow Service
  data, status_code, headers = api_instance.flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get_with_http_info: #{e}"
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


## search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post

> Object search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post

Rechercher des flux

Rechercher des flux de facturation selon des critères (utilise le client_uid du JWT)

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPAFlowServiceApi.new

begin
  # Rechercher des flux
  result = api_instance.search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post: #{e}"
end
```

#### Using the search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info

```ruby
begin
  # Rechercher des flux
  data, status_code, headers = api_instance.search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info: #{e}"
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


## submit_flow_proxy_api_v1_afnor_flow_v1_flows_post

> Object submit_flow_proxy_api_v1_afnor_flow_v1_flows_post

Soumettre un flux de facturation

Soumet une facture électronique à une Plateforme de Dématérialisation Partenaire (PDP) conformément à la norme AFNOR XP Z12-013

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPAFlowServiceApi.new

begin
  # Soumettre un flux de facturation
  result = api_instance.submit_flow_proxy_api_v1_afnor_flow_v1_flows_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->submit_flow_proxy_api_v1_afnor_flow_v1_flows_post: #{e}"
end
```

#### Using the submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info

```ruby
begin
  # Soumettre un flux de facturation
  data, status_code, headers = api_instance.submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info: #{e}"
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

