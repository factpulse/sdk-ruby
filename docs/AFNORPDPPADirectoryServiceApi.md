# FactPulse::AFNORPDPPADirectoryServiceApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get**](AFNORPDPPADirectoryServiceApi.md#directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get) | **GET** /api/v1/afnor/directory/v1/healthcheck | Healthcheck Directory Service |
| [**get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get**](AFNORPDPPADirectoryServiceApi.md#get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get) | **GET** /api/v1/afnor/directory/v1/directory-line/code:{addressing_identifier} | Get a directory line. |
| [**get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get**](AFNORPDPPADirectoryServiceApi.md#get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get) | **GET** /api/v1/afnor/directory/v1/routing-code/siret:{siret}/code:{routing_identifier} | Get a routing code by SIRET and routing identifier |
| [**get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get**](AFNORPDPPADirectoryServiceApi.md#get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get) | **GET** /api/v1/afnor/directory/v1/siren/code-insee:{siren} | Consult a siren (legal unit) by SIREN number |
| [**get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get**](AFNORPDPPADirectoryServiceApi.md#get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get) | **GET** /api/v1/afnor/directory/v1/siret/code-insee:{siret} | Gets a siret (facility) by SIRET number |
| [**search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post**](AFNORPDPPADirectoryServiceApi.md#search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post) | **POST** /api/v1/afnor/directory/v1/directory-line/search | Search for a directory line |
| [**search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post**](AFNORPDPPADirectoryServiceApi.md#search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post) | **POST** /api/v1/afnor/directory/v1/routing-code/search | Search for a routing code |
| [**search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post**](AFNORPDPPADirectoryServiceApi.md#search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post) | **POST** /api/v1/afnor/directory/v1/siren/search | SIREN search (or legal unit) |
| [**search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post**](AFNORPDPPADirectoryServiceApi.md#search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post) | **POST** /api/v1/afnor/directory/v1/siret/search | Search for a SIRET (facility) |


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

> <AFNORDirectoryLinePayloadLegalUnitFacilityRoutingCode> get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get(addressing_identifier)

Get a directory line.

Retrieve the data from the directory line corresponding to the identifier passed in parameters.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
addressing_identifier = 'addressing_identifier_example' # String | Addressing identifier (SIREN, SIRET or routing code)

begin
  # Get a directory line.
  result = api_instance.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get(addressing_identifier)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get: #{e}"
end
```

#### Using the get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORDirectoryLinePayloadLegalUnitFacilityRoutingCode>, Integer, Hash)> get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier)

```ruby
begin
  # Get a directory line.
  data, status_code, headers = api_instance.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORDirectoryLinePayloadLegalUnitFacilityRoutingCode>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **addressing_identifier** | **String** | Addressing identifier (SIREN, SIRET or routing code) |  |

### Return type

[**AFNORDirectoryLinePayloadLegalUnitFacilityRoutingCode**](AFNORDirectoryLinePayloadLegalUnitFacilityRoutingCode.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get

> <AFNORRoutingCodePayloadHistoryLegalUnitFacility> get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get(siret, routing_identifier)

Get a routing code by SIRET and routing identifier

Retrieve the Routing Code data corresponding to the identifier passed in parameters.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
siret = 'siret_example' # String | 14-digit SIRET number (INSEE establishment identifier)
routing_identifier = 'routing_identifier_example' # String | Routing code identifier

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

> <Array(<AFNORRoutingCodePayloadHistoryLegalUnitFacility>, Integer, Hash)> get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier)

```ruby
begin
  # Get a routing code by SIRET and routing identifier
  data, status_code, headers = api_instance.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier)
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

### Return type

[**AFNORRoutingCodePayloadHistoryLegalUnitFacility**](AFNORRoutingCodePayloadHistoryLegalUnitFacility.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get

> <AFNORLegalUnitPayloadHistory> get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get(siren)

Consult a siren (legal unit) by SIREN number

Returns the details of a company (legal unit) identified by the SIREN number passed as a parameter.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
siren = 'siren_example' # String | 9-digit SIREN number (INSEE company identifier)

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

> <Array(<AFNORLegalUnitPayloadHistory>, Integer, Hash)> get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren)

```ruby
begin
  # Consult a siren (legal unit) by SIREN number
  data, status_code, headers = api_instance.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren)
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

### Return type

[**AFNORLegalUnitPayloadHistory**](AFNORLegalUnitPayloadHistory.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get

> <AFNORFacilityPayloadHistory> get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get(siret)

Gets a siret (facility) by SIRET number

Returns the details of a facility associated to a SIRET.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
siret = 'siret_example' # String | 14-digit SIRET number (INSEE establishment identifier)

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

> <Array(<AFNORFacilityPayloadHistory>, Integer, Hash)> get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret)

```ruby
begin
  # Gets a siret (facility) by SIRET number
  data, status_code, headers = api_instance.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret)
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

### Return type

[**AFNORFacilityPayloadHistory**](AFNORFacilityPayloadHistory.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post

> <AFNORDirectoryLineSearchPost200Response> search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post

Search for a directory line

Search for directory lines that meet all the criteria passed as parameters and return the results in the desired format.

### Examples

```ruby
require 'time'
require 'factpulse'

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

> <Array(<AFNORDirectoryLineSearchPost200Response>, Integer, Hash)> search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info

```ruby
begin
  # Search for a directory line
  data, status_code, headers = api_instance.search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORDirectoryLineSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AFNORDirectoryLineSearchPost200Response**](AFNORDirectoryLineSearchPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post

> <AFNORRoutingCodeSearchPost200Response> search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post

Search for a routing code

Search for routing codes that meet all the criteria passed as parameters and return the routing codes in the desired format.

### Examples

```ruby
require 'time'
require 'factpulse'

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

> <Array(<AFNORRoutingCodeSearchPost200Response>, Integer, Hash)> search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info

```ruby
begin
  # Search for a routing code
  data, status_code, headers = api_instance.search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORRoutingCodeSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AFNORRoutingCodeSearchPost200Response**](AFNORRoutingCodeSearchPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post

> <AFNORSirenSearchPost200Response> search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post

SIREN search (or legal unit)

Multi-criteria company search.

### Examples

```ruby
require 'time'
require 'factpulse'

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

> <Array(<AFNORSirenSearchPost200Response>, Integer, Hash)> search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info

```ruby
begin
  # SIREN search (or legal unit)
  data, status_code, headers = api_instance.search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORSirenSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AFNORSirenSearchPost200Response**](AFNORSirenSearchPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post

> <AFNORSiretSearchPost200Response> search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post

Search for a SIRET (facility)

Multi-criteria search for facilities.

### Examples

```ruby
require 'time'
require 'factpulse'

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

> <Array(<AFNORSiretSearchPost200Response>, Integer, Hash)> search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info

```ruby
begin
  # Search for a SIRET (facility)
  data, status_code, headers = api_instance.search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORSiretSearchPost200Response>
rescue FactPulse::ApiError => e
  puts "Error when calling AFNORPDPPADirectoryServiceApi->search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**AFNORSiretSearchPost200Response**](AFNORSiretSearchPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

