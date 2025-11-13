# FactPulse::QuotaInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** |  |  |
| **usage** | **Integer** |  |  |
| **remaining** | **Integer** |  |  |
| **reset_date** | **String** |  |  |
| **plan** | **String** |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::QuotaInfo.new(
  limit: null,
  usage: null,
  remaining: null,
  reset_date: null,
  plan: null
)
```

