# FactPulse::AFNORPDPPAApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**oauth_token_proxy_api_v1_afnor_oauth_token_post**](AFNORPDPPAApi.md#oauth_token_proxy_api_v1_afnor_oauth_token_post) | **POST** /api/v1/afnor/oauth/token | Endpoint OAuth2 pour authentification AFNOR |


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

