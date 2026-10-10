# FactPulse::AFNORSearchFlowParams

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Pagination, Maximum number of results that may be returned | [optional][default to 25] |
| **cursor** | **String** | If cursor is provided, then start search starting from that cursor | [optional] |
| **where** | [**AFNORSearchFlowFilters**](AFNORSearchFlowFilters.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchFlowParams.new(
  limit: null,
  cursor: eyJjcmVhdGVkX2F0IjoiMjAyNS0wNi0wOVQxMDowMDowMFoiLCJpZCI6MTIzNH0&#x3D;,
  where: null
)
```

