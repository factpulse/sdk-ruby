# FactPulse::WebhookSecretStatusResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **has_secret** | **Boolean** | Whether a webhook secret is configured |  |
| **created_at** | **Time** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::WebhookSecretStatusResponse.new(
  has_secret: null,
  created_at: null
)
```

