# FactPulse::KeyRotationRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **old_key** | **String** | Current encryption key (base64-encoded AES-256) |  |
| **new_key** | **String** | New encryption key (base64-encoded AES-256) |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::KeyRotationRequest.new(
  old_key: null,
  new_key: null
)
```

