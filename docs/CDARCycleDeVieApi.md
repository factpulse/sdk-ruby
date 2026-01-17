# FactPulse::CDARCycleDeVieApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**generate_cdar_api_v1_cdar_generate_post**](CDARCycleDeVieApi.md#generate_cdar_api_v1_cdar_generate_post) | **POST** /api/v1/cdar/generate | Générer un message CDAR |
| [**get_action_codes_api_v1_cdar_action_codes_get**](CDARCycleDeVieApi.md#get_action_codes_api_v1_cdar_action_codes_get) | **GET** /api/v1/cdar/action-codes | Liste des codes action CDAR |
| [**get_reason_codes_api_v1_cdar_reason_codes_get**](CDARCycleDeVieApi.md#get_reason_codes_api_v1_cdar_reason_codes_get) | **GET** /api/v1/cdar/reason-codes | Liste des codes motif CDAR |
| [**get_status_codes_api_v1_cdar_status_codes_get**](CDARCycleDeVieApi.md#get_status_codes_api_v1_cdar_status_codes_get) | **GET** /api/v1/cdar/status-codes | Liste des codes statut CDAR |
| [**submit_cdar_api_v1_cdar_submit_post**](CDARCycleDeVieApi.md#submit_cdar_api_v1_cdar_submit_post) | **POST** /api/v1/cdar/submit | Générer et soumettre un message CDAR |
| [**submit_cdar_xml_api_v1_cdar_submit_xml_post**](CDARCycleDeVieApi.md#submit_cdar_xml_api_v1_cdar_submit_xml_post) | **POST** /api/v1/cdar/submit-xml | Soumettre un XML CDAR pré-généré |
| [**validate_cdar_api_v1_cdar_validate_post**](CDARCycleDeVieApi.md#validate_cdar_api_v1_cdar_validate_post) | **POST** /api/v1/cdar/validate | Valider des données CDAR |


## generate_cdar_api_v1_cdar_generate_post

> <GenerateCDARResponse> generate_cdar_api_v1_cdar_generate_post(create_cdar_request)

Générer un message CDAR

Génère un message XML CDAR (Cross Domain Acknowledgement and Response) pour communiquer le statut d'une facture.  **Types de messages:** - **23** (Traitement): Message de cycle de vie standard - **305** (Transmission): Message de transmission entre plateformes  **Règles métier:** - BR-FR-CDV-14: Le statut 212 (ENCAISSEE) requiert un montant encaissé - BR-FR-CDV-15: Les statuts 206/207/208/210/213/501 requièrent un code motif

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::CDARCycleDeVieApi.new
create_cdar_request = FactPulse::CreateCDARRequest.new({document_id: 'document_id_example', sender_siren: 'sender_siren_example', invoice_id: 'invoice_id_example', invoice_issue_date: Date.today, status: 'status_example'}) # CreateCDARRequest | 

begin
  # Générer un message CDAR
  result = api_instance.generate_cdar_api_v1_cdar_generate_post(create_cdar_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->generate_cdar_api_v1_cdar_generate_post: #{e}"
end
```

#### Using the generate_cdar_api_v1_cdar_generate_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateCDARResponse>, Integer, Hash)> generate_cdar_api_v1_cdar_generate_post_with_http_info(create_cdar_request)

```ruby
begin
  # Générer un message CDAR
  data, status_code, headers = api_instance.generate_cdar_api_v1_cdar_generate_post_with_http_info(create_cdar_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->generate_cdar_api_v1_cdar_generate_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_cdar_request** | [**CreateCDARRequest**](CreateCDARRequest.md) |  |  |

### Return type

[**GenerateCDARResponse**](GenerateCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_action_codes_api_v1_cdar_action_codes_get

> <ActionCodesResponse> get_action_codes_api_v1_cdar_action_codes_get

Liste des codes action CDAR

Retourne la liste complète des codes action (BR-FR-CDV-CL-10).  Ces codes indiquent l'action demandée sur la facture.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::CDARCycleDeVieApi.new

begin
  # Liste des codes action CDAR
  result = api_instance.get_action_codes_api_v1_cdar_action_codes_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->get_action_codes_api_v1_cdar_action_codes_get: #{e}"
end
```

#### Using the get_action_codes_api_v1_cdar_action_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ActionCodesResponse>, Integer, Hash)> get_action_codes_api_v1_cdar_action_codes_get_with_http_info

```ruby
begin
  # Liste des codes action CDAR
  data, status_code, headers = api_instance.get_action_codes_api_v1_cdar_action_codes_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ActionCodesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->get_action_codes_api_v1_cdar_action_codes_get_with_http_info: #{e}"
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

Liste des codes motif CDAR

Retourne la liste complète des codes motif de statut (BR-FR-CDV-CL-09).  Ces codes expliquent la raison d'un statut particulier.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::CDARCycleDeVieApi.new

begin
  # Liste des codes motif CDAR
  result = api_instance.get_reason_codes_api_v1_cdar_reason_codes_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->get_reason_codes_api_v1_cdar_reason_codes_get: #{e}"
end
```

#### Using the get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReasonCodesResponse>, Integer, Hash)> get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info

```ruby
begin
  # Liste des codes motif CDAR
  data, status_code, headers = api_instance.get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReasonCodesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->get_reason_codes_api_v1_cdar_reason_codes_get_with_http_info: #{e}"
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

Liste des codes statut CDAR

Retourne la liste complète des codes statut de facture (BR-FR-CDV-CL-06).  Ces codes indiquent l'état du cycle de vie d'une facture.

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::CDARCycleDeVieApi.new

begin
  # Liste des codes statut CDAR
  result = api_instance.get_status_codes_api_v1_cdar_status_codes_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->get_status_codes_api_v1_cdar_status_codes_get: #{e}"
end
```

#### Using the get_status_codes_api_v1_cdar_status_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<StatusCodesResponse>, Integer, Hash)> get_status_codes_api_v1_cdar_status_codes_get_with_http_info

```ruby
begin
  # Liste des codes statut CDAR
  data, status_code, headers = api_instance.get_status_codes_api_v1_cdar_status_codes_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <StatusCodesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->get_status_codes_api_v1_cdar_status_codes_get_with_http_info: #{e}"
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

> <SubmitCDARResponse> submit_cdar_api_v1_cdar_submit_post(user_id, body_submit_cdar_api_v1_cdar_submit_post, opts)

Générer et soumettre un message CDAR

Génère un message CDAR et le soumet à la plateforme PA/PDP.  Nécessite une authentification AFNOR valide.  **Types de flux (flowType):** - `CustomerInvoiceLC`: Cycle de vie côté client (acheteur) - `SupplierInvoiceLC`: Cycle de vie côté fournisseur (vendeur)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::CDARCycleDeVieApi.new
user_id = 56 # Integer | 
body_submit_cdar_api_v1_cdar_submit_post = FactPulse::BodySubmitCdarApiV1CdarSubmitPost.new({request: FactPulse::SubmitCDARRequest.new({document_id: 'document_id_example', sender_siren: 'sender_siren_example', invoice_id: 'invoice_id_example', invoice_issue_date: Date.today, status: 'status_example'})}) # BodySubmitCdarApiV1CdarSubmitPost | 
opts = {
  jwt_token: 'jwt_token_example', # String | 
  client_uid: 'client_uid_example' # String | 
}

begin
  # Générer et soumettre un message CDAR
  result = api_instance.submit_cdar_api_v1_cdar_submit_post(user_id, body_submit_cdar_api_v1_cdar_submit_post, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->submit_cdar_api_v1_cdar_submit_post: #{e}"
end
```

#### Using the submit_cdar_api_v1_cdar_submit_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitCDARResponse>, Integer, Hash)> submit_cdar_api_v1_cdar_submit_post_with_http_info(user_id, body_submit_cdar_api_v1_cdar_submit_post, opts)

```ruby
begin
  # Générer et soumettre un message CDAR
  data, status_code, headers = api_instance.submit_cdar_api_v1_cdar_submit_post_with_http_info(user_id, body_submit_cdar_api_v1_cdar_submit_post, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->submit_cdar_api_v1_cdar_submit_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **Integer** |  |  |
| **body_submit_cdar_api_v1_cdar_submit_post** | [**BodySubmitCdarApiV1CdarSubmitPost**](BodySubmitCdarApiV1CdarSubmitPost.md) |  |  |
| **jwt_token** | **String** |  | [optional] |
| **client_uid** | **String** |  | [optional] |

### Return type

[**SubmitCDARResponse**](SubmitCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## submit_cdar_xml_api_v1_cdar_submit_xml_post

> <SubmitCDARResponse> submit_cdar_xml_api_v1_cdar_submit_xml_post(user_id, body_submit_cdar_xml_api_v1_cdar_submit_xml_post, opts)

Soumettre un XML CDAR pré-généré

Soumet un message XML CDAR pré-généré à la plateforme PA/PDP.  Utile pour soumettre des XML générés par d'autres systèmes.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::CDARCycleDeVieApi.new
user_id = 56 # Integer | 
body_submit_cdar_xml_api_v1_cdar_submit_xml_post = FactPulse::BodySubmitCdarXmlApiV1CdarSubmitXmlPost.new({request: FactPulse::SubmitCDARXMLRequest.new({xml: 'xml_example'})}) # BodySubmitCdarXmlApiV1CdarSubmitXmlPost | 
opts = {
  jwt_token: 'jwt_token_example', # String | 
  client_uid: 'client_uid_example' # String | 
}

begin
  # Soumettre un XML CDAR pré-généré
  result = api_instance.submit_cdar_xml_api_v1_cdar_submit_xml_post(user_id, body_submit_cdar_xml_api_v1_cdar_submit_xml_post, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->submit_cdar_xml_api_v1_cdar_submit_xml_post: #{e}"
end
```

#### Using the submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitCDARResponse>, Integer, Hash)> submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info(user_id, body_submit_cdar_xml_api_v1_cdar_submit_xml_post, opts)

```ruby
begin
  # Soumettre un XML CDAR pré-généré
  data, status_code, headers = api_instance.submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info(user_id, body_submit_cdar_xml_api_v1_cdar_submit_xml_post, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->submit_cdar_xml_api_v1_cdar_submit_xml_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **Integer** |  |  |
| **body_submit_cdar_xml_api_v1_cdar_submit_xml_post** | [**BodySubmitCdarXmlApiV1CdarSubmitXmlPost**](BodySubmitCdarXmlApiV1CdarSubmitXmlPost.md) |  |  |
| **jwt_token** | **String** |  | [optional] |
| **client_uid** | **String** |  | [optional] |

### Return type

[**SubmitCDARResponse**](SubmitCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## validate_cdar_api_v1_cdar_validate_post

> <ValidateCDARResponse> validate_cdar_api_v1_cdar_validate_post(validate_cdar_request)

Valider des données CDAR

Valide les données CDAR sans générer le XML.  Vérifie: - Les formats des champs (SIREN, dates, etc.) - Les codes enums (statut, motif, action) - Les règles métier BR-FR-CDV-*

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::CDARCycleDeVieApi.new
validate_cdar_request = FactPulse::ValidateCDARRequest.new # ValidateCDARRequest | 

begin
  # Valider des données CDAR
  result = api_instance.validate_cdar_api_v1_cdar_validate_post(validate_cdar_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->validate_cdar_api_v1_cdar_validate_post: #{e}"
end
```

#### Using the validate_cdar_api_v1_cdar_validate_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ValidateCDARResponse>, Integer, Hash)> validate_cdar_api_v1_cdar_validate_post_with_http_info(validate_cdar_request)

```ruby
begin
  # Valider des données CDAR
  data, status_code, headers = api_instance.validate_cdar_api_v1_cdar_validate_post_with_http_info(validate_cdar_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ValidateCDARResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling CDARCycleDeVieApi->validate_cdar_api_v1_cdar_validate_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **validate_cdar_request** | [**ValidateCDARRequest**](ValidateCDARRequest.md) |  |  |

### Return type

[**ValidateCDARResponse**](ValidateCDARResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

