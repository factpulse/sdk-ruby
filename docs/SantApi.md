# FactPulse::SantApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**healthcheck_healthcheck_get**](SantApi.md#healthcheck_healthcheck_get) | **GET** /healthcheck | Endpoint de healthcheck pour Docker |
| [**racine_get**](SantApi.md#racine_get) | **GET** / | Vérifier l&#39;état de l&#39;API |


## healthcheck_healthcheck_get

> Object healthcheck_healthcheck_get

Endpoint de healthcheck pour Docker

Endpoint de healthcheck pour Docker et les load balancers.  Utile pour : - Docker healthcheck - Kubernetes liveness/readiness probes - Load balancers (Nginx, HAProxy) - Monitoring de disponibilité - Déploiement zero downtime  Retourne un code 200 si l'API est opérationnelle.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::SantApi.new

begin
  # Endpoint de healthcheck pour Docker
  result = api_instance.healthcheck_healthcheck_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling SantApi->healthcheck_healthcheck_get: #{e}"
end
```

#### Using the healthcheck_healthcheck_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> healthcheck_healthcheck_get_with_http_info

```ruby
begin
  # Endpoint de healthcheck pour Docker
  data, status_code, headers = api_instance.healthcheck_healthcheck_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling SantApi->healthcheck_healthcheck_get_with_http_info: #{e}"
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


## racine_get

> Object racine_get

Vérifier l'état de l'API

Endpoint de health check pour vérifier que l'API répond.  Utile pour : - Monitoring de disponibilité - Tests d'intégration - Load balancers

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::SantApi.new

begin
  # Vérifier l'état de l'API
  result = api_instance.racine_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling SantApi->racine_get: #{e}"
end
```

#### Using the racine_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> racine_get_with_http_info

```ruby
begin
  # Vérifier l'état de l'API
  data, status_code, headers = api_instance.racine_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling SantApi->racine_get_with_http_info: #{e}"
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

