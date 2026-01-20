# FactPulse::ClientActivateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **uid** | **String** | Unique client identifier |  |
| **is_active** | **Boolean** | New status |  |
| **message** | **String** | Confirmation message |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ClientActivateResponse.new(
  uid: null,
  is_active: null,
  message: null
)
```

