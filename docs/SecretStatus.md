# FactPulse::SecretStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Secret status: &#39;active&#39;, &#39;missing&#39;, etc. |  |
| **message** | **String** | Descriptive status message |  |
| **encryption_mode** | **String** |  | [optional] |
| **requires_client_key** | **Boolean** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SecretStatus.new(
  status: null,
  message: null,
  encryption_mode: null,
  requires_client_key: null
)
```

