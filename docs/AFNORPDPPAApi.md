# FactPulse::AFNORPDPPAApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_afnor_credentials_api_v1_afnor_credentials_get**](AFNORPDPPAApi.md#get_afnor_credentials_api_v1_afnor_credentials_get) | **GET** /api/v1/afnor/credentials | Retrieve stored AFNOR credentials |
| [**get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get**](AFNORPDPPAApi.md#get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get) | **GET** /api/v1/afnor/incoming-flows/{flow_id} | Retrieve and extract an incoming invoice |
| [**oauth_token_proxy_api_v1_afnor_oauth_token_post**](AFNORPDPPAApi.md#oauth_token_proxy_api_v1_afnor_oauth_token_post) | **POST** /api/v1/afnor/oauth/token | OAuth2 endpoint for AFNOR authentication |


## get_afnor_credentials_api_v1_afnor_credentials_get

> Object get_afnor_credentials_api_v1_afnor_credentials_get

Retrieve stored AFNOR credentials

Retrieves stored AFNOR/PDP credentials for the JWT's client_uid. This endpoint is used by the SDK in 'stored' mode to retrieve credentials before performing AFNOR OAuth itself.

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
  # Retrieve stored AFNOR credentials
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
  # Retrieve stored AFNOR credentials
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


## get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get

> <IncomingInvoice> get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get(flow_id, opts)

Retrieve and extract an incoming invoice

Downloads an incoming flow from the AFNOR PDP and extracts invoice metadata into a unified JSON format. Supports Factur-X, CII, and UBL formats.

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
flow_id = 'flow_id_example' # String | AFNOR flow ID (UUID format)
opts = {
  include_document: true # Boolean | Include base64-encoded document in response
}

begin
  # Retrieve and extract an incoming invoice
  result = api_instance.get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get(flow_id, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAApi->get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get: #{e}"
end
```

#### Using the get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<IncomingInvoice>, Integer, Hash)> get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get_with_http_info(flow_id, opts)

```ruby
begin
  # Retrieve and extract an incoming invoice
  data, status_code, headers = api_instance.get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get_with_http_info(flow_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <IncomingInvoice>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPAApi->get_flux_entrant_api_v1_afnor_incoming_flows_flow_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | AFNOR flow ID (UUID format) |  |
| **include_document** | **Boolean** | Include base64-encoded document in response | [optional][default to false] |

### Return type

[**IncomingInvoice**](IncomingInvoice.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## oauth_token_proxy_api_v1_afnor_oauth_token_post

> Object oauth_token_proxy_api_v1_afnor_oauth_token_post

OAuth2 endpoint for AFNOR authentication

OAuth2 proxy endpoint to obtain an AFNOR access token. Proxies to AFNOR mock (sandbox) or real PDP depending on MOCK_AFNOR_BASE_URL. This endpoint is public (no Django auth required) as it is called by the AFNOR SDK.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPAApi.new

begin
  # OAuth2 endpoint for AFNOR authentication
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
  # OAuth2 endpoint for AFNOR authentication
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

