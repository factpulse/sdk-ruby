# FactPulse::ReferencesApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**get_vatex_codes_api_v1_references_vatex_codes_get**](ReferencesApi.md#get_vatex_codes_api_v1_references_vatex_codes_get) | **GET** /api/v1/references/vatex-codes | VATEX exemption reason codes |


## get_vatex_codes_api_v1_references_vatex_codes_get

> <VATEXCodesResponse> get_vatex_codes_api_v1_references_vatex_codes_get(opts)

VATEX exemption reason codes

Returns the list of VATEX (VAT exemption reason) codes from the Peppol BIS Billing 3.0 code list. Source: https://docs.peppol.eu/poacc/billing/3.0/codelist/vatex/

### Examples

```ruby
require 'time'
require 'factpulse'

api_instance = FactPulse::ReferencesApi.new
opts = {
  category: 'category_example' # String | Filter by VAT category code (E, AE, K, G, O).
}

begin
  # VATEX exemption reason codes
  result = api_instance.get_vatex_codes_api_v1_references_vatex_codes_get(opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ReferencesApi->get_vatex_codes_api_v1_references_vatex_codes_get: #{e}"
end
```

#### Using the get_vatex_codes_api_v1_references_vatex_codes_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VATEXCodesResponse>, Integer, Hash)> get_vatex_codes_api_v1_references_vatex_codes_get_with_http_info(opts)

```ruby
begin
  # VATEX exemption reason codes
  data, status_code, headers = api_instance.get_vatex_codes_api_v1_references_vatex_codes_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VATEXCodesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ReferencesApi->get_vatex_codes_api_v1_references_vatex_codes_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **category** | **String** | Filter by VAT category code (E, AE, K, G, O). | [optional] |

### Return type

[**VATEXCodesResponse**](VATEXCodesResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

