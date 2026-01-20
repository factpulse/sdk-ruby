# FactPulse::ClientManagementApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**activate_client_api_v1_clients_uid_activer_post**](ClientManagementApi.md#activate_client_api_v1_clients_uid_activer_post) | **POST** /api/v1/clients/{uid}/activer | Activate a client |
| [**create_client_api_v1_clients_post**](ClientManagementApi.md#create_client_api_v1_clients_post) | **POST** /api/v1/clients | Create a client |
| [**deactivate_client_api_v1_clients_uid_desactiver_post**](ClientManagementApi.md#deactivate_client_api_v1_clients_uid_desactiver_post) | **POST** /api/v1/clients/{uid}/desactiver | Deactivate a client |
| [**get_client_api_v1_clients_uid_get**](ClientManagementApi.md#get_client_api_v1_clients_uid_get) | **GET** /api/v1/clients/{uid} | Get client details |
| [**get_pdp_config_api_v1_clients_uid_pdp_config_get**](ClientManagementApi.md#get_pdp_config_api_v1_clients_uid_pdp_config_get) | **GET** /api/v1/clients/{uid}/pdp-config | Get client PDP configuration |
| [**list_clients_api_v1_clients_get**](ClientManagementApi.md#list_clients_api_v1_clients_get) | **GET** /api/v1/clients | List clients |
| [**update_client_api_v1_clients_uid_patch**](ClientManagementApi.md#update_client_api_v1_clients_uid_patch) | **PATCH** /api/v1/clients/{uid} | Update a client |
| [**update_pdp_config_api_v1_clients_uid_pdp_config_put**](ClientManagementApi.md#update_pdp_config_api_v1_clients_uid_pdp_config_put) | **PUT** /api/v1/clients/{uid}/pdp-config | Configure client PDP |


## activate_client_api_v1_clients_uid_activer_post

> <ClientActivateResponse> activate_client_api_v1_clients_uid_activer_post(uid)

Activate a client

Activate a deactivated client.  **Scope**: Client level (JWT with client_uid that must match {uid})

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Activate a client
  result = api_instance.activate_client_api_v1_clients_uid_activer_post(uid)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->activate_client_api_v1_clients_uid_activer_post: #{e}"
end
```

#### Using the activate_client_api_v1_clients_uid_activer_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientActivateResponse>, Integer, Hash)> activate_client_api_v1_clients_uid_activer_post_with_http_info(uid)

```ruby
begin
  # Activate a client
  data, status_code, headers = api_instance.activate_client_api_v1_clients_uid_activer_post_with_http_info(uid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientActivateResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->activate_client_api_v1_clients_uid_activer_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** |  |  |

### Return type

[**ClientActivateResponse**](ClientActivateResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_client_api_v1_clients_post

> <ClientDetail> create_client_api_v1_clients_post(client_create_request)

Create a client

Create a new client for the account.  **Scope**: Account level (JWT without client_uid)  **Fields**: - `name`: Client name (required) - `description`: Optional description - `siret`: Optional SIRET (14 digits)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
client_create_request = FactPulse::ClientCreateRequest.new({name: 'name_example'}) # ClientCreateRequest | 

begin
  # Create a client
  result = api_instance.create_client_api_v1_clients_post(client_create_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->create_client_api_v1_clients_post: #{e}"
end
```

#### Using the create_client_api_v1_clients_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientDetail>, Integer, Hash)> create_client_api_v1_clients_post_with_http_info(client_create_request)

```ruby
begin
  # Create a client
  data, status_code, headers = api_instance.create_client_api_v1_clients_post_with_http_info(client_create_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientDetail>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->create_client_api_v1_clients_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_create_request** | [**ClientCreateRequest**](ClientCreateRequest.md) |  |  |

### Return type

[**ClientDetail**](ClientDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## deactivate_client_api_v1_clients_uid_desactiver_post

> <ClientActivateResponse> deactivate_client_api_v1_clients_uid_desactiver_post(uid)

Deactivate a client

Deactivate an active client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **Note**: A deactivated client cannot be used for API calls (AFNOR, Chorus Pro, etc.).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Deactivate a client
  result = api_instance.deactivate_client_api_v1_clients_uid_desactiver_post(uid)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->deactivate_client_api_v1_clients_uid_desactiver_post: #{e}"
end
```

#### Using the deactivate_client_api_v1_clients_uid_desactiver_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientActivateResponse>, Integer, Hash)> deactivate_client_api_v1_clients_uid_desactiver_post_with_http_info(uid)

```ruby
begin
  # Deactivate a client
  data, status_code, headers = api_instance.deactivate_client_api_v1_clients_uid_desactiver_post_with_http_info(uid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientActivateResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->deactivate_client_api_v1_clients_uid_desactiver_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** |  |  |

### Return type

[**ClientActivateResponse**](ClientActivateResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_client_api_v1_clients_uid_get

> <ClientDetail> get_client_api_v1_clients_uid_get(uid)

Get client details

Get details of a client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **Security**: If the JWT contains a client_uid, it must match the {uid} in the URL, otherwise a 403 error is returned.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Get client details
  result = api_instance.get_client_api_v1_clients_uid_get(uid)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->get_client_api_v1_clients_uid_get: #{e}"
end
```

#### Using the get_client_api_v1_clients_uid_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientDetail>, Integer, Hash)> get_client_api_v1_clients_uid_get_with_http_info(uid)

```ruby
begin
  # Get client details
  data, status_code, headers = api_instance.get_client_api_v1_clients_uid_get_with_http_info(uid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientDetail>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->get_client_api_v1_clients_uid_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** |  |  |

### Return type

[**ClientDetail**](ClientDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_pdp_config_api_v1_clients_uid_pdp_config_get

> <PDPConfigResponse> get_pdp_config_api_v1_clients_uid_pdp_config_get(uid)

Get client PDP configuration

Get the PDP (PA/PDP) configuration for a client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **Security**: The client secret is never returned. Only a status (`secretStatus`) indicates whether a secret is configured.  **Response**: - If configured: all config details (URLs, client_id, secret status) - If not configured: `isConfigured: false` with a message

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 

begin
  # Get client PDP configuration
  result = api_instance.get_pdp_config_api_v1_clients_uid_pdp_config_get(uid)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->get_pdp_config_api_v1_clients_uid_pdp_config_get: #{e}"
end
```

#### Using the get_pdp_config_api_v1_clients_uid_pdp_config_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PDPConfigResponse>, Integer, Hash)> get_pdp_config_api_v1_clients_uid_pdp_config_get_with_http_info(uid)

```ruby
begin
  # Get client PDP configuration
  data, status_code, headers = api_instance.get_pdp_config_api_v1_clients_uid_pdp_config_get_with_http_info(uid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PDPConfigResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->get_pdp_config_api_v1_clients_uid_pdp_config_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** |  |  |

### Return type

[**PDPConfigResponse**](PDPConfigResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_clients_api_v1_clients_get

> <ClientListResponse> list_clients_api_v1_clients_get(opts)

List clients

Paginated list of clients for the account.  **Scope**: Account level (JWT without client_uid)  **Pagination**: - `page`: Page number (default: 1) - `pageSize`: Page size (default: 20, max: 100)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
opts = {
  page: 56, # Integer | Page number
  page_size: 56 # Integer | Page size
}

begin
  # List clients
  result = api_instance.list_clients_api_v1_clients_get(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->list_clients_api_v1_clients_get: #{e}"
end
```

#### Using the list_clients_api_v1_clients_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientListResponse>, Integer, Hash)> list_clients_api_v1_clients_get_with_http_info(opts)

```ruby
begin
  # List clients
  data, status_code, headers = api_instance.list_clients_api_v1_clients_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientListResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->list_clients_api_v1_clients_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **page** | **Integer** | Page number | [optional][default to 1] |
| **page_size** | **Integer** | Page size | [optional][default to 20] |

### Return type

[**ClientListResponse**](ClientListResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## update_client_api_v1_clients_uid_patch

> <ClientDetail> update_client_api_v1_clients_uid_patch(uid, client_update_request)

Update a client

Update client information (partial update).  **Scope**: Client level (JWT with client_uid that must match {uid})  **Updatable fields**: - `name`: Client name - `description`: Description - `siret`: SIRET (14 digits)  Only provided fields are updated.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
client_update_request = FactPulse::ClientUpdateRequest.new # ClientUpdateRequest | 

begin
  # Update a client
  result = api_instance.update_client_api_v1_clients_uid_patch(uid, client_update_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->update_client_api_v1_clients_uid_patch: #{e}"
end
```

#### Using the update_client_api_v1_clients_uid_patch_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientDetail>, Integer, Hash)> update_client_api_v1_clients_uid_patch_with_http_info(uid, client_update_request)

```ruby
begin
  # Update a client
  data, status_code, headers = api_instance.update_client_api_v1_clients_uid_patch_with_http_info(uid, client_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientDetail>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->update_client_api_v1_clients_uid_patch_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** |  |  |
| **client_update_request** | [**ClientUpdateRequest**](ClientUpdateRequest.md) |  |  |

### Return type

[**ClientDetail**](ClientDetail.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_pdp_config_api_v1_clients_uid_pdp_config_put

> <PDPConfigResponse> update_pdp_config_api_v1_clients_uid_pdp_config_put(uid, pdp_config_update_request)

Configure client PDP

Configure or update the PDP (PA/PDP) configuration for a client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **Required fields**: - `flowServiceUrl`: PDP Flow Service URL - `tokenUrl`: PDP OAuth token URL - `oauthClientId`: OAuth Client ID - `clientSecret`: OAuth Client Secret (sent but NEVER returned)  **Optional fields**: - `isActive`: Enable/disable the config (default: true) - `modeSandbox`: Sandbox mode (default: false)  **Security**: The `clientSecret` is stored encrypted on Django side and is never returned in API responses.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | 
pdp_config_update_request = FactPulse::PDPConfigUpdateRequest.new({flow_service_url: 'flow_service_url_example', token_url: 'token_url_example', oauth_client_id: 'oauth_client_id_example', client_secret: 'client_secret_example'}) # PDPConfigUpdateRequest | 

begin
  # Configure client PDP
  result = api_instance.update_pdp_config_api_v1_clients_uid_pdp_config_put(uid, pdp_config_update_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->update_pdp_config_api_v1_clients_uid_pdp_config_put: #{e}"
end
```

#### Using the update_pdp_config_api_v1_clients_uid_pdp_config_put_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PDPConfigResponse>, Integer, Hash)> update_pdp_config_api_v1_clients_uid_pdp_config_put_with_http_info(uid, pdp_config_update_request)

```ruby
begin
  # Configure client PDP
  data, status_code, headers = api_instance.update_pdp_config_api_v1_clients_uid_pdp_config_put_with_http_info(uid, pdp_config_update_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PDPConfigResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->update_pdp_config_api_v1_clients_uid_pdp_config_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** |  |  |
| **pdp_config_update_request** | [**PDPConfigUpdateRequest**](PDPConfigUpdateRequest.md) |  |  |

### Return type

[**PDPConfigResponse**](PDPConfigResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

