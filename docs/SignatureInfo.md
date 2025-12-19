# FactPulse::SignatureInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **signed** | **Boolean** | PDF was signed |  |
| **cn** | **String** |  | [optional] |
| **expiration** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SignatureInfo.new(
  signed: null,
  cn: null,
  expiration: null
)
```

