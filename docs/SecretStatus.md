# FactPulse::SecretStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | Secret status: &#39;active&#39;, &#39;missing&#39;, etc. |  |
| **message** | **String** | Descriptive status message |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SecretStatus.new(
  status: null,
  message: null
)
```

