# FactPulse::SignatureInfoAPI

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **field_name** | **String** | Signature field name in the PDF |  |
| **signer** | **String** |  | [optional] |
| **signing_date** | **String** |  | [optional] |
| **reason** | **String** |  | [optional] |
| **location** | **String** |  | [optional] |
| **is_valid** | **Boolean** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SignatureInfoAPI.new(
  field_name: null,
  signer: null,
  signing_date: null,
  reason: null,
  location: null,
  is_valid: null
)
```

