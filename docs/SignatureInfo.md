# FactPulse::SignatureInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **signe** | **Boolean** | Le PDF a été signé |  |
| **cn** | **String** |  | [optional] |
| **expiration** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SignatureInfo.new(
  signe: null,
  cn: null,
  expiration: null
)
```

