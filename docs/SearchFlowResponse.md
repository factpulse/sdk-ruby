# OpenapiClient::SearchFlowResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total** | **Integer** | Total number of results |  |
| **offset** | **Integer** | Applied offset |  |
| **limit** | **Integer** | Results limit |  |
| **results** | [**Array&lt;FlowSummary&gt;**](FlowSummary.md) | List of found flows |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SearchFlowResponse.new(
  total: null,
  offset: null,
  limit: null,
  results: null
)
```

