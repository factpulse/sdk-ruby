# FactPulse::ClientListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **results** | [**Array&lt;ClientSummary&gt;**](ClientSummary.md) | List of clients |  |
| **total** | **Integer** | Total number of clients |  |
| **page** | **Integer** | Current page |  |
| **page_size** | **Integer** | Page size |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ClientListResponse.new(
  results: null,
  total: null,
  page: null,
  page_size: null
)
```

