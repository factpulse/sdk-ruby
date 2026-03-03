# FactPulse::AFNORWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_id** | **String** |  | [optional] |
| **callback** | [**AFNORCallbackParameters**](AFNORCallbackParameters.md) |  |  |
| **metadata** | [**AFNORWebhookMetadata**](AFNORWebhookMetadata.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORWebhook.new(
  webhook_id: null,
  callback: null,
  metadata: null
)
```

