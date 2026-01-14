# OpenapiClient::APIError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_code** | **String** | Alphanumeric code precisely identifying the error |  |
| **error_message** | **String** | Message describing the error (not intended for end user) |  |
| **details** | [**Array&lt;ValidationErrorDetail&gt;**](ValidationErrorDetail.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::APIError.new(
  error_code: null,
  error_message: null,
  details: null
)
```

