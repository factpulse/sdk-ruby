# OpenapiClient::VerificationSuccessResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_compliant** | **Boolean** | True if no critical discrepancy |  |
| **compliance_score** | **Float** | Compliance score (0-100%) |  |
| **verified_fields_count** | **Integer** | Number of verified fields | [optional][default to 0] |
| **compliant_fields_count** | **Integer** | Number of compliant fields | [optional][default to 0] |
| **is_facturx** | **Boolean** | True if PDF contains Factur-X XML | [optional][default to false] |
| **facturx_profile** | **String** |  | [optional] |
| **fields** | [**Array&lt;VerifiedFieldSchema&gt;**](VerifiedFieldSchema.md) | List of verified fields with values, statuses and PDF coordinates | [optional] |
| **mandatory_notes** | [**Array&lt;MandatoryNoteSchema&gt;**](MandatoryNoteSchema.md) | Mandatory notes (PMT, PMD, AAB) with PDF location | [optional] |
| **page_dimensions** | [**Array&lt;PageDimensionsSchema&gt;**](PageDimensionsSchema.md) | Dimensions of each PDF page (width, height) | [optional] |
| **warnings** | **Array&lt;String&gt;** | Non-blocking warnings | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::VerificationSuccessResponse.new(
  is_compliant: null,
  compliance_score: null,
  verified_fields_count: null,
  compliant_fields_count: null,
  is_facturx: null,
  facturx_profile: null,
  fields: null,
  mandatory_notes: null,
  page_dimensions: null,
  warnings: null
)
```

