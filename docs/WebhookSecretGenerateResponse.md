# FactPulse::WebhookSecretGenerateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **success** | **Boolean** | Whether the secret was generated successfully |  |
| **webhook_secret** | **String** | The generated webhook secret (save it, it will never be shown again) |  |
| **message** | **String** | Result message |  |
| **created_at** | **Time** | When the secret was created |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::WebhookSecretGenerateResponse.new(
  success: null,
  webhook_secret: null,
  message: null,
  created_at: null
)
```

