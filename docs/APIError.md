# FactPulse::APIError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_code** | **String** | Alphanumeric code precisely identifying the error |  |
| **error_message** | **String** | Message describing the error (not intended for end user) |  |
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

