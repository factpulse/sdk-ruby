# FactPulse::ChorusProApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post**](ChorusProApi.md#ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post) | **POST** /api/v1/chorus-pro/transverses/ajouter-fichier | Add an attachment |
| [**completer_facture_api_v1_chorus_pro_factures_completer_post**](ChorusProApi.md#completer_facture_api_v1_chorus_pro_factures_completer_post) | **POST** /api/v1/chorus-pro/factures/completer | Complete a suspended invoice (Supplier) |
| [**consulter_facture_api_v1_chorus_pro_factures_consulter_post**](ChorusProApi.md#consulter_facture_api_v1_chorus_pro_factures_consulter_post) | **POST** /api/v1/chorus-pro/factures/consulter | Consult invoice status |
| [**consulter_structure_api_v1_chorus_pro_structures_consulter_post**](ChorusProApi.md#consulter_structure_api_v1_chorus_pro_structures_consulter_post) | **POST** /api/v1/chorus-pro/structures/consulter | Consult structure details |
| [**lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get**](ChorusProApi.md#lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get) | **GET** /api/v1/chorus-pro/structures/{id_structure_cpp}/services | List structure services |
| [**obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post**](ChorusProApi.md#obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post) | **POST** /api/v1/chorus-pro/structures/obtenir-id-depuis-siret | Utility: Get Chorus Pro ID from SIRET |
| [**rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post**](ChorusProApi.md#rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post) | **POST** /api/v1/chorus-pro/factures/rechercher-destinataire | Search received invoices (Recipient) |
| [**rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post**](ChorusProApi.md#rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post) | **POST** /api/v1/chorus-pro/factures/rechercher-fournisseur | Search issued invoices (Supplier) |
| [**rechercher_structures_api_v1_chorus_pro_structures_rechercher_post**](ChorusProApi.md#rechercher_structures_api_v1_chorus_pro_structures_rechercher_post) | **POST** /api/v1/chorus-pro/structures/rechercher | Search Chorus Pro structures |
| [**recycler_facture_api_v1_chorus_pro_factures_recycler_post**](ChorusProApi.md#recycler_facture_api_v1_chorus_pro_factures_recycler_post) | **POST** /api/v1/chorus-pro/factures/recycler | Recycle an invoice (Supplier) |
| [**soumettre_facture_api_v1_chorus_pro_factures_soumettre_post**](ChorusProApi.md#soumettre_facture_api_v1_chorus_pro_factures_soumettre_post) | **POST** /api/v1/chorus-pro/factures/soumettre | Submit an invoice to Chorus Pro |
| [**telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post**](ChorusProApi.md#telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post) | **POST** /api/v1/chorus-pro/factures/telecharger-groupe | Download a group of invoices |
| [**traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post**](ChorusProApi.md#traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post) | **POST** /api/v1/chorus-pro/factures/traiter-facture-recue | Process a received invoice (Recipient) |
| [**valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post**](ChorusProApi.md#valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post) | **POST** /api/v1/chorus-pro/factures/valideur/consulter | Consult an invoice (Validator) |
| [**valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post**](ChorusProApi.md#valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post) | **POST** /api/v1/chorus-pro/factures/valideur/rechercher | Search invoices to validate (Validator) |
| [**valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post**](ChorusProApi.md#valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post) | **POST** /api/v1/chorus-pro/factures/valideur/traiter | Validate or reject an invoice (Validator) |


## ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post

> Object ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post(request_body)

Add an attachment

Add an attachment to the current user account.      **Max size**: 10 MB per file      **Example payload**:     ```json     {       \"pieceJointeFichier\": \"JVBERi0xLjQKJeLjz9MKNSAwIG9iago8P...\",       \"pieceJointeNom\": \"purchase_order.pdf\",       \"pieceJointeTypeMime\": \"application/pdf\",       \"pieceJointeExtension\": \"PDF\"     }     ```      **Returns**: The attachment ID (`pieceJointeIdFichier`) to use in `/factures/completer`.      **Accepted extensions**: PDF, JPG, PNG, ZIP, XML, etc.

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Add an attachment
  result = api_instance.ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post: #{e}"
end
```

#### Using the ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info(request_body)

```ruby
begin
  # Add an attachment
  data, status_code, headers = api_instance.ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## completer_facture_api_v1_chorus_pro_factures_completer_post

> Object completer_facture_api_v1_chorus_pro_factures_completer_post(request_body)

Complete a suspended invoice (Supplier)

Complete a SUSPENDUE status invoice by adding attachments or a comment.      **Required status**: SUSPENDUE      **Possible actions**:     - Add attachments (supporting documents, purchase orders, etc.)     - Modify comment      **Example payload**:     ```json     {       \"identifiantFactureCPP\": 12345,       \"commentaire\": \"Here are the requested documents\",       \"listePiecesJointes\": [         {           \"pieceJointeIdFichier\": 98765,           \"pieceJointeNom\": \"purchase_order.pdf\"         }       ]     }     ```      **Note**: Attachments must first be uploaded via `/transverses/ajouter-fichier`.      **After completion**: The invoice returns to MISE_A_DISPOSITION status.

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Complete a suspended invoice (Supplier)
  result = api_instance.completer_facture_api_v1_chorus_pro_factures_completer_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->completer_facture_api_v1_chorus_pro_factures_completer_post: #{e}"
end
```

#### Using the completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info(request_body)

```ruby
begin
  # Complete a suspended invoice (Supplier)
  data, status_code, headers = api_instance.completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## consulter_facture_api_v1_chorus_pro_factures_consulter_post

> <GetInvoiceResponse> consulter_facture_api_v1_chorus_pro_factures_consulter_post(get_invoice_request)

Consult invoice status

Retrieves the information and current status of an invoice submitted to Chorus Pro.      **Returns**:     - Invoice number and date     - Total gross amount     - **Current status**: SOUMISE, VALIDEE, REJETEE, SUSPENDUE, MANDATEE, MISE_EN_PAIEMENT, etc.     - Recipient structure      **Use cases**:     - Track the processing progress of an invoice     - Check if an invoice has been validated or rejected     - Get the payment date      **Polling**: Call this endpoint regularly to track status changes.

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

api_instance = FactPulse::ChorusProApi.new
get_invoice_request = FactPulse::GetInvoiceRequest.new({chorus_invoice_id: 37}) # GetInvoiceRequest | 

begin
  # Consult invoice status
  result = api_instance.consulter_facture_api_v1_chorus_pro_factures_consulter_post(get_invoice_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_facture_api_v1_chorus_pro_factures_consulter_post: #{e}"
end
```

#### Using the consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetInvoiceResponse>, Integer, Hash)> consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info(get_invoice_request)

```ruby
begin
  # Consult invoice status
  data, status_code, headers = api_instance.consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info(get_invoice_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetInvoiceResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **get_invoice_request** | [**GetInvoiceRequest**](GetInvoiceRequest.md) |  |  |

### Return type

[**GetInvoiceResponse**](GetInvoiceResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## consulter_structure_api_v1_chorus_pro_structures_consulter_post

> <GetStructureResponse> consulter_structure_api_v1_chorus_pro_structures_consulter_post(get_structure_request)

Consult structure details

Retrieves detailed information about a Chorus Pro structure.       **Returns**:     - Company name     - Intra-EU VAT number     - Contact email     - **Required parameters**: Indicates if service code and/or engagement number are required to submit an invoice      **Typical step**: Called after `search-structures` to know which fields are mandatory before submitting an invoice.

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

api_instance = FactPulse::ChorusProApi.new
get_structure_request = FactPulse::GetStructureRequest.new({structure_id: 37}) # GetStructureRequest | 

begin
  # Consult structure details
  result = api_instance.consulter_structure_api_v1_chorus_pro_structures_consulter_post(get_structure_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_structure_api_v1_chorus_pro_structures_consulter_post: #{e}"
end
```

#### Using the consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetStructureResponse>, Integer, Hash)> consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info(get_structure_request)

```ruby
begin
  # Consult structure details
  data, status_code, headers = api_instance.consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info(get_structure_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetStructureResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **get_structure_request** | [**GetStructureRequest**](GetStructureRequest.md) |  |  |

### Return type

[**GetStructureResponse**](GetStructureResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get

> <SearchServicesResponse> lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get(id_structure_cpp)

List structure services

Retrieves the list of active services for a public structure.      **Use cases**:     - List available services for an administration     - Verify that a service code exists before submitting an invoice      **Returns**:     - List of services with their code, label, and status (active/inactive)

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

api_instance = FactPulse::ChorusProApi.new
id_structure_cpp = 56 # Integer | Chorus Pro structure ID (idStructureCPP)

begin
  # List structure services
  result = api_instance.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get(id_structure_cpp)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get: #{e}"
end
```

#### Using the lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SearchServicesResponse>, Integer, Hash)> lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info(id_structure_cpp)

```ruby
begin
  # List structure services
  data, status_code, headers = api_instance.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info(id_structure_cpp)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SearchServicesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_structure_cpp** | **Integer** | Chorus Pro structure ID (idStructureCPP) |  |

### Return type

[**SearchServicesResponse**](SearchServicesResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post

> <GetChorusProIdResponse> obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post(get_chorus_pro_id_request)

Utility: Get Chorus Pro ID from SIRET

**Convenient utility** to get a structure's Chorus Pro ID from its SIRET.       This wrapper function combines:     1. Searching for the structure by SIRET     2. Extracting the `id_structure_cpp` if a single structure is found      **Returns**:     - `id_structure_cpp`: Chorus Pro ID (0 if not found or multiple results)     - `designation_structure`: Structure name (if found)     - `message`: Explanatory message      **Use cases**:     - Shortcut to directly get the Chorus Pro ID before submitting an invoice     - Simplified alternative to `search-structures` + manual ID extraction      **Note**: If multiple structures match the SIRET (rare), returns 0 and an error message.

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

api_instance = FactPulse::ChorusProApi.new
get_chorus_pro_id_request = FactPulse::GetChorusProIdRequest.new({siret: 'siret_example'}) # GetChorusProIdRequest | 

begin
  # Utility: Get Chorus Pro ID from SIRET
  result = api_instance.obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post(get_chorus_pro_id_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post: #{e}"
end
```

#### Using the obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetChorusProIdResponse>, Integer, Hash)> obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info(get_chorus_pro_id_request)

```ruby
begin
  # Utility: Get Chorus Pro ID from SIRET
  data, status_code, headers = api_instance.obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info(get_chorus_pro_id_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetChorusProIdResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **get_chorus_pro_id_request** | [**GetChorusProIdRequest**](GetChorusProIdRequest.md) |  |  |

### Return type

[**GetChorusProIdResponse**](GetChorusProIdResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post

> Object rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post(request_body)

Search received invoices (Recipient)

Search invoices received by the connected recipient.      **Filters**:     - Downloaded / not downloaded     - Reception dates     - Status (MISE_A_DISPOSITION, SUSPENDUE, etc.)     - Supplier      **Useful indicator**: `factureTelechargeeParDestinataire` indicates whether the invoice has already been downloaded.

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Search received invoices (Recipient)
  result = api_instance.rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post: #{e}"
end
```

#### Using the rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info(request_body)

```ruby
begin
  # Search received invoices (Recipient)
  data, status_code, headers = api_instance.rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post

> Object rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post(request_body)

Search issued invoices (Supplier)

Search invoices issued by the connected supplier.      **Available filters**:     - Invoice number     - Dates (start/end)     - Status     - Recipient structure     - Amount      **Use cases**:     - Track issued invoices     - Verify statuses     - Export for accounting

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Search issued invoices (Supplier)
  result = api_instance.rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post: #{e}"
end
```

#### Using the rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info(request_body)

```ruby
begin
  # Search issued invoices (Supplier)
  data, status_code, headers = api_instance.rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## rechercher_structures_api_v1_chorus_pro_structures_rechercher_post

> <SearchStructureResponse> rechercher_structures_api_v1_chorus_pro_structures_rechercher_post(search_structure_request)

Search Chorus Pro structures

Search for structures (companies, administrations) registered on Chorus Pro.      **Use cases**:     - Find the Chorus Pro ID of a structure from its SIRET     - Check if a structure is registered on Chorus Pro     - List structures matching criteria      **Available filters**:     - Identifier (SIRET, SIREN, etc.)     - Company name     - Identifier type     - Private structures only      **Typical step**: Called before `submit-invoice` to get the recipient's `id_structure_cpp`.

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

api_instance = FactPulse::ChorusProApi.new
search_structure_request = FactPulse::SearchStructureRequest.new # SearchStructureRequest | 

begin
  # Search Chorus Pro structures
  result = api_instance.rechercher_structures_api_v1_chorus_pro_structures_rechercher_post(search_structure_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_structures_api_v1_chorus_pro_structures_rechercher_post: #{e}"
end
```

#### Using the rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SearchStructureResponse>, Integer, Hash)> rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info(search_structure_request)

```ruby
begin
  # Search Chorus Pro structures
  data, status_code, headers = api_instance.rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info(search_structure_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SearchStructureResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **search_structure_request** | [**SearchStructureRequest**](SearchStructureRequest.md) |  |  |

### Return type

[**SearchStructureResponse**](SearchStructureResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## recycler_facture_api_v1_chorus_pro_factures_recycler_post

> Object recycler_facture_api_v1_chorus_pro_factures_recycler_post(request_body)

Recycle an invoice (Supplier)

Recycle an invoice with A_RECYCLER status by modifying routing data.      **Required status**: A_RECYCLER      **Modifiable fields**:     - Recipient (`idStructureCPP`)     - Service code     - Engagement number      **Use cases**:     - Wrong recipient     - Change of billing service     - Update engagement number      **Example payload**:     ```json     {       \"identifiantFactureCPP\": 12345,       \"idStructureCPP\": 67890,       \"codeService\": \"SERVICE_01\",       \"numeroEngagement\": \"ENG2024001\"     }     ```      **Note**: The invoice keeps its number and amounts, only routing fields change.

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Recycle an invoice (Supplier)
  result = api_instance.recycler_facture_api_v1_chorus_pro_factures_recycler_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->recycler_facture_api_v1_chorus_pro_factures_recycler_post: #{e}"
end
```

#### Using the recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info(request_body)

```ruby
begin
  # Recycle an invoice (Supplier)
  data, status_code, headers = api_instance.recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## soumettre_facture_api_v1_chorus_pro_factures_soumettre_post

> <SubmitInvoiceResponse> soumettre_facture_api_v1_chorus_pro_factures_soumettre_post(submit_invoice_request)

Submit an invoice to Chorus Pro

Submits an electronic invoice to a public structure via Chorus Pro.       **Complete workflow**:     1. **Upload the Factur-X PDF** via `/transverses/ajouter-fichier` → retrieve `pieceJointeId`     2. **Get the structure ID** via `/structures/rechercher` or `/structures/obtenir-id-depuis-siret`     3. **Check mandatory parameters** via `/structures/consulter`     4. **Submit the invoice** with the `piece_jointe_principale_id` obtained in step 1      **Prerequisites**:     1. Have the recipient's `id_structure_cpp` (via `/structures/rechercher`)     2. Know the mandatory parameters (via `/structures/consulter`):        - Service code if `code_service_doit_etre_renseigne=true`        - Engagement number if `numero_ej_doit_etre_renseigne=true`     3. Have uploaded the Factur-X PDF (via `/transverses/ajouter-fichier`)      **Expected format**:     - `piece_jointe_principale_id`: ID returned by `/transverses/ajouter-fichier`     - Amounts: Strings with 2 decimals (e.g., \"1250.50\")     - Dates: ISO 8601 format (YYYY-MM-DD)      **Returns**:     - `identifiant_facture_cpp`: Chorus Pro ID of the created invoice     - `numero_flux_depot`: Deposit tracking number      **Possible statuses after submission**:     - SOUMISE: Pending validation     - VALIDEE: Validated by recipient     - REJETEE: Rejected (data error or business refusal)     - SUSPENDUE: Pending additional information      **Note**: Use `/factures/consulter` to track status changes.

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

api_instance = FactPulse::ChorusProApi.new
submit_invoice_request = FactPulse::SubmitInvoiceRequest.new({invoice_number: 'invoice_number_example', invoice_date: 'invoice_date_example', structure_id: 37, total_net_amount: FactPulse::SubmitNetAmount.new, vat_amount: FactPulse::SubmitVatAmount.new, total_gross_amount: FactPulse::SubmitGrossAmount.new}) # SubmitInvoiceRequest | 

begin
  # Submit an invoice to Chorus Pro
  result = api_instance.soumettre_facture_api_v1_chorus_pro_factures_soumettre_post(submit_invoice_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->soumettre_facture_api_v1_chorus_pro_factures_soumettre_post: #{e}"
end
```

#### Using the soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SubmitInvoiceResponse>, Integer, Hash)> soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info(submit_invoice_request)

```ruby
begin
  # Submit an invoice to Chorus Pro
  data, status_code, headers = api_instance.soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info(submit_invoice_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SubmitInvoiceResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submit_invoice_request** | [**SubmitInvoiceRequest**](SubmitInvoiceRequest.md) |  |  |

### Return type

[**SubmitInvoiceResponse**](SubmitInvoiceResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post

> Object telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post(request_body)

Download a group of invoices

Download one or more invoices (max 10 recommended) with their attachments.      **Available formats**:     - PDF: PDF file only     - XML: XML file only     - ZIP: Archive containing PDF + XML + attachments      **Maximum size**: 120 MB per download      **Example payload**:     ```json     {       \"listeIdentifiantsFactureCPP\": [12345, 12346],       \"inclurePiecesJointes\": true,       \"formatFichier\": \"ZIP\"     }     ```      **Returns**: The file is base64-encoded in the `fichierBase64` field.      **Note**: The `factureTelechargeeParDestinataire` flag is automatically updated.

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Download a group of invoices
  result = api_instance.telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post: #{e}"
end
```

#### Using the telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info(request_body)

```ruby
begin
  # Download a group of invoices
  data, status_code, headers = api_instance.telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post

> Object traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post(request_body)

Process a received invoice (Recipient)

Change the status of a received invoice.      **Possible statuses**:     - MISE_A_DISPOSITION: Invoice accepted     - SUSPENDUE: Pending additional information (reason required)     - REJETEE: Invoice refused (reason required)     - MANDATEE: Invoice mandated     - MISE_EN_PAIEMENT: Invoice being paid     - COMPTABILISEE: Invoice accounted     - MISE_A_DISPOSITION_COMPTABLE: Made available to accounting     - A_RECYCLER: To be recycled     - COMPLETEE: Completed     - SERVICE-FAIT: Service rendered     - PRISE_EN_COMPTE_DESTINATAIRE: Acknowledged     - TRANSMISE_MOA: Transmitted to MOA      **Example payload**:     ```json     {       \"identifiantFactureCPP\": 12345,       \"nouveauStatut\": \"REJETEE\",       \"motifRejet\": \"Duplicate invoice\",       \"commentaire\": \"Invoice already received under reference ABC123\"     }     ```      **Rules**:     - A reason is **required** for SUSPENDUE and REJETEE     - Only certain statuses are allowed depending on the invoice's current status

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Process a received invoice (Recipient)
  result = api_instance.traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post: #{e}"
end
```

#### Using the traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info(request_body)

```ruby
begin
  # Process a received invoice (Recipient)
  data, status_code, headers = api_instance.traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post

> Object valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post(request_body)

Consult an invoice (Validator)

Retrieves detailed information about an invoice for validators.  **Use case**: Called by validators (public sector) to consult invoice details before approving or rejecting it.  **Required payload**: ```json {   \"idFacture\": 123456789 } ```  **Returns**: Complete invoice details including amounts, dates, attachments, and current status.

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Consult an invoice (Validator)
  result = api_instance.valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post: #{e}"
end
```

#### Using the valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info(request_body)

```ruby
begin
  # Consult an invoice (Validator)
  data, status_code, headers = api_instance.valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post

> Object valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post(request_body)

Search invoices to validate (Validator)

Search invoices pending validation by the connected validator.      **Role**: Validator in the internal validation workflow.      **Filters**: Dates, structure, service, etc.

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Search invoices to validate (Validator)
  result = api_instance.valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post: #{e}"
end
```

#### Using the valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info(request_body)

```ruby
begin
  # Search invoices to validate (Validator)
  data, status_code, headers = api_instance.valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post

> Object valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post(request_body)

Validate or reject an invoice (Validator)

Validate or reject an invoice pending validation.      **Actions**:     - Validate: The invoice moves to the next status in the workflow     - Reject: The invoice is rejected (reason required)

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

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Validate or reject an invoice (Validator)
  result = api_instance.valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post: #{e}"
end
```

#### Using the valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info(request_body)

```ruby
begin
  # Validate or reject an invoice (Validator)
  data, status_code, headers = api_instance.valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

