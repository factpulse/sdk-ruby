# OpenapiClient::EReportingApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post**](EReportingApi.md#generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post) | **POST** /api/v1/ereporting/generate-aggregated | Generate aggregated e-reporting XML (PPF-compliant) |
| [**generate_ereporting_api_v1_ereporting_generate_post**](EReportingApi.md#generate_ereporting_api_v1_ereporting_generate_post) | **POST** /api/v1/ereporting/generate | Generate e-reporting XML |
| [**generate_ereporting_download_api_v1_ereporting_generate_download_post**](EReportingApi.md#generate_ereporting_download_api_v1_ereporting_generate_download_post) | **POST** /api/v1/ereporting/generate/download | Generate and download e-reporting XML |
| [**list_category_codes_api_v1_ereporting_category_codes_get**](EReportingApi.md#list_category_codes_api_v1_ereporting_category_codes_get) | **GET** /api/v1/ereporting/category-codes | List PPF-compliant category codes |
| [**list_flow_types_api_v1_ereporting_flow_types_get**](EReportingApi.md#list_flow_types_api_v1_ereporting_flow_types_get) | **GET** /api/v1/ereporting/flow-types | List available flow types |
| [**submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post**](EReportingApi.md#submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post) | **POST** /api/v1/ereporting/submit-aggregated | Submit aggregated e-reporting to PA/PDP |
| [**submit_ereporting_api_v1_ereporting_submit_post**](EReportingApi.md#submit_ereporting_api_v1_ereporting_submit_post) | **POST** /api/v1/ereporting/submit | Submit e-reporting to PA/PDP |
| [**submit_xml_ereporting_api_v1_ereporting_submit_xml_post**](EReportingApi.md#submit_xml_ereporting_api_v1_ereporting_submit_xml_post) | **POST** /api/v1/ereporting/submit-xml | Submit pre-generated e-reporting XML |
| [**validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post**](EReportingApi.md#validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post) | **POST** /api/v1/ereporting/validate-aggregated | Validate aggregated e-reporting data |
| [**validate_ereporting_api_v1_ereporting_validate_post**](EReportingApi.md#validate_ereporting_api_v1_ereporting_validate_post) | **POST** /api/v1/ereporting/validate | Validate e-reporting data |
| [**validate_xml_ereporting_api_v1_ereporting_validate_xml_post**](EReportingApi.md#validate_xml_ereporting_api_v1_ereporting_validate_xml_post) | **POST** /api/v1/ereporting/validate-xml | Validate e-reporting XML against PPF XSD schemas and business rules |


## generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post

> <GenerateAggregatedReportResponse> generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post(create_aggregated_report_request)

Generate aggregated e-reporting XML (PPF-compliant)

Generate a PPF-compliant aggregated e-reporting XML containing multiple flux types in a single file.  This endpoint creates a Report XML that can contain: - **TransactionsReport**: Invoice (10.1) AND/OR Transactions (10.3) - **PaymentsReport**: Invoice payments (10.2) AND/OR Transaction payments (10.4)  The AFNOR FlowType is automatically determined based on content: - Single type → Specific FlowType (e.g., AggregatedCustomerTransactionReport) - Multiple types → MultiFlowReport  **CategoryCode (TT-81)** must use PPF-compliant values: - TLB1: Goods deliveries - TPS1: Service provisions - TNT1: Non-taxed transactions - TMA1: Mixed transactions

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
create_aggregated_report_request = OpenapiClient::CreateAggregatedReportRequest.new({report_id: 'EREPORT-2025-001', sender: OpenapiClient::ReportSender.new({siren: '123456789', name: 'Ma Société SARL'}), period: OpenapiClient::ReportPeriod.new({start_date: Date.parse('2025-01-01'), end_date: Date.parse('2025-01-31')})}) # CreateAggregatedReportRequest | 

begin
  # Generate aggregated e-reporting XML (PPF-compliant)
  result = api_instance.generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post(create_aggregated_report_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post: #{e}"
end
```

#### Using the generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateAggregatedReportResponse>, Integer, Hash)> generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post_with_http_info(create_aggregated_report_request)

```ruby
begin
  # Generate aggregated e-reporting XML (PPF-compliant)
  data, status_code, headers = api_instance.generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post_with_http_info(create_aggregated_report_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateAggregatedReportResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->generate_aggregated_ereporting_api_v1_ereporting_generate_aggregated_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_aggregated_report_request** | [**CreateAggregatedReportRequest**](CreateAggregatedReportRequest.md) |  |  |

### Return type

[**GenerateAggregatedReportResponse**](GenerateAggregatedReportResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_ereporting_api_v1_ereporting_generate_post

> <GenerateEReportingResponse> generate_ereporting_api_v1_ereporting_generate_post(create_e_reporting_request)

Generate e-reporting XML

Generate e-reporting XML (FRR format) from structured data.  Supports all four flow types: - **10.1**: Unitary B2B international transactions (use `invoices` field) - **10.2**: Payments for B2B international invoices (use `invoicePayments` field) - **10.3**: Aggregated B2C transactions (use `transactions` field) - **10.4**: Aggregated B2C payments (use `aggregatedPayments` field)  The generated XML is compliant with DGFIP specifications and ready for submission to a PA (Plateforme Agréée).

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
create_e_reporting_request = OpenapiClient::CreateEReportingRequest.new({report_id: 'EREPORT-2025-001', flow_type: OpenapiClient::EReportingFlowType::N10_1, sender: OpenapiClient::ReportSender.new({siren: '123456789', name: 'Ma Société SARL'}), period: OpenapiClient::ReportPeriod.new({start_date: Date.parse('2025-01-01'), end_date: Date.parse('2025-01-31')})}) # CreateEReportingRequest | 

begin
  # Generate e-reporting XML
  result = api_instance.generate_ereporting_api_v1_ereporting_generate_post(create_e_reporting_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->generate_ereporting_api_v1_ereporting_generate_post: #{e}"
end
```

#### Using the generate_ereporting_api_v1_ereporting_generate_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateEReportingResponse>, Integer, Hash)> generate_ereporting_api_v1_ereporting_generate_post_with_http_info(create_e_reporting_request)

```ruby
begin
  # Generate e-reporting XML
  data, status_code, headers = api_instance.generate_ereporting_api_v1_ereporting_generate_post_with_http_info(create_e_reporting_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateEReportingResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->generate_ereporting_api_v1_ereporting_generate_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_e_reporting_request** | [**CreateEReportingRequest**](CreateEReportingRequest.md) |  |  |

### Return type

[**GenerateEReportingResponse**](GenerateEReportingResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_ereporting_download_api_v1_ereporting_generate_download_post

> generate_ereporting_download_api_v1_ereporting_generate_download_post(create_e_reporting_request, opts)

Generate and download e-reporting XML

Generate e-reporting XML and return as downloadable file.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
create_e_reporting_request = OpenapiClient::CreateEReportingRequest.new({report_id: 'EREPORT-2025-001', flow_type: OpenapiClient::EReportingFlowType::N10_1, sender: OpenapiClient::ReportSender.new({siren: '123456789', name: 'Ma Société SARL'}), period: OpenapiClient::ReportPeriod.new({start_date: Date.parse('2025-01-01'), end_date: Date.parse('2025-01-31')})}) # CreateEReportingRequest | 
opts = {
  filename: 'filename_example' # String | Output filename (default: ereporting_{reportId}.xml)
}

begin
  # Generate and download e-reporting XML
  api_instance.generate_ereporting_download_api_v1_ereporting_generate_download_post(create_e_reporting_request, opts)
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->generate_ereporting_download_api_v1_ereporting_generate_download_post: #{e}"
end
```

#### Using the generate_ereporting_download_api_v1_ereporting_generate_download_post_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> generate_ereporting_download_api_v1_ereporting_generate_download_post_with_http_info(create_e_reporting_request, opts)

```ruby
begin
  # Generate and download e-reporting XML
  data, status_code, headers = api_instance.generate_ereporting_download_api_v1_ereporting_generate_download_post_with_http_info(create_e_reporting_request, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->generate_ereporting_download_api_v1_ereporting_generate_download_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_e_reporting_request** | [**CreateEReportingRequest**](CreateEReportingRequest.md) |  |  |
| **filename** | **String** | Output filename (default: ereporting_{reportId}.xml) | [optional] |

### Return type

nil (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## list_category_codes_api_v1_ereporting_category_codes_get

> Hash&lt;String, Object&gt; list_category_codes_api_v1_ereporting_category_codes_get

List PPF-compliant category codes

Returns the list of valid CategoryCode values (TT-81) for e-reporting transactions.  Source: Annexe 6 - Format sémantique FE e-reporting v1.9

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::EReportingApi.new

begin
  # List PPF-compliant category codes
  result = api_instance.list_category_codes_api_v1_ereporting_category_codes_get
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->list_category_codes_api_v1_ereporting_category_codes_get: #{e}"
end
```

#### Using the list_category_codes_api_v1_ereporting_category_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> list_category_codes_api_v1_ereporting_category_codes_get_with_http_info

```ruby
begin
  # List PPF-compliant category codes
  data, status_code, headers = api_instance.list_category_codes_api_v1_ereporting_category_codes_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->list_category_codes_api_v1_ereporting_category_codes_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_flow_types_api_v1_ereporting_flow_types_get

> Hash&lt;String, Object&gt; list_flow_types_api_v1_ereporting_flow_types_get

List available flow types

Returns the list of supported e-reporting flow types with descriptions.

### Examples

```ruby
require 'time'
require 'openapi_client'

api_instance = OpenapiClient::EReportingApi.new

begin
  # List available flow types
  result = api_instance.list_flow_types_api_v1_ereporting_flow_types_get
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->list_flow_types_api_v1_ereporting_flow_types_get: #{e}"
end
```

#### Using the list_flow_types_api_v1_ereporting_flow_types_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> list_flow_types_api_v1_ereporting_flow_types_get_with_http_info

```ruby
begin
  # List available flow types
  data, status_code, headers = api_instance.list_flow_types_api_v1_ereporting_flow_types_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->list_flow_types_api_v1_ereporting_flow_types_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post

> <SubmitEReportingResponse> submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post(submit_aggregated_report_request)

Submit aggregated e-reporting to PA/PDP

Generate and submit a PPF-compliant aggregated e-reporting to a PA/PDP.  Combines generation and submission in a single call. Automatically determines the AFNOR FlowType based on content.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
submit_aggregated_report_request = OpenapiClient::SubmitAggregatedReportRequest.new({data: OpenapiClient::CreateAggregatedReportRequest.new({report_id: 'EREPORT-2025-001', sender: OpenapiClient::ReportSender.new({siren: '123456789', name: 'Ma Société SARL'}), period: OpenapiClient::ReportPeriod.new({start_date: Date.parse('2025-01-01'), end_date: Date.parse('2025-01-31')})})}) # SubmitAggregatedReportRequest | 

begin
  # Submit aggregated e-reporting to PA/PDP
  result = api_instance.submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post(submit_aggregated_report_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post: #{e}"
end
```

#### Using the submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitEReportingResponse>, Integer, Hash)> submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post_with_http_info(submit_aggregated_report_request)

```ruby
begin
  # Submit aggregated e-reporting to PA/PDP
  data, status_code, headers = api_instance.submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post_with_http_info(submit_aggregated_report_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitEReportingResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->submit_aggregated_ereporting_api_v1_ereporting_submit_aggregated_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_aggregated_report_request** | [**SubmitAggregatedReportRequest**](SubmitAggregatedReportRequest.md) |  |  |

### Return type

[**SubmitEReportingResponse**](SubmitEReportingResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_ereporting_api_v1_ereporting_submit_post

> <SubmitEReportingResponse> submit_ereporting_api_v1_ereporting_submit_post(submit_e_reporting_request)

Submit e-reporting to PA/PDP

Generate and submit e-reporting to a PA (Plateforme Agréée).  Authentication strategies (same as invoices): 1. **JWT with client_uid** (recommended): PDP credentials fetched from backend 2. **Zero-storage**: Provide pdpFlowServiceUrl, pdpClientId, pdpClientSecret in request  The e-reporting is submitted using the AFNOR Flow Service API with syntax=FRR (FRench Reporting).

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
submit_e_reporting_request = OpenapiClient::SubmitEReportingRequest.new({data: OpenapiClient::CreateEReportingRequest.new({report_id: 'EREPORT-2025-001', flow_type: OpenapiClient::EReportingFlowType::N10_1, sender: OpenapiClient::ReportSender.new({siren: '123456789', name: 'Ma Société SARL'}), period: OpenapiClient::ReportPeriod.new({start_date: Date.parse('2025-01-01'), end_date: Date.parse('2025-01-31')})})}) # SubmitEReportingRequest | 

begin
  # Submit e-reporting to PA/PDP
  result = api_instance.submit_ereporting_api_v1_ereporting_submit_post(submit_e_reporting_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->submit_ereporting_api_v1_ereporting_submit_post: #{e}"
end
```

#### Using the submit_ereporting_api_v1_ereporting_submit_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitEReportingResponse>, Integer, Hash)> submit_ereporting_api_v1_ereporting_submit_post_with_http_info(submit_e_reporting_request)

```ruby
begin
  # Submit e-reporting to PA/PDP
  data, status_code, headers = api_instance.submit_ereporting_api_v1_ereporting_submit_post_with_http_info(submit_e_reporting_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitEReportingResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->submit_ereporting_api_v1_ereporting_submit_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_e_reporting_request** | [**SubmitEReportingRequest**](SubmitEReportingRequest.md) |  |  |

### Return type

[**SubmitEReportingResponse**](SubmitEReportingResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_xml_ereporting_api_v1_ereporting_submit_xml_post

> <SubmitEReportingResponse> submit_xml_ereporting_api_v1_ereporting_submit_xml_post(xml_file, opts)

Submit pre-generated e-reporting XML

Submit a pre-generated e-reporting XML file directly to a PA/PDP.  This endpoint is designed for clients who generate their own PPF-compliant XML and only need FactPulse for the PDP submission.  **Process:** 1. Validates the XML against PPF XSD schemas 2. Determines the appropriate AFNOR FlowType 3. Submits to the configured PDP/PA 4. Returns the flowId for tracking  **Authentication:** Same strategies as /submit endpoint (JWT or zero-storage credentials).

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
xml_file = File.new('/path/to/some/file') # File | E-reporting XML file
opts = {
  tracking_id: 'tracking_id_example', # String | 
  skip_validation: true, # Boolean | Skip XSD validation
  pdp_flow_service_url: 'pdp_flow_service_url_example', # String | 
  pdp_token_url: 'pdp_token_url_example', # String | 
  pdp_client_id: 'pdp_client_id_example', # String | 
  pdp_client_secret: 'pdp_client_secret_example' # String | 
}

begin
  # Submit pre-generated e-reporting XML
  result = api_instance.submit_xml_ereporting_api_v1_ereporting_submit_xml_post(xml_file, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->submit_xml_ereporting_api_v1_ereporting_submit_xml_post: #{e}"
end
```

#### Using the submit_xml_ereporting_api_v1_ereporting_submit_xml_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitEReportingResponse>, Integer, Hash)> submit_xml_ereporting_api_v1_ereporting_submit_xml_post_with_http_info(xml_file, opts)

```ruby
begin
  # Submit pre-generated e-reporting XML
  data, status_code, headers = api_instance.submit_xml_ereporting_api_v1_ereporting_submit_xml_post_with_http_info(xml_file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitEReportingResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->submit_xml_ereporting_api_v1_ereporting_submit_xml_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **xml_file** | **File** | E-reporting XML file |  |
| **tracking_id** | **String** |  | [optional] |
| **skip_validation** | **Boolean** | Skip XSD validation | [optional][default to false] |
| **pdp_flow_service_url** | **String** |  | [optional] |
| **pdp_token_url** | **String** |  | [optional] |
| **pdp_client_id** | **String** |  | [optional] |
| **pdp_client_secret** | **String** |  | [optional] |

### Return type

[**SubmitEReportingResponse**](SubmitEReportingResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post

> Hash&lt;String, Object&gt; validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post(create_aggregated_report_request)

Validate aggregated e-reporting data

Validates aggregated e-reporting data without generating XML.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
create_aggregated_report_request = OpenapiClient::CreateAggregatedReportRequest.new({report_id: 'EREPORT-2025-001', sender: OpenapiClient::ReportSender.new({siren: '123456789', name: 'Ma Société SARL'}), period: OpenapiClient::ReportPeriod.new({start_date: Date.parse('2025-01-01'), end_date: Date.parse('2025-01-31')})}) # CreateAggregatedReportRequest | 

begin
  # Validate aggregated e-reporting data
  result = api_instance.validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post(create_aggregated_report_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post: #{e}"
end
```

#### Using the validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post_with_http_info(create_aggregated_report_request)

```ruby
begin
  # Validate aggregated e-reporting data
  data, status_code, headers = api_instance.validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post_with_http_info(create_aggregated_report_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->validate_aggregated_ereporting_api_v1_ereporting_validate_aggregated_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_aggregated_report_request** | [**CreateAggregatedReportRequest**](CreateAggregatedReportRequest.md) |  |  |

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## validate_ereporting_api_v1_ereporting_validate_post

> <ValidateEReportingResponse> validate_ereporting_api_v1_ereporting_validate_post(validate_e_reporting_request)

Validate e-reporting data

Validate e-reporting data without generating or submitting.  Performs: - Schema validation - Business rule validation (correct flux type vs data) - Data consistency checks (tax totals, dates, etc.)  Returns validation errors and warnings.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
validate_e_reporting_request = OpenapiClient::ValidateEReportingRequest.new({data: OpenapiClient::CreateEReportingRequest.new({report_id: 'EREPORT-2025-001', flow_type: OpenapiClient::EReportingFlowType::N10_1, sender: OpenapiClient::ReportSender.new({siren: '123456789', name: 'Ma Société SARL'}), period: OpenapiClient::ReportPeriod.new({start_date: Date.parse('2025-01-01'), end_date: Date.parse('2025-01-31')})})}) # ValidateEReportingRequest | 

begin
  # Validate e-reporting data
  result = api_instance.validate_ereporting_api_v1_ereporting_validate_post(validate_e_reporting_request)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->validate_ereporting_api_v1_ereporting_validate_post: #{e}"
end
```

#### Using the validate_ereporting_api_v1_ereporting_validate_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ValidateEReportingResponse>, Integer, Hash)> validate_ereporting_api_v1_ereporting_validate_post_with_http_info(validate_e_reporting_request)

```ruby
begin
  # Validate e-reporting data
  data, status_code, headers = api_instance.validate_ereporting_api_v1_ereporting_validate_post_with_http_info(validate_e_reporting_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ValidateEReportingResponse>
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->validate_ereporting_api_v1_ereporting_validate_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **validate_e_reporting_request** | [**ValidateEReportingRequest**](ValidateEReportingRequest.md) |  |  |

### Return type

[**ValidateEReportingResponse**](ValidateEReportingResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## validate_xml_ereporting_api_v1_ereporting_validate_xml_post

> Hash&lt;String, Object&gt; validate_xml_ereporting_api_v1_ereporting_validate_xml_post(xml_file, opts)

Validate e-reporting XML against PPF XSD schemas and business rules

Validates an e-reporting XML file against:  1. **XSD schemas**: Official PPF e-reporting XSD (structure, types, cardinality) 2. **Business rules**: ISO codes and enum validation    - Currency codes (ISO 4217: EUR, USD, GBP, etc.)    - Country codes (ISO 3166-1 alpha-2: FR, DE, US, etc.)    - Scheme IDs (0009=SIRET, 0002=SIREN, etc.)    - Role codes (UNCL 3035: SE=Seller, BY=Buyer, WK=Working party, etc.)  Returns validation status and detailed error messages if invalid.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = OpenapiClient::EReportingApi.new
xml_file = File.new('/path/to/some/file') # File | E-reporting XML file to validate
opts = {
  validate_business_rules: true # Boolean | Also validate business rules (ISO codes, enums)
}

begin
  # Validate e-reporting XML against PPF XSD schemas and business rules
  result = api_instance.validate_xml_ereporting_api_v1_ereporting_validate_xml_post(xml_file, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->validate_xml_ereporting_api_v1_ereporting_validate_xml_post: #{e}"
end
```

#### Using the validate_xml_ereporting_api_v1_ereporting_validate_xml_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> validate_xml_ereporting_api_v1_ereporting_validate_xml_post_with_http_info(xml_file, opts)

```ruby
begin
  # Validate e-reporting XML against PPF XSD schemas and business rules
  data, status_code, headers = api_instance.validate_xml_ereporting_api_v1_ereporting_validate_xml_post_with_http_info(xml_file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue OpenapiClient::ApiError => e
  puts "Error when calling EReportingApi->validate_xml_ereporting_api_v1_ereporting_validate_xml_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **xml_file** | **File** | E-reporting XML file to validate |  |
| **validate_business_rules** | **Boolean** | Also validate business rules (ISO codes, enums) | [optional][default to true] |

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

