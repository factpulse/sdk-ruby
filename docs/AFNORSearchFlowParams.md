# FactPulse::AFNORSearchFlowParams

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | Maximum number of results that may be returned | [optional][default to 25] |
| **where** | [**AFNORSearchFlowFilters**](AFNORSearchFlowFilters.md) |  |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORSearchFlowParams.new(
  limit: null,
  where: null
)
```

