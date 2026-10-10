# FactPulse::AFNORSearchFlowContent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Pagination, Maximum number of results that may be returned | [optional][default to 25] |
| **next_cursor** | **String** | Pagination management: - If present, says where to start for next page, set nextCursor as the cursor in the next request - If omitted, says that pagination is finished  | [optional] |
| **filters** | [**AFNORSearchFlowFilters**](AFNORSearchFlowFilters.md) |  | [optional] |
| **results** | [**Array&lt;AFNORFlow&gt;**](AFNORFlow.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchFlowContent.new(
  limit: null,
  next_cursor: eyJjcmVhdGVkX2F0IjoiMjAyNS0wNi0wOVQxMDowMDowMFoiLCJpZCI6MTIzNH0&#x3D;,
  filters: null,
  results: null
)
```

