# FactPulse::SignatureSuccessResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;SUCCESS&#39;] |
| **content_b64** | **String** |  |  |
| **filename** | **String** |  |  |
| **size_bytes** | **Integer** |  |  |
| **is_signed** | **Boolean** |  |  |
| **signature_count** | **Integer** |  |  |
| **signer_cn** | **String** |  |  |
| **signing_date** | **String** |  |  |
| **validation_details** | **Hash&lt;String, Object&gt;** |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SignatureSuccessResult.new(
  status: null,
  content_b64: null,
  filename: null,
  size_bytes: null,
  is_signed: null,
  signature_count: null,
  signer_cn: null,
  signing_date: null,
  validation_details: null
)
```

