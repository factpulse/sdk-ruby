# FactPulse::ValidationApi

All URIs are relative to *https://factpulse.fr*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**validate_xml_api_v1_processing_validate_xml_post**](ValidationApi.md#validate_xml_api_v1_processing_validate_xml_post) | **POST** /api/v1/processing/validate-xml | Validate a CII or UBL XML against Schematron rules |


## validate_xml_api_v1_processing_validate_xml_post

> <ValidationSuccessResponse> validate_xml_api_v1_processing_validate_xml_post(xml_file, opts)

Validate a CII or UBL XML against Schematron rules

Validates a CII (Factur-X) or UBL XML file against Schematron business rules.  The XML format is **auto-detected** from namespace: - CII XML → validated with EN16931-CII + profile-specific + BR-FR-CII Schematrons - UBL XML → validated with EN16931-UBL + BR-FR-UBL Schematrons  ## Applied Standard  **Schematron ISO/IEC 19757-3**: Business rules validation language for XML - Semantic validation (beyond XSD syntax) - European EN 16931 business rules - French-specific rules (BR-FR-CII or BR-FR-UBL) - Arithmetic calculations and data consistency  ## Profiles and validated rules (CII only)  ### MINIMUM (45 rules) - Unique invoice identifier - Dates (issue, due date) - Party identifiers (SIRET/SIREN) - Total gross amount  ### BASIC (102 rules) - All MINIMUM rules - Detailed invoice lines - Basic VAT calculations - Payment methods - References (order, contract)  ### EN16931 (178 rules) - All BASIC rules - **European rules (BR-xx)**: 81 business rules - **French rules (FR-xx)**: 12 France-specific rules - **Advanced calculations (CR-xx)**: 32 calculation rules - **Standardized codes (CL-xx)**: 52 code lists  ### EXTENDED (210+ rules) - All EN16931 rules - Logistics information - Advanced accounting data - Multiple external references  ## Checks performed  ### 1. Syntax validation - Correct XML parsing (UTF-8, well-formed) - UN/CEFACT namespaces present - Hierarchical structure respected  ### 2. Business rules (BR-xx) Examples: - `BR-1`: Invoice total must equal sum of line totals + document-level amounts - `BR-CO-10`: Sum of VAT base amounts must equal invoice net total - `BR-16`: Invoice currency code must be in ISO 4217 list  ### 3. French rules (FR-xx) Examples: - `FR-1`: Supplier SIRET must have 14 digits - `FR-2`: Customer SIRET must have 14 digits (if present) - `FR-5`: Intra-EU VAT number must be in format FRxx999999999  ### 4. Calculation rules (CR-xx) - Net + VAT = Gross amounts - Sum of lines = Document total - Discounts and surcharges correctly applied - Compliant rounding (2 decimals for amounts)  ### 5. Standardized codes (CL-xx) - ISO 3166-1 alpha-2 country codes - ISO 4217 currency codes - UN/ECE Rec 20 measurement units - VAT codes (types, categories, exemptions) - SchemeID for identifiers (0002=SIREN, 0009=SIRET, etc.)  ## Validation process  1. **XSLT loading**: Schematron file converted to XSLT (Saxon-HE) 2. **Transformation**: Rules applied to XML 3. **Results analysis**: Extraction of errors (`failed-assert`) and warnings (`successful-report`) 4. **Report**: Structured list of non-conformities  ## Responses  **200 OK**: Compliant XML ```json {   \"message\": \"XML is compliant with EN16931 profile\" } ```  **400 Bad Request**: Non-compliant XML ```json {   \"detail\": [     \"[BR-1] Invoice total (120.00) does not match calculated sum (100.00 + 20.00)\",     \"[FR-1] Supplier SIRET must contain exactly 14 digits\"   ] } ```  ## Use cases  - **Pre-validation**: Verify XML before PDF/A integration - **Debugging**: Precisely identify generation errors - **Testing**: Validate test or example XMLs - **Compliance**: Ensure European and French rules are met - **Development**: Quick testing without PDF generation  ## Processing time  - MINIMUM profile: ~0.5 second - EN16931 profile: ~1-2 seconds - EXTENDED profile: ~2-3 seconds

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

api_instance = FactPulse::ValidationApi.new
xml_file = File.new('/path/to/some/file') # File | CII (Factur-X) or UBL XML file to validate (.xml format). Format is auto-detected.
opts = {
  profile: FactPulse::APIProfile::MINIMUM, # APIProfile | Validation profile (MINIMUM, BASIC, EN16931, EXTENDED). Used for CII only; ignored for UBL (always EN16931).
  skip_br_fr: true # Boolean | 
}

begin
  # Validate a CII or UBL XML against Schematron rules
  result = api_instance.validate_xml_api_v1_processing_validate_xml_post(xml_file, opts)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ValidationApi->validate_xml_api_v1_processing_validate_xml_post: #{e}"
end
```

#### Using the validate_xml_api_v1_processing_validate_xml_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ValidationSuccessResponse>, Integer, Hash)> validate_xml_api_v1_processing_validate_xml_post_with_http_info(xml_file, opts)

```ruby
begin
  # Validate a CII or UBL XML against Schematron rules
  data, status_code, headers = api_instance.validate_xml_api_v1_processing_validate_xml_post_with_http_info(xml_file, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ValidationSuccessResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ValidationApi->validate_xml_api_v1_processing_validate_xml_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **xml_file** | **File** | CII (Factur-X) or UBL XML file to validate (.xml format). Format is auto-detected. |  |
| **profile** | [**APIProfile**](APIProfile.md) | Validation profile (MINIMUM, BASIC, EN16931, EXTENDED). Used for CII only; ignored for UBL (always EN16931). | [optional] |
| **skip_br_fr** | **Boolean** |  | [optional] |

### Return type

[**ValidationSuccessResponse**](ValidationSuccessResponse.md)

### Authorization

[APIKeyHeader](../README.md#APIKeyHeader), [HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json

