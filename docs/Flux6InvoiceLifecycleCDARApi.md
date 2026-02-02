# FactPulse::Flux6InvoiceLifecycleCDARApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**generate_cdar_api_v1_cdar_generate_post**](Flux6InvoiceLifecycleCDARApi.md#generate_cdar_api_v1_cdar_generate_post) | **POST** /api/v1/cdar/generate | Generate a CDAR message |
| [**get_action_codes_api_v1_cdar_action_codes_get**](Flux6InvoiceLifecycleCDARApi.md#get_action_codes_api_v1_cdar_action_codes_get) | **GET** /api/v1/cdar/action-codes | List of CDAR action codes |
| [**get_reason_codes_api_v1_cdar_reason_codes_get**](Flux6InvoiceLifecycleCDARApi.md#get_reason_codes_api_v1_cdar_reason_codes_get) | **GET** /api/v1/cdar/reason-codes | List of CDAR reason codes |
| [**get_status_codes_api_v1_cdar_status_codes_get**](Flux6InvoiceLifecycleCDARApi.md#get_status_codes_api_v1_cdar_status_codes_get) | **GET** /api/v1/cdar/status-codes | List of CDAR status codes |
| [**submit_cdar_api_v1_cdar_submit_post**](Flux6InvoiceLifecycleCDARApi.md#submit_cdar_api_v1_cdar_submit_post) | **POST** /api/v1/cdar/submit | Generate and submit a CDAR message |
| [**submit_cdar_xml_api_v1_cdar_submit_xml_post**](Flux6InvoiceLifecycleCDARApi.md#submit_cdar_xml_api_v1_cdar_submit_xml_post) | **POST** /api/v1/cdar/submit-xml | Submit a pre-generated CDAR XML |
| [**submit_encaissee_api_v1_cdar_encaissee_post**](Flux6InvoiceLifecycleCDARApi.md#submit_encaissee_api_v1_cdar_encaissee_post) | **POST** /api/v1/cdar/encaissee | [Simplified] Submit PAID status (212) - Issued invoice |
| [**submit_refusee_api_v1_cdar_refusee_post**](Flux6InvoiceLifecycleCDARApi.md#submit_refusee_api_v1_cdar_refusee_post) | **POST** /api/v1/cdar/refusee | [Simplified] Submit REFUSED status (210) - Received invoice |
| [**validate_cdar_api_v1_cdar_validate_post**](Flux6InvoiceLifecycleCDARApi.md#validate_cdar_api_v1_cdar_validate_post) | **POST** /api/v1/cdar/validate | Validate CDAR structured data |
| [**validate_xml_cdar_api_v1_cdar_validate_xml_post**](Flux6InvoiceLifecycleCDARApi.md#validate_xml_cdar_api_v1_cdar_validate_xml_post) | **POST** /api/v1/cdar/validate-xml | Validate CDAR XML against XSD and Schematron BR-FR-CDV |


## generate_cdar_api_v1_cdar_generate_post

> <GenerateCDARResponse> generate_cdar_api_v1_cdar_generate_post(create_cdar_request)

Generate a CDAR message

Generate a CDAR XML message (Cross Domain Acknowledgement and Response) to communicate the status of an invoice.  **Message types:** - **23** (Processing): Standard lifecycle message - **305** (Transmission): Inter-platform transmission message  **Business rules:** - BR-FR-CDV-14: Status 212 (PAID) requires a paid amount - BR-FR-CDV-15: Statuses 206/207/208/210/213/501 require a reason code

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

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new
create_cdar_request = FactPulse::CreateCDARRequest.new({document_id: 'document_id_example', sender_siren: 'sender_siren_example', invoice_id: 'invoice_id_example', invoice_issue_date: Date.today, status: 'status_example'}) # CreateCDARRequest | 

begin
  # Generate a CDAR message
  result = api_instance.generate_cdar_api_v1_cdar_generate_post(create_cdar_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->generate_cdar_api_v1_cdar_generate_post: #{e}"
end
```

#### Using the generate_cdar_api_v1_cdar_generate_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateCDARResponse>, Integer, Hash)> generate_cdar_api_v1_cdar_generate_post_with_http_info(create_cdar_request)

```ruby
begin
  # Generate a CDAR message
  data, status_code, headers = api_instance.generate_cdar_api_v1_cdar_generate_post_with_http_info(create_cdar_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->generate_cdar_api_v1_cdar_generate_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_cdar_request** | [**CreateCDARRequest**](CreateCDARRequest.md) |  |  |

### Return type

[**GenerateCDARResponse**](GenerateCDARResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_action_codes_api_v1_cdar_action_codes_get

> <ActionCodesResponse> get_action_codes_api_v1_cdar_action_codes_get

List of CDAR action codes

Returns the complete list of action codes (BR-FR-CDV-CL-10).  These codes indicate the requested action on the invoice.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new

begin
  # List of CDAR action codes
  result = api_instance.get_action_codes_api_v1_cdar_action_codes_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->get_action_codes_api_v1_cdar_action_codes_get: #{e}"
end
```

#### Using the get_action_codes_api_v1_cdar_action_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ActionCodesResponse>, Integer, Hash)> get_action_codes_api_v1_cdar_action_codes_get_with_http_info

```ruby
begin
  # List of CDAR action codes
  data, status_code, headers = api_instance.get_action_codes_api_v1_cdar_action_codes_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ActionCodesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->get_action_codes_api_v1_cdar_action_codes_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ActionCodesResponse**](ActionCodesResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_reason_codes_api_v1_cdar_reason_codes_get

> <ReasonCodesResponse> get_reason_codes_api_v1_cdar_reason_codes_get

List of CDAR reason codes

Returns the complete list of status reason codes (BR-FR-CDV-CL-09).  These codes explain the reason for a particular status.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new

begin
  # List of CDAR reason codes
  result = api_instance.get_reason_codes_api_v1_cdar_reason_codes_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->get_reason_codes_api_v1_cdar_reason_codes_get: #{e}"
end
```

#### Using the get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReasonCodesResponse>, Integer, Hash)> get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info

```ruby
begin
  # List of CDAR reason codes
  data, status_code, headers = api_instance.get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReasonCodesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ReasonCodesResponse**](ReasonCodesResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_status_codes_api_v1_cdar_status_codes_get

> <StatusCodesResponse> get_status_codes_api_v1_cdar_status_codes_get

List of CDAR status codes

Returns the complete list of invoice status codes (BR-FR-CDV-CL-06).  These codes indicate the lifecycle state of an invoice.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new

begin
  # List of CDAR status codes
  result = api_instance.get_status_codes_api_v1_cdar_status_codes_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->get_status_codes_api_v1_cdar_status_codes_get: #{e}"
end
```

#### Using the get_status_codes_api_v1_cdar_status_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StatusCodesResponse>, Integer, Hash)> get_status_codes_api_v1_cdar_status_codes_get_with_http_info

```ruby
begin
  # List of CDAR status codes
  data, status_code, headers = api_instance.get_status_codes_api_v1_cdar_status_codes_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StatusCodesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->get_status_codes_api_v1_cdar_status_codes_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**StatusCodesResponse**](StatusCodesResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## submit_cdar_api_v1_cdar_submit_post

> <SubmitCDARResponse> submit_cdar_api_v1_cdar_submit_post(submit_cdar_request)

Generate and submit a CDAR message

Generate a CDAR message and submit it to the PA/PDP platform.  **Authentication strategies:** 1. **JWT with client_uid** (recommended): PDP credentials retrieved from backend 2. **Zero-storage**: Provide pdpFlowServiceUrl, pdpClientId, pdpClientSecret in the request  **Flow types (flowType):** - `CustomerInvoiceLC`: Client-side lifecycle (buyer) - `SupplierInvoiceLC`: Supplier-side lifecycle (seller)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new
submit_cdar_request = FactPulse::SubmitCDARRequest.new({document_id: 'document_id_example', sender_siren: 'sender_siren_example', invoice_id: 'invoice_id_example', invoice_issue_date: Date.today, status: 'status_example'}) # SubmitCDARRequest | 

begin
  # Generate and submit a CDAR message
  result = api_instance.submit_cdar_api_v1_cdar_submit_post(submit_cdar_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_cdar_api_v1_cdar_submit_post: #{e}"
end
```

#### Using the submit_cdar_api_v1_cdar_submit_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitCDARResponse>, Integer, Hash)> submit_cdar_api_v1_cdar_submit_post_with_http_info(submit_cdar_request)

```ruby
begin
  # Generate and submit a CDAR message
  data, status_code, headers = api_instance.submit_cdar_api_v1_cdar_submit_post_with_http_info(submit_cdar_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_cdar_api_v1_cdar_submit_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_cdar_request** | [**SubmitCDARRequest**](SubmitCDARRequest.md) |  |  |

### Return type

[**SubmitCDARResponse**](SubmitCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_cdar_xml_api_v1_cdar_submit_xml_post

> <SubmitCDARResponse> submit_cdar_xml_api_v1_cdar_submit_xml_post(submit_cdarxml_request)

Submit a pre-generated CDAR XML

Submit a pre-generated CDAR XML message to the PA/PDP platform.  Useful for submitting XML generated by other systems.  **Validation:** The XML is validated against XSD and Schematron BR-FR-CDV rules BEFORE submission. Invalid XML will be rejected with detailed error messages.  **Authentication strategies:** 1. **JWT with client_uid** (recommended): PDP credentials retrieved from backend 2. **Zero-storage**: Provide pdpFlowServiceUrl, pdpClientId, pdpClientSecret in the request

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new
submit_cdarxml_request = FactPulse::SubmitCDARXMLRequest.new({xml: 'xml_example'}) # SubmitCDARXMLRequest | 

begin
  # Submit a pre-generated CDAR XML
  result = api_instance.submit_cdar_xml_api_v1_cdar_submit_xml_post(submit_cdarxml_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_cdar_xml_api_v1_cdar_submit_xml_post: #{e}"
end
```

#### Using the submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitCDARResponse>, Integer, Hash)> submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info(submit_cdarxml_request)

```ruby
begin
  # Submit a pre-generated CDAR XML
  data, status_code, headers = api_instance.submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info(submit_cdarxml_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_cdarxml_request** | [**SubmitCDARXMLRequest**](SubmitCDARXMLRequest.md) |  |  |

### Return type

[**SubmitCDARResponse**](SubmitCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_encaissee_api_v1_cdar_encaissee_post

> <SimplifiedCDARResponse> submit_encaissee_api_v1_cdar_encaissee_post(encaissee_request)

[Simplified] Submit PAID status (212) - Issued invoice

**Simplified endpoint for OD** - Submit a PAID status (212) for an **ISSUED** invoice.  This status is **mandatory for PPF** (BR-FR-CDV-14 requires the paid amount).  **Use case:** The **seller** confirms payment receipt for an invoice they issued.  **Who issues this status?** - **Issuer (IssuerTradeParty):** The seller (SE = Seller) who received payment - **Recipient (RecipientTradeParty):** The buyer (BY = Buyer) who paid  **Reference:** XP Z12-014 Annex B, example UC1_F202500003_07-CDV-212_Encaissee.xml  **Authentication:** JWT Bearer (recommended) or PDP credentials in request.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new
encaissee_request = FactPulse::EncaisseeRequest.new({invoice_id: 'invoice_id_example', invoice_issue_date: Date.today, invoice_buyer_siren: 'invoice_buyer_siren_example', invoice_buyer_electronic_address: 'invoice_buyer_electronic_address_example', amount: FactPulse::Amount.new}) # EncaisseeRequest | 

begin
  # [Simplified] Submit PAID status (212) - Issued invoice
  result = api_instance.submit_encaissee_api_v1_cdar_encaissee_post(encaissee_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_encaissee_api_v1_cdar_encaissee_post: #{e}"
end
```

#### Using the submit_encaissee_api_v1_cdar_encaissee_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SimplifiedCDARResponse>, Integer, Hash)> submit_encaissee_api_v1_cdar_encaissee_post_with_http_info(encaissee_request)

```ruby
begin
  # [Simplified] Submit PAID status (212) - Issued invoice
  data, status_code, headers = api_instance.submit_encaissee_api_v1_cdar_encaissee_post_with_http_info(encaissee_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SimplifiedCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_encaissee_api_v1_cdar_encaissee_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **encaissee_request** | [**EncaisseeRequest**](EncaisseeRequest.md) |  |  |

### Return type

[**SimplifiedCDARResponse**](SimplifiedCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_refusee_api_v1_cdar_refusee_post

> <SimplifiedCDARResponse> submit_refusee_api_v1_cdar_refusee_post(refusee_request)

[Simplified] Submit REFUSED status (210) - Received invoice

**Simplified endpoint for OD** - Submit a REFUSED status (210) for a **RECEIVED** invoice.  This status is **mandatory for PPF** (BR-FR-CDV-15 requires a reason code).  **Use case:** The **buyer** refuses an invoice they received.  **Who issues this status?** - **Issuer (IssuerTradeParty):** The buyer (BY = Buyer) refusing the invoice - **Recipient (RecipientTradeParty):** The seller (SE = Seller) who issued the invoice  **Reference:** XP Z12-014 Annex B, example UC3_F202500005_04-CDV-210_Refusee.xml  **Allowed reason codes (BR-FR-CDV-CL-09):** - `TX_TVA_ERR`: Incorrect VAT rate - `MONTANTTOTAL_ERR`: Incorrect total amount - `CALCUL_ERR`: Calculation error - `NON_CONFORME`: Non-compliant - `DOUBLON`: Duplicate - `DEST_ERR`: Wrong recipient - `TRANSAC_INC`: Incomplete transaction - `EMMET_INC`: Unknown issuer - `CONTRAT_TERM`: Contract terminated - `DOUBLE_FACT`: Double billing - `CMD_ERR`: Order error - `ADR_ERR`: Address error - `REF_CT_ABSENT`: Missing contract reference  **Authentication:** JWT Bearer (recommended) or PDP credentials in request.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new
refusee_request = FactPulse::RefuseeRequest.new({invoice_id: 'invoice_id_example', invoice_issue_date: Date.today, invoice_seller_siren: 'invoice_seller_siren_example', invoice_seller_electronic_address: 'invoice_seller_electronic_address_example', reason_code: 'reason_code_example'}) # RefuseeRequest | 

begin
  # [Simplified] Submit REFUSED status (210) - Received invoice
  result = api_instance.submit_refusee_api_v1_cdar_refusee_post(refusee_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_refusee_api_v1_cdar_refusee_post: #{e}"
end
```

#### Using the submit_refusee_api_v1_cdar_refusee_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SimplifiedCDARResponse>, Integer, Hash)> submit_refusee_api_v1_cdar_refusee_post_with_http_info(refusee_request)

```ruby
begin
  # [Simplified] Submit REFUSED status (210) - Received invoice
  data, status_code, headers = api_instance.submit_refusee_api_v1_cdar_refusee_post_with_http_info(refusee_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SimplifiedCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->submit_refusee_api_v1_cdar_refusee_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **refusee_request** | [**RefuseeRequest**](RefuseeRequest.md) |  |  |

### Return type

[**SimplifiedCDARResponse**](SimplifiedCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## validate_cdar_api_v1_cdar_validate_post

> <ValidateCDARResponse> validate_cdar_api_v1_cdar_validate_post(validate_cdar_request)

Validate CDAR structured data

Validate CDAR structured data without generating XML.  **Note:** This endpoint validates structured data fields only. Use `/validate-xml` to validate a pre-generated CDAR XML file against XSD and Schematron.  Checks: - Field formats (SIREN, dates, etc.) - Enum codes (status, reason, action) - Business rules BR-FR-CDV-*

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

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new
validate_cdar_request = FactPulse::ValidateCDARRequest.new # ValidateCDARRequest | 

begin
  # Validate CDAR structured data
  result = api_instance.validate_cdar_api_v1_cdar_validate_post(validate_cdar_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->validate_cdar_api_v1_cdar_validate_post: #{e}"
end
```

#### Using the validate_cdar_api_v1_cdar_validate_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ValidateCDARResponse>, Integer, Hash)> validate_cdar_api_v1_cdar_validate_post_with_http_info(validate_cdar_request)

```ruby
begin
  # Validate CDAR structured data
  data, status_code, headers = api_instance.validate_cdar_api_v1_cdar_validate_post_with_http_info(validate_cdar_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ValidateCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->validate_cdar_api_v1_cdar_validate_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **validate_cdar_request** | [**ValidateCDARRequest**](ValidateCDARRequest.md) |  |  |

### Return type

[**ValidateCDARResponse**](ValidateCDARResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## validate_xml_cdar_api_v1_cdar_validate_xml_post

> Hash&lt;String, Object&gt; validate_xml_cdar_api_v1_cdar_validate_xml_post(xml_file)

Validate CDAR XML against XSD and Schematron BR-FR-CDV

Validates a CDAR XML file against:  1. **XSD schema**: UN/CEFACT D22B CrossDomainAcknowledgementAndResponse 2. **Schematron BR-FR-CDV**: French business rules for invoice lifecycle  Returns validation status and detailed error messages if invalid.  **Note:** Use `/validate` to validate structured data fields (JSON).

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

api_instance = FactPulse::Flux6InvoiceLifecycleCDARApi.new
xml_file = File.new('/path/to/some/file') # File | CDAR XML file to validate

begin
  # Validate CDAR XML against XSD and Schematron BR-FR-CDV
  result = api_instance.validate_xml_cdar_api_v1_cdar_validate_xml_post(xml_file)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->validate_xml_cdar_api_v1_cdar_validate_xml_post: #{e}"
end
```

#### Using the validate_xml_cdar_api_v1_cdar_validate_xml_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Hash&lt;String, Object&gt;, Integer, Hash)> validate_xml_cdar_api_v1_cdar_validate_xml_post_with_http_info(xml_file)

```ruby
begin
  # Validate CDAR XML against XSD and Schematron BR-FR-CDV
  data, status_code, headers = api_instance.validate_xml_cdar_api_v1_cdar_validate_xml_post_with_http_info(xml_file)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Hash&lt;String, Object&gt;
rescue FactPulse::ApiError => e
  puts "Error when calling Flux6InvoiceLifecycleCDARApi->validate_xml_cdar_api_v1_cdar_validate_xml_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **xml_file** | **File** | CDAR XML file to validate |  |

### Return type

**Hash&lt;String, Object&gt;**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

