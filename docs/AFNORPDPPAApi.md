# FactPulse::AFNORPDPPAApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_afnor_credentials_api_v1_afnor_credentials_get**](AFNORPDPPAApi.md#get_afnor_credentials_api_v1_afnor_credentials_get) | **GET** /api/v1/afnor/credentials | Récupérer les credentials AFNOR stockés |
| [**oauth_token_proxy_api_v1_afnor_oauth_token_post**](AFNORPDPPAApi.md#oauth_token_proxy_api_v1_afnor_oauth_token_post) | **POST** /api/v1/afnor/oauth/token | Endpoint OAuth2 pour authentification AFNOR |


## get_afnor_credentials_api_v1_afnor_credentials_get

> Object get_afnor_credentials_api_v1_afnor_credentials_get

Récupérer les credentials AFNOR stockés

Récupère les credentials AFNOR/PDP stockés pour le client_uid du JWT. Cet endpoint est utilisé par le SDK en mode 'stored' pour récupérer les credentials avant de faire l'OAuth AFNOR lui-même.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPAApi.new

begin
  # Récupérer les credentials AFNOR stockés
  result = api_instance.get_afnor_credentials_api_v1_afnor_credentials_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAApi->get_afnor_credentials_api_v1_afnor_credentials_get: #{e}"
end
```

#### Using the get_afnor_credentials_api_v1_afnor_credentials_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_afnor_credentials_api_v1_afnor_credentials_get_with_http_info

```ruby
begin
  # Récupérer les credentials AFNOR stockés
  data, status_code, headers = api_instance.get_afnor_credentials_api_v1_afnor_credentials_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAApi->get_afnor_credentials_api_v1_afnor_credentials_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## oauth_token_proxy_api_v1_afnor_oauth_token_post

> Object oauth_token_proxy_api_v1_afnor_oauth_token_post

Endpoint OAuth2 pour authentification AFNOR

Endpoint proxy OAuth2 pour obtenir un token d'accès AFNOR. Fait proxy vers le mock AFNOR (sandbox) ou la vraie PDP selon MOCK_AFNOR_BASE_URL. Cet endpoint est public (pas d'auth Django requise) car il est appelé par le SDK AFNOR.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPAApi.new

begin
  # Endpoint OAuth2 pour authentification AFNOR
  result = api_instance.oauth_token_proxy_api_v1_afnor_oauth_token_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAApi->oauth_token_proxy_api_v1_afnor_oauth_token_post: #{e}"
end
```

#### Using the oauth_token_proxy_api_v1_afnor_oauth_token_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> oauth_token_proxy_api_v1_afnor_oauth_token_post_with_http_info

```ruby
begin
  # Endpoint OAuth2 pour authentification AFNOR
  data, status_code, headers = api_instance.oauth_token_proxy_api_v1_afnor_oauth_token_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAApi->oauth_token_proxy_api_v1_afnor_oauth_token_post_with_http_info: #{e}"
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

