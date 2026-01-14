# FactPulse::AFNORPDPPADirectoryServiceApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post**](AFNORPDPPADirectoryServiceApi.md#create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post) | **POST** /api/v1/afnor/directory/v1/directory-line | Creating a directory line |
| [**create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post**](AFNORPDPPADirectoryServiceApi.md#create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post) | **POST** /api/v1/afnor/directory/v1/routing-code | Create a routing code |
| [**delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete**](AFNORPDPPADirectoryServiceApi.md#delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete) | **DELETE** /api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance} | Delete a directory line |
| [**directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get**](AFNORPDPPADirectoryServiceApi.md#directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get) | **GET** /api/v1/afnor/directory/v1/healthcheck | Healthcheck Directory Service |
| [**get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get**](AFNORPDPPADirectoryServiceApi.md#get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get) | **GET** /api/v1/afnor/directory/v1/directory-line/code:{addressing_identifier} | Get a directory line. |
| [**get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance} | Get a directory line. |
| [**get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance} | Get a routing code by instance-id. |
| [**get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get**](AFNORPDPPADirectoryServiceApi.md#get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get) | **GET** /api/v1/afnor/directory/v1/routing-code/siret:{siret}/code:{routing_identifier} | Get a routing code by SIRET and routing identifier |
| [**get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get**](AFNORPDPPADirectoryServiceApi.md#get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get) | **GET** /api/v1/afnor/directory/v1/siren/code-insee:{siren} | Consult a siren (legal unit) by SIREN number |
| [**get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/siren/id-instance:{id_instance} | Gets a siren (legal unit) by instance ID |
| [**get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get**](AFNORPDPPADirectoryServiceApi.md#get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get) | **GET** /api/v1/afnor/directory/v1/siret/code-insee:{siret} | Gets a siret (facility) by SIRET number |
| [**get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get**](AFNORPDPPADirectoryServiceApi.md#get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get) | **GET** /api/v1/afnor/directory/v1/siret/id-instance:{id_instance} | Gets a siret (facility) by id-instance |
| [**patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch**](AFNORPDPPADirectoryServiceApi.md#patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch) | **PATCH** /api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance} | Partially updates a directory line.. |
| [**patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch**](AFNORPDPPADirectoryServiceApi.md#patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch) | **PATCH** /api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance} | Partially update a private routing code. |
| [**put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put**](AFNORPDPPADirectoryServiceApi.md#put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put) | **PUT** /api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance} | Completely update a private routing code. |
| [**search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post**](AFNORPDPPADirectoryServiceApi.md#search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post) | **POST** /api/v1/afnor/directory/v1/directory-line/search | Search for a directory line |
| [**search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post**](AFNORPDPPADirectoryServiceApi.md#search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post) | **POST** /api/v1/afnor/directory/v1/routing-code/search | Search for a routing code |
| [**search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post**](AFNORPDPPADirectoryServiceApi.md#search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post) | **POST** /api/v1/afnor/directory/v1/siren/search | SIREN search (or legal unit) |
| [**search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post**](AFNORPDPPADirectoryServiceApi.md#search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post) | **POST** /api/v1/afnor/directory/v1/siret/search | Search for a SIRET (facility) |


## create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post

> Object create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post(opts)

Creating a directory line

Creation of a new directory line for a SIREN, a SIRET or a ROUTING CODE.

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
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Creating a directory line
  result = api_instance.create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post: #{e}"
end
```

#### Using the create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info(opts)

```ruby
begin
  # Creating a directory line
  data, status_code, headers = api_instance.create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post

> Object create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post(opts)

Create a routing code

Creating a routing code.

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
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Create a routing code
  result = api_instance.create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post: #{e}"
end
```

#### Using the create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info(opts)

```ruby
begin
  # Create a routing code
  data, status_code, headers = api_instance.create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete

> Object delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete(id_instance, opts)

Delete a directory line

Delete a directory line.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Delete a directory line
  result = api_instance.delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete: #{e}"
end
```

#### Using the delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info(id_instance, opts)

```ruby
begin
  # Delete a directory line
  data, status_code, headers = api_instance.delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info(id_instance, opts)
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
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

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

Check Directory Service availability (AFNOR XP Z12-013 compliant)

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

> <AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode> get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get(addressing_identifier, opts)

Get a directory line.

Retrieve the data from the directory line corresponding to the identifier passed in parameters.

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
addressing_identifier = 'addressing_identifier_example' # String | Addressing identifier (SIREN, SIRET or routing code)
opts = {
  fields: ['inner_example'], # Array<String> | Fields of the Directory Line resource.
  include: [FactPulse::DirectoryLineInclude::SIREN], # Array<DirectoryLineInclude> | Relations to include in the response.
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Get a directory line.
  result = api_instance.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get(addressing_identifier, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get: #{e}"
end
```

#### Using the get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode>, Integer, Hash)> get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier, opts)

```ruby
begin
  # Get a directory line.
  data, status_code, headers = api_instance.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **addressing_identifier** | **String** | Addressing identifier (SIREN, SIRET or routing code) |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of the Directory Line resource. | [optional] |
| **include** | [**Array&lt;DirectoryLineInclude&gt;**](DirectoryLineInclude.md) | Relations to include in the response. | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode**](AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get

> <AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode> get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get(id_instance, opts)

Get a directory line.

Retrieve the data from the directory line corresponding to the identifier passed in parameters.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  fields: ['inner_example'], # Array<String> | Fields of the Directory Line resource.
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Get a directory line.
  result = api_instance.get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode>, Integer, Hash)> get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info(id_instance, opts)

```ruby
begin
  # Get a directory line.
  data, status_code, headers = api_instance.get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info(id_instance, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of the Directory Line resource. | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode**](AFNORDirectoryLinePayloadHistoryLegalUnitFacilityRoutingCode.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get

> <AFNORRoutingCodePayloadHistoryLegalUnitFacility> get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get(id_instance, opts)

Get a routing code by instance-id.

Retrieve the Routing Code data corresponding to the Instance ID.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  fields: ['inner_example'], # Array<String> | Fields of the Routing Code resource
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Get a routing code by instance-id.
  result = api_instance.get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORRoutingCodePayloadHistoryLegalUnitFacility>, Integer, Hash)> get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info(id_instance, opts)

```ruby
begin
  # Get a routing code by instance-id.
  data, status_code, headers = api_instance.get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info(id_instance, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORRoutingCodePayloadHistoryLegalUnitFacility>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of the Routing Code resource | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORRoutingCodePayloadHistoryLegalUnitFacility**](AFNORRoutingCodePayloadHistoryLegalUnitFacility.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get

> <AFNORRoutingCodePayloadHistoryLegalUnitFacility> get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get(siret, routing_identifier, opts)

Get a routing code by SIRET and routing identifier

Retrieve the Routing Code data corresponding to the identifier passed in parameters.

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
siret = 'siret_example' # String | 14-digit SIRET number (INSEE establishment identifier)
routing_identifier = 'routing_identifier_example' # String | Routing code identifier
opts = {
  fields: ['inner_example'], # Array<String> | Fields of the Routing Code resource
  include: [FactPulse::RoutingCodeInclude::SIREN], # Array<RoutingCodeInclude> | Relations to include in the response.
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Get a routing code by SIRET and routing identifier
  result = api_instance.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get(siret, routing_identifier, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get: #{e}"
end
```

#### Using the get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORRoutingCodePayloadHistoryLegalUnitFacility>, Integer, Hash)> get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier, opts)

```ruby
begin
  # Get a routing code by SIRET and routing identifier
  data, status_code, headers = api_instance.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORRoutingCodePayloadHistoryLegalUnitFacility>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siret** | **String** | 14-digit SIRET number (INSEE establishment identifier) |  |
| **routing_identifier** | **String** | Routing code identifier |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of the Routing Code resource | [optional] |
| **include** | [**Array&lt;RoutingCodeInclude&gt;**](RoutingCodeInclude.md) | Relations to include in the response. | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORRoutingCodePayloadHistoryLegalUnitFacility**](AFNORRoutingCodePayloadHistoryLegalUnitFacility.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get

> <AFNORLegalUnitPayloadHistory> get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get(siren, opts)

Consult a siren (legal unit) by SIREN number

Returns the details of a company (legal unit) identified by the SIREN number passed as a parameter.

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
siren = 'siren_example' # String | 9-digit SIREN number (INSEE company identifier)
opts = {
  fields: ['inner_example'], # Array<String> | Fields of the SIREN resource
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Consult a siren (legal unit) by SIREN number
  result = api_instance.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get(siren, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get: #{e}"
end
```

#### Using the get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORLegalUnitPayloadHistory>, Integer, Hash)> get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren, opts)

```ruby
begin
  # Consult a siren (legal unit) by SIREN number
  data, status_code, headers = api_instance.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORLegalUnitPayloadHistory>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siren** | **String** | 9-digit SIREN number (INSEE company identifier) |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of the SIREN resource | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORLegalUnitPayloadHistory**](AFNORLegalUnitPayloadHistory.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get

> <AFNORLegalUnitPayloadHistory> get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get(id_instance, opts)

Gets a siren (legal unit) by instance ID

Returns the details of a company (legal unit) identified by the id-instance passed as a parameter.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  fields: ['inner_example'], # Array<String> | Fields of the SIREN resource
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Gets a siren (legal unit) by instance ID
  result = api_instance.get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORLegalUnitPayloadHistory>, Integer, Hash)> get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info(id_instance, opts)

```ruby
begin
  # Gets a siren (legal unit) by instance ID
  data, status_code, headers = api_instance.get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info(id_instance, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORLegalUnitPayloadHistory>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of the SIREN resource | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORLegalUnitPayloadHistory**](AFNORLegalUnitPayloadHistory.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get

> <AFNORFacilityPayloadHistory> get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get(siret, opts)

Gets a siret (facility) by SIRET number

Returns the details of a facility associated to a SIRET.

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
siret = 'siret_example' # String | 14-digit SIRET number (INSEE establishment identifier)
opts = {
  fields: ['inner_example'], # Array<String> | Fields of a SIRET resource.
  include: [FactPulse::SiretInclude::SIREN], # Array<SiretInclude> | Relations to include in the response.
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Gets a siret (facility) by SIRET number
  result = api_instance.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get(siret, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get: #{e}"
end
```

#### Using the get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORFacilityPayloadHistory>, Integer, Hash)> get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret, opts)

```ruby
begin
  # Gets a siret (facility) by SIRET number
  data, status_code, headers = api_instance.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORFacilityPayloadHistory>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **siret** | **String** | 14-digit SIRET number (INSEE establishment identifier) |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of a SIRET resource. | [optional] |
| **include** | [**Array&lt;SiretInclude&gt;**](SiretInclude.md) | Relations to include in the response. | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORFacilityPayloadHistory**](AFNORFacilityPayloadHistory.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get

> <AFNORFacilityPayloadHistory> get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get(id_instance, opts)

Gets a siret (facility) by id-instance

Returns the details of a facility according to an instance-id.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  fields: ['inner_example'], # Array<String> | Fields of a SIRET resource.
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Gets a siret (facility) by id-instance
  result = api_instance.get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get: #{e}"
end
```

#### Using the get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORFacilityPayloadHistory>, Integer, Hash)> get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info(id_instance, opts)

```ruby
begin
  # Gets a siret (facility) by id-instance
  data, status_code, headers = api_instance.get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info(id_instance, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORFacilityPayloadHistory>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **fields** | [**Array&lt;String&gt;**](String.md) | Fields of a SIRET resource. | [optional] |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORFacilityPayloadHistory**](AFNORFacilityPayloadHistory.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch

> <AFNORDirectoryLinePost201Response> patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch(id_instance, opts)

Partially updates a directory line..

Partially updates a directory line.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Partially updates a directory line..
  result = api_instance.patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch: #{e}"
end
```

#### Using the patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORDirectoryLinePost201Response>, Integer, Hash)> patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info(id_instance, opts)

```ruby
begin
  # Partially updates a directory line..
  data, status_code, headers = api_instance.patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info(id_instance, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORDirectoryLinePost201Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORDirectoryLinePost201Response**](AFNORDirectoryLinePost201Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch

> <AFNORRoutingCodePost201Response> patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch(id_instance, opts)

Partially update a private routing code.

Partially update a private routing code.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Partially update a private routing code.
  result = api_instance.patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch: #{e}"
end
```

#### Using the patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORRoutingCodePost201Response>, Integer, Hash)> patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info(id_instance, opts)

```ruby
begin
  # Partially update a private routing code.
  data, status_code, headers = api_instance.patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info(id_instance, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORRoutingCodePost201Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORRoutingCodePost201Response**](AFNORRoutingCodePost201Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put

> <AFNORRoutingCodePost201Response> put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put(id_instance, opts)

Completely update a private routing code.

Completely update a private routing code.

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
id_instance = 'id_instance_example' # String | AFNOR instance ID (UUID)
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Completely update a private routing code.
  result = api_instance.put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put(id_instance, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put: #{e}"
end
```

#### Using the put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORRoutingCodePost201Response>, Integer, Hash)> put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info(id_instance, opts)

```ruby
begin
  # Completely update a private routing code.
  data, status_code, headers = api_instance.put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info(id_instance, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORRoutingCodePost201Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **String** | AFNOR instance ID (UUID) |  |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORRoutingCodePost201Response**](AFNORRoutingCodePost201Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post

> <AFNORDirectoryLineSearchPost200Response> search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post(opts)

Search for a directory line

Search for directory lines that meet all the criteria passed as parameters and return the results in the desired format.

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
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Search for a directory line
  result = api_instance.search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post: #{e}"
end
```

#### Using the search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORDirectoryLineSearchPost200Response>, Integer, Hash)> search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info(opts)

```ruby
begin
  # Search for a directory line
  data, status_code, headers = api_instance.search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORDirectoryLineSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORDirectoryLineSearchPost200Response**](AFNORDirectoryLineSearchPost200Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post

> <AFNORRoutingCodeSearchPost200Response> search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post(opts)

Search for a routing code

Search for routing codes that meet all the criteria passed as parameters and return the routing codes in the desired format.

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
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Search for a routing code
  result = api_instance.search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post: #{e}"
end
```

#### Using the search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORRoutingCodeSearchPost200Response>, Integer, Hash)> search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info(opts)

```ruby
begin
  # Search for a routing code
  data, status_code, headers = api_instance.search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORRoutingCodeSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORRoutingCodeSearchPost200Response**](AFNORRoutingCodeSearchPost200Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post

> <AFNORSirenSearchPost200Response> search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post(opts)

SIREN search (or legal unit)

Multi-criteria company search.

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
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # SIREN search (or legal unit)
  result = api_instance.search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post: #{e}"
end
```

#### Using the search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORSirenSearchPost200Response>, Integer, Hash)> search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info(opts)

```ruby
begin
  # SIREN search (or legal unit)
  data, status_code, headers = api_instance.search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORSirenSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORSirenSearchPost200Response**](AFNORSirenSearchPost200Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post

> <AFNORSiretSearchPost200Response> search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post(opts)

Search for a SIRET (facility)

Multi-criteria search for facilities.

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
opts = {
  accept_language: FactPulse::AcceptLanguage::FR # AcceptLanguage | Specifies the language in which the resource is requested.
}

begin
  # Search for a SIRET (facility)
  result = api_instance.search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post: #{e}"
end
```

#### Using the search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORSiretSearchPost200Response>, Integer, Hash)> search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info(opts)

```ruby
begin
  # Search for a SIRET (facility)
  data, status_code, headers = api_instance.search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORSiretSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accept_language** | [**AcceptLanguage**](.md) | Specifies the language in which the resource is requested. | [optional] |

### Return type

[**AFNORSiretSearchPost200Response**](AFNORSiretSearchPost200Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

