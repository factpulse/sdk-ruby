# FactPulse::AFNORPDPPADirectoryServiceApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post**](AFNORPDPPADirectoryServiceApi.md#create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post) | **POST** /api/v1/afnor/directory/v1/directory-line | Creating a directory line |
| [**create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post**](AFNORPDPPADirectoryServiceApi.md#create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post) | **POST** /api/v1/afnor/directory/v1/routing-code | Create a routing code |
| [**delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete**](AFNORPDPPADirectoryServiceApi.md#delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete) | **DELETE** /api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance} | Delete a directory line |
| [**directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get**](AFNORPDPPADirectoryServiceApi.md#directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get) | **GET** /api/v1/afnor/directory/v1/healthcheck | Healthcheck Directory Service |
| [**get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get**](AFNORPDPPADirectoryServiceApi.md#get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get) | **GET** /api/v1/afnor/directory/v1/directory-line/code:{addressing_identifier} | Get a directory line |
| [**get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance} | Get a directory line |
| [**get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance} | Get a routing code by instance-id |
| [**get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get**](AFNORPDPPADirectoryServiceApi.md#get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get) | **GET** /api/v1/afnor/directory/v1/routing-code/siret:{siret}/code:{routing_identifier} | Get a routing code by SIRET and routing identifier |
| [**get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get**](AFNORPDPPADirectoryServiceApi.md#get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get) | **GET** /api/v1/afnor/directory/v1/siren/code-insee:{siren} | Consult a siren (legal unit) by SIREN number |
| [**get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/siren/id-instance:{id_instance} | Gets a siren (legal unit) by instance ID |
| [**get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get**](AFNORPDPPADirectoryServiceApi.md#get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get) | **GET** /api/v1/afnor/directory/v1/siret/code-insee:{siret} | Gets a siret (facility) by SIRET number |
| [**get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/siret/id-instance:{id_instance} | Gets a siret (facility) by id-instance |
| [**patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch**](AFNORPDPPADirectoryServiceApi.md#patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch) | **PATCH** /api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance} | Partially updates a directory line |
| [**patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch**](AFNORPDPPADirectoryServiceApi.md#patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch) | **PATCH** /api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance} | Partially update a private routing code |
| [**put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put**](AFNORPDPPADirectoryServiceApi.md#put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put) | **PUT** /api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance} | Completely update a private routing code |
| [**search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post**](AFNORPDPPADirectoryServiceApi.md#search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post) | **POST** /api/v1/afnor/directory/v1/directory-line/search | Search for a directory line |
| [**search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post**](AFNORPDPPADirectoryServiceApi.md#search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post) | **POST** /api/v1/afnor/directory/v1/routing-code/search | Search for a routing code |
| [**search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post**](AFNORPDPPADirectoryServiceApi.md#search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post) | **POST** /api/v1/afnor/directory/v1/siren/search | SIREN search (or legal unit) |
| [**search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post**](AFNORPDPPADirectoryServiceApi.md#search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post) | **POST** /api/v1/afnor/directory/v1/siret/search | Search for a SIRET (facility) |


## create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post

> Object create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post

Creating a directory line

Create a line in the directory

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # Creating a directory line
  result = api_instance.create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post: #{e}"
end
```

#### Using the create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info

```ruby
begin
  # Creating a directory line
  data, status_code, headers = api_instance.create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info: #{e}"
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


## create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post

> Object create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post

Create a routing code

Create a routing code in the directory

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # Create a routing code
  result = api_instance.create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post: #{e}"
end
```

#### Using the create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info

```ruby
begin
  # Create a routing code
  data, status_code, headers = api_instance.create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info: #{e}"
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


## delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete

> Object delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete(id_instance)

Delete a directory line

Delete a directory line

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Delete a directory line
  result = api_instance.delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete: #{e}"
end
```

#### Using the delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info(id_instance)

```ruby
begin
  # Delete a directory line
  data, status_code, headers = api_instance.delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get

> Object directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get

Healthcheck Directory Service

Check Directory Service availability

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


## get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get

> Object get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get(addressing_identifier)

Get a directory line

Get a directory line identified by an addressing identifier

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
addressing_identifier = 'addressing_identifier_example' # String | 

begin
  # Get a directory line
  result = api_instance.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get(addressing_identifier)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get: #{e}"
end
```

#### Using the get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier)

```ruby
begin
  # Get a directory line
  data, status_code, headers = api_instance.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **addressing_identifier** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get

> Object get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get(id_instance)

Get a directory line

Get a directory line identified by its idInstance

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Get a directory line
  result = api_instance.get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info(id_instance)

```ruby
begin
  # Get a directory line
  data, status_code, headers = api_instance.get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get

> Object get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get(id_instance)

Get a routing code by instance-id

Get a routing code identified by its idInstance

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Get a routing code by instance-id
  result = api_instance.get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info(id_instance)

```ruby
begin
  # Get a routing code by instance-id
  data, status_code, headers = api_instance.get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get

> Object get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get(siret, routing_identifier)

Get a routing code by SIRET and routing identifier

Consult a routing code identified by SIRET and routing identifier

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
siret = 'siret_example' # String | 
routing_identifier = 'routing_identifier_example' # String | 

begin
  # Get a routing code by SIRET and routing identifier
  result = api_instance.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get(siret, routing_identifier)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get: #{e}"
end
```

#### Using the get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier)

```ruby
begin
  # Get a routing code by SIRET and routing identifier
  data, status_code, headers = api_instance.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siret** | **String** |  |  |
| **routing_identifier** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get

> Object get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get(siren)

Consult a siren (legal unit) by SIREN number

Returns details of a company (legal unit) identified by its SIREN number

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
siren = 'siren_example' # String | 

begin
  # Consult a siren (legal unit) by SIREN number
  result = api_instance.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get(siren)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get: #{e}"
end
```

#### Using the get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren)

```ruby
begin
  # Consult a siren (legal unit) by SIREN number
  data, status_code, headers = api_instance.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get

> Object get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get(id_instance)

Gets a siren (legal unit) by instance ID

Get a company (legal unit) identified by its idInstance

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Gets a siren (legal unit) by instance ID
  result = api_instance.get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info(id_instance)

```ruby
begin
  # Gets a siren (legal unit) by instance ID
  data, status_code, headers = api_instance.get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get

> Object get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get(siret)

Gets a siret (facility) by SIRET number

Get an establishment identified by its SIRET number

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
siret = 'siret_example' # String | 

begin
  # Gets a siret (facility) by SIRET number
  result = api_instance.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get(siret)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get: #{e}"
end
```

#### Using the get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret)

```ruby
begin
  # Gets a siret (facility) by SIRET number
  data, status_code, headers = api_instance.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siret** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get

> Object get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get(id_instance)

Gets a siret (facility) by id-instance

Get an establishment identified by its idInstance

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Gets a siret (facility) by id-instance
  result = api_instance.get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info(id_instance)

```ruby
begin
  # Gets a siret (facility) by id-instance
  data, status_code, headers = api_instance.get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch

> Object patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch(id_instance)

Partially updates a directory line

Partially update a directory line

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Partially updates a directory line
  result = api_instance.patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch: #{e}"
end
```

#### Using the patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info(id_instance)

```ruby
begin
  # Partially updates a directory line
  data, status_code, headers = api_instance.patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch

> Object patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch(id_instance)

Partially update a private routing code

Partially update a private routing code

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Partially update a private routing code
  result = api_instance.patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch: #{e}"
end
```

#### Using the patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info(id_instance)

```ruby
begin
  # Partially update a private routing code
  data, status_code, headers = api_instance.patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put

> Object put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put(id_instance)

Completely update a private routing code

Completely update a private routing code

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
id_instance = 'id_instance_example' # String | 

begin
  # Completely update a private routing code
  result = api_instance.put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put(id_instance)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put: #{e}"
end
```

#### Using the put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info(id_instance)

```ruby
begin
  # Completely update a private routing code
  data, status_code, headers = api_instance.put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info(id_instance)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post

> Object search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post

Search for a directory line

Search for directory lines by criteria

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # Search for a directory line
  result = api_instance.search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post: #{e}"
end
```

#### Using the search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info

```ruby
begin
  # Search for a directory line
  data, status_code, headers = api_instance.search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info: #{e}"
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


## search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post

> Object search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post

Search for a routing code

Search for routing codes by criteria

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # Search for a routing code
  result = api_instance.search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post: #{e}"
end
```

#### Using the search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info

```ruby
begin
  # Search for a routing code
  data, status_code, headers = api_instance.search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info: #{e}"
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


## search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post

> Object search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post

SIREN search (or legal unit)

Multi-criteria search for companies (legal units)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # SIREN search (or legal unit)
  result = api_instance.search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post: #{e}"
end
```

#### Using the search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info

```ruby
begin
  # SIREN search (or legal unit)
  data, status_code, headers = api_instance.search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info: #{e}"
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


## search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post

> Object search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post

Search for a SIRET (facility)

Multi-criteria search for establishments

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new

begin
  # Search for a SIRET (facility)
  result = api_instance.search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post: #{e}"
end
```

#### Using the search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info

```ruby
begin
  # Search for a SIRET (facility)
  data, status_code, headers = api_instance.search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info: #{e}"
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

