# FactPulse::APIError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_code** | **String** | Code alphanumérique identifiant précisément l&#39;erreur |  |
| **error_message** | **String** | Message décrivant l&#39;erreur (non destiné à l&#39;utilisateur final) |  |
| **details** | [**Array&lt;ValidationErrorDetail&gt;**](ValidationErrorDetail.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::APIError.new(
  error_code: null,
  error_message: null,
  details: null
)
```

