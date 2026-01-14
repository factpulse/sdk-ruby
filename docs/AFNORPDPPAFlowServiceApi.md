# OpenapiClient::AFNORPDPPAFlowServiceApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get**](AFNORPDPPAFlowServiceApi.md#download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get) | **GET** /api/v1/afnor/flow/v1/flows/{flowId} | Download a flow |
| [**flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get**](AFNORPDPPAFlowServiceApi.md#flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get) | **GET** /api/v1/afnor/flow/v1/healthcheck | Healthcheck Flow Service |
| [**search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post**](AFNORPDPPAFlowServiceApi.md#search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post) | **POST** /api/v1/afnor/flow/v1/flows/search | Search flows |
| [**submit_flow_proxy_api_v1_afnor_flow_v1_flows_post**](AFNORPDPPAFlowServiceApi.md#submit_flow_proxy_api_v1_afnor_flow_v1_flows_post) | **POST** /api/v1/afnor/flow/v1/flows | Submit an invoicing flow |


## download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get

> <AFNORFlow> download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get(flow_id, opts)

Download a flow

Download a file related to a given flow (AFNOR XP Z12-013 compliant): - Metadata [Default]: provides the flow metadata as JSON - Original: the document initially sent by the emitter - Converted: the document optionally converted by the system - ReadableView: the document optionally generated as readable file

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AFNORPDPPAFlowServiceApi.new
flow_id = 'flow_id_example' # String | AFNOR flow identifier (UUID)
opts = {
  doc_type: OpenapiClient::DocType::METADATA # DocType | Type of file to download: Metadata (default, JSON), Original, Converted, or ReadableView
}

begin
  # Download a flow
  result = api_instance.download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get(flow_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get: #{e}"
end
```

#### Using the download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORFlow>, Integer, Hash)> download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info(flow_id, opts)

```ruby
begin
  # Download a flow
  data, status_code, headers = api_instance.download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info(flow_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORFlow>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->download_flow_proxy_api_v1_afnor_flow_v1_flows_flow_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | AFNOR flow identifier (UUID) |  |
| **doc_type** | [**DocType**](.md) | Type of file to download: Metadata (default, JSON), Original, Converted, or ReadableView | [optional] |

### Return type

[**AFNORFlow**](AFNORFlow.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/pdf, application/xml


## flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get

> Object flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get

Healthcheck Flow Service

Check Flow Service availability (AFNOR XP Z12-013 compliant)

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AFNORPDPPAFlowServiceApi.new

begin
  # Healthcheck Flow Service
  result = api_instance.flow_healthcheck_proxy_api_v1_afnor_flow_v1_healthcheck_get
  p result
rescue OpenapiClient::ApiError => e
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
rescue OpenapiClient::ApiError => e
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

> <AFNORSearchFlowContent> search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post(afnor_search_flow_params)

Search flows

Search invoicing flows by criteria (AFNOR XP Z12-013 compliant)

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AFNORPDPPAFlowServiceApi.new
afnor_search_flow_params = OpenapiClient::AFNORSearchFlowParams.new({where: OpenapiClient::AFNORSearchFlowFilters.new}) # AFNORSearchFlowParams | 

begin
  # Search flows
  result = api_instance.search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post(afnor_search_flow_params)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post: #{e}"
end
```

#### Using the search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AFNORSearchFlowContent>, Integer, Hash)> search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info(afnor_search_flow_params)

```ruby
begin
  # Search flows
  data, status_code, headers = api_instance.search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info(afnor_search_flow_params)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AFNORSearchFlowContent>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->search_flows_proxy_api_v1_afnor_flow_v1_flows_search_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **afnor_search_flow_params** | [**AFNORSearchFlowParams**](AFNORSearchFlowParams.md) |  |  |

### Return type

[**AFNORSearchFlowContent**](AFNORSearchFlowContent.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_flow_proxy_api_v1_afnor_flow_v1_flows_post

> Object submit_flow_proxy_api_v1_afnor_flow_v1_flows_post(flow_info, file)

Submit an invoicing flow

Submits an electronic invoice to a Partner Dematerialization Platform (PDP) in compliance with the AFNOR XP Z12-013 standard

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::AFNORPDPPAFlowServiceApi.new
flow_info = OpenapiClient::AFNORFlowInfo.new({flow_syntax: OpenapiClient::AFNORFlowSyntax::CII}) # AFNORFlowInfo | 
file = File.new('/path/to/some/file') # File | Flow file (PDF/A-3 with embedded XML or XML)

begin
  # Submit an invoicing flow
  result = api_instance.submit_flow_proxy_api_v1_afnor_flow_v1_flows_post(flow_info, file)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->submit_flow_proxy_api_v1_afnor_flow_v1_flows_post: #{e}"
end
```

#### Using the submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info(flow_info, file)

```ruby
begin
  # Submit an invoicing flow
  data, status_code, headers = api_instance.submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info(flow_info, file)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue OpenapiClient::ApiError => e
  puts "Error when calling AFNORPDPPAFlowServiceApi->submit_flow_proxy_api_v1_afnor_flow_v1_flows_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_info** | [**AFNORFlowInfo**](AFNORFlowInfo.md) |  |  |
| **file** | **File** | Flow file (PDF/A-3 with embedded XML or XML) |  |

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

