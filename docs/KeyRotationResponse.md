# FactPulse::KeyRotationResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** | Whether rotation was successful |  |
| **message** | **String** | Result message |  |
| **rotated_count** | **Integer** | Number of secrets that were rotated |  |
| **partial_errors** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::KeyRotationResponse.new(
  success: null,
  message: null,
  rotated_count: null,
  partial_errors: null
)
```

