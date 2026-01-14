# FactPulse::PDFValidationResultAPI

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **is_compliant** | **Boolean** | True if PDF complies with all criteria (XML, PDF/A, XMP) |  |
| **xml_present** | **Boolean** | True if a Factur-X XML is embedded in the PDF |  |
| **xml_compliant** | **Boolean** | True if Factur-X XML complies with Schematron rules |  |
| **detected_profile** | **String** |  | [optional] |
| **xml_errors** | **Array&lt;String&gt;** | List of XML validation errors | [optional] |
| **pdfa_compliant** | **Boolean** | True if PDF is PDF/A compliant |  |
| **pdfa_version** | **String** |  | [optional] |
| **pdfa_validation_method** | **String** | Method used for PDF/A validation (metadata or verapdf) | [optional][default to &#39;metadata&#39;] |
| **validated_rules** | **Integer** |  | [optional] |
| **failed_rules** | **Integer** |  | [optional] |
| **pdfa_errors** | **Array&lt;String&gt;** | List of PDF/A compliance errors | [optional] |
| **pdfa_warnings** | **Array&lt;String&gt;** | List of PDF/A warnings | [optional] |
| **xmp_present** | **Boolean** | True if XMP metadata is present |  |
| **xmp_facturx_compliant** | **Boolean** | True if XMP metadata contains Factur-X information |  |
| **xmp_profile** | **String** |  | [optional] |
| **xmp_version** | **String** |  | [optional] |
| **xmp_errors** | **Array&lt;String&gt;** | List of XMP metadata errors | [optional] |
| **xmp_metadata** | **Hash&lt;String, Object&gt;** | XMP metadata extracted from PDF | [optional] |
| **is_signed** | **Boolean** | True if PDF contains at least one signature |  |
| **signature_count** | **Integer** | Number of electronic signatures found | [optional][default to 0] |
| **signatures** | [**Array&lt;SignatureInfoAPI&gt;**](SignatureInfoAPI.md) | List of found signatures with their information | [optional] |
| **signature_errors** | **Array&lt;String&gt;** | List of errors during signature analysis | [optional] |
| **summary_message** | **String** | Message summarizing the validation result |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::PDFValidationResultAPI.new(
  is_compliant: null,
  xml_present: null,
  xml_compliant: null,
  detected_profile: null,
  xml_errors: null,
  pdfa_compliant: null,
  pdfa_version: null,
  pdfa_validation_method: null,
  validated_rules: null,
  failed_rules: null,
  pdfa_errors: null,
  pdfa_warnings: null,
  xmp_present: null,
  xmp_facturx_compliant: null,
  xmp_profile: null,
  xmp_version: null,
  xmp_errors: null,
  xmp_metadata: null,
  is_signed: null,
  signature_count: null,
  signatures: null,
  signature_errors: null,
  summary_message: null
)
```

