# FactPulse::TaskErrorResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** |  | [optional][default to &#39;ERROR&#39;] |
| **error_code** | **String** |  |  |
| **error_message** | **String** |  |  |
| **details** | [**Array&lt;AFNORErrorDetail&gt;**](AFNORErrorDetail.md) |  | [optional] |
| **traceback** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::TaskErrorResult.new(
  status: null,
  error_code: null,
  error_message: null,
  details: null,
  traceback: null
)
```

