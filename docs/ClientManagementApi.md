# FactPulse::ClientManagementApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**activate_client_api_v1_clients_uid_activer_post**](ClientManagementApi.md#activate_client_api_v1_clients_uid_activer_post) | **POST** /api/v1/clients/{uid}/activer | Activate a client |
| [**create_client_api_v1_clients_post**](ClientManagementApi.md#create_client_api_v1_clients_post) | **POST** /api/v1/clients | Create a client |
| [**deactivate_client_api_v1_clients_uid_desactiver_post**](ClientManagementApi.md#deactivate_client_api_v1_clients_uid_desactiver_post) | **POST** /api/v1/clients/{uid}/desactiver | Deactivate a client |
| [**delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete**](ClientManagementApi.md#delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete) | **DELETE** /api/v1/clients/{uid}/webhook-secret | Delete webhook secret |
| [**generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post**](ClientManagementApi.md#generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post) | **POST** /api/v1/clients/{uid}/webhook-secret/generate | Generate webhook secret |
| [**get_client_api_v1_clients_uid_get**](ClientManagementApi.md#get_client_api_v1_clients_uid_get) | **GET** /api/v1/clients/{uid} | Get client details |
| [**get_pdp_config_api_v1_clients_uid_pdp_config_get**](ClientManagementApi.md#get_pdp_config_api_v1_clients_uid_pdp_config_get) | **GET** /api/v1/clients/{uid}/pdp-config | Get client PDP configuration |
| [**get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get**](ClientManagementApi.md#get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get) | **GET** /api/v1/clients/{uid}/webhook-secret/status | Get webhook secret status |
| [**list_clients_api_v1_clients_get**](ClientManagementApi.md#list_clients_api_v1_clients_get) | **GET** /api/v1/clients | List clients |
| [**rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post**](ClientManagementApi.md#rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post) | **POST** /api/v1/clients/{uid}/rotate-encryption-key | Rotate client encryption key |
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
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)

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
| **uid** | **String** | Client unique identifier (UUID) |  |

### Return type

[**ClientActivateResponse**](ClientActivateResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

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
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

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

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

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
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)

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
| **uid** | **String** | Client unique identifier (UUID) |  |

### Return type

[**ClientActivateResponse**](ClientActivateResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete

> <WebhookSecretDeleteResponse> delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete(uid)

Delete webhook secret

Delete the webhook secret for a client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **After deletion**: Webhooks for this client will use the global server key for HMAC signature instead of a client-specific key.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)

begin
  # Delete webhook secret
  result = api_instance.delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete(uid)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete: #{e}"
end
```

#### Using the delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookSecretDeleteResponse>, Integer, Hash)> delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete_with_http_info(uid)

```ruby
begin
  # Delete webhook secret
  data, status_code, headers = api_instance.delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete_with_http_info(uid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookSecretDeleteResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->delete_webhook_secret_api_v1_clients_uid_webhook_secret_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** | Client unique identifier (UUID) |  |

### Return type

[**WebhookSecretDeleteResponse**](WebhookSecretDeleteResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post

> <WebhookSecretGenerateResponse> generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post(uid)

Generate webhook secret

Generate or regenerate the webhook secret for a client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **Important**: Save the returned secret immediately - it will never be shown again. The secret is used to sign webhooks sent by the server (HMAC-SHA256).  **If a secret already exists**: It will be replaced by the new one.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)

begin
  # Generate webhook secret
  result = api_instance.generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post(uid)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post: #{e}"
end
```

#### Using the generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookSecretGenerateResponse>, Integer, Hash)> generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post_with_http_info(uid)

```ruby
begin
  # Generate webhook secret
  data, status_code, headers = api_instance.generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post_with_http_info(uid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookSecretGenerateResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->generate_webhook_secret_api_v1_clients_uid_webhook_secret_generate_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** | Client unique identifier (UUID) |  |

### Return type

[**WebhookSecretGenerateResponse**](WebhookSecretGenerateResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

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
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)

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
| **uid** | **String** | Client unique identifier (UUID) |  |

### Return type

[**ClientDetail**](ClientDetail.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

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
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)

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
| **uid** | **String** | Client unique identifier (UUID) |  |

### Return type

[**PDPConfigResponse**](PDPConfigResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get

> <WebhookSecretStatusResponse> get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get(uid)

Get webhook secret status

Check if a webhook secret is configured for a client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **Response**: - `hasSecret`: Whether a webhook secret is configured - `createdAt`: When the secret was created (if exists)  **Note**: The secret value is never returned, only its status.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)

begin
  # Get webhook secret status
  result = api_instance.get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get(uid)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get: #{e}"
end
```

#### Using the get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookSecretStatusResponse>, Integer, Hash)> get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get_with_http_info(uid)

```ruby
begin
  # Get webhook secret status
  data, status_code, headers = api_instance.get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get_with_http_info(uid)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookSecretStatusResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->get_webhook_secret_status_api_v1_clients_uid_webhook_secret_status_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** | Client unique identifier (UUID) |  |

### Return type

[**WebhookSecretStatusResponse**](WebhookSecretStatusResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

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
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

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

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post

> <KeyRotationResponse> rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post(uid, key_rotation_request)

Rotate client encryption key

Rotate the client encryption key for all secrets in double encryption mode.  **Scope**: Client level (JWT with client_uid that must match {uid})  **What this does**: 1. Decrypts all secrets (PDP, Chorus Pro) using the old key 2. Re-encrypts them using the new key 3. Saves to database  **Important notes**: - Both keys must be base64-encoded AES-256 keys (32 bytes each) - The old key becomes invalid immediately after rotation - Only secrets encrypted with `encryptionMode: \"double\"` are affected - If the client has no double-encrypted secrets, returns 404  **Security**: - The old key must be valid (decryption is verified) - If decryption fails, rotation is aborted (atomic operation) - Neither key is logged or stored by the server

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)
key_rotation_request = FactPulse::KeyRotationRequest.new({old_key: 'old_key_example', new_key: 'new_key_example'}) # KeyRotationRequest | 

begin
  # Rotate client encryption key
  result = api_instance.rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post(uid, key_rotation_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post: #{e}"
end
```

#### Using the rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<KeyRotationResponse>, Integer, Hash)> rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post_with_http_info(uid, key_rotation_request)

```ruby
begin
  # Rotate client encryption key
  data, status_code, headers = api_instance.rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post_with_http_info(uid, key_rotation_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <KeyRotationResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->rotate_encryption_key_api_v1_clients_uid_rotate_encryption_key_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** | Client unique identifier (UUID) |  |
| **key_rotation_request** | [**KeyRotationRequest**](KeyRotationRequest.md) |  |  |

### Return type

[**KeyRotationResponse**](KeyRotationResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
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
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)
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
| **uid** | **String** | Client unique identifier (UUID) |  |
| **client_update_request** | [**ClientUpdateRequest**](ClientUpdateRequest.md) |  |  |

### Return type

[**ClientDetail**](ClientDetail.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_pdp_config_api_v1_clients_uid_pdp_config_put

> <PDPConfigResponse> update_pdp_config_api_v1_clients_uid_pdp_config_put(uid, pdp_config_update_request, opts)

Configure client PDP

Configure or update the PDP (PA/PDP) configuration for a client.  **Scope**: Client level (JWT with client_uid that must match {uid})  **Required fields**: - `flowServiceUrl`: PDP Flow Service URL - `tokenUrl`: PDP OAuth token URL - `oauthClientId`: OAuth Client ID - `clientSecret`: OAuth Client Secret (sent but NEVER returned)  **Optional fields**: - `isActive`: Enable/disable the config (default: true) - `modeSandbox`: Sandbox mode (default: false) - `encryptionMode`: Encryption mode (default: \"fernet\")   - \"fernet\": Server-side encryption only   - \"double\": Client AES-256-GCM + Server Fernet (requires X-Encryption-Key header)  **Double Encryption Mode**: When `encryptionMode` is set to \"double\", you MUST also provide the `X-Encryption-Key` header containing a base64-encoded AES-256 key (32 bytes). This key is used to encrypt the `clientSecret` on the client side before the server encrypts it again with Fernet. The server cannot decrypt the secret without the client key.  **Security**: The `clientSecret` is stored encrypted on Django side and is never returned in API responses.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure API key authorization: APIKeyHeader
  config.api_key['X-API-Key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  # config.api_key_prefix['X-API-Key'] = 'Bearer'

  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ClientManagementApi.new
uid = '38400000-8cf0-11bd-b23e-10b96e4ef00d' # String | Client unique identifier (UUID)
pdp_config_update_request = FactPulse::PDPConfigUpdateRequest.new({flow_service_url: 'flow_service_url_example', token_url: 'token_url_example', oauth_client_id: 'oauth_client_id_example', client_secret: 'client_secret_example'}) # PDPConfigUpdateRequest | 
opts = {
  x_encryption_key: 'x_encryption_key_example' # String | Client encryption key for double encryption mode. Must be a base64-encoded AES-256 key (32 bytes). Required only when accessing resources encrypted with encryption_mode='double'.
}

begin
  # Configure client PDP
  result = api_instance.update_pdp_config_api_v1_clients_uid_pdp_config_put(uid, pdp_config_update_request, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ClientManagementApi->update_pdp_config_api_v1_clients_uid_pdp_config_put: #{e}"
end
```

#### Using the update_pdp_config_api_v1_clients_uid_pdp_config_put_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PDPConfigResponse>, Integer, Hash)> update_pdp_config_api_v1_clients_uid_pdp_config_put_with_http_info(uid, pdp_config_update_request, opts)

```ruby
begin
  # Configure client PDP
  data, status_code, headers = api_instance.update_pdp_config_api_v1_clients_uid_pdp_config_put_with_http_info(uid, pdp_config_update_request, opts)
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
| **uid** | **String** | Client unique identifier (UUID) |  |
| **pdp_config_update_request** | [**PDPConfigUpdateRequest**](PDPConfigUpdateRequest.md) |  |  |
| **x_encryption_key** | **String** | Client encryption key for double encryption mode. Must be a base64-encoded AES-256 key (32 bytes). Required only when accessing resources encrypted with encryption_mode&#x3D;&#39;double&#39;. | [optional] |

### Return type

[**PDPConfigResponse**](PDPConfigResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

