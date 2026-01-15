# FactPulse::AFNORAcknowledgement

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | [**AFNORFlowAckStatus**](AFNORFlowAckStatus.md) |  |  |
| **details** | [**Array&lt;AFNORAcknowledgementDetail&gt;**](AFNORAcknowledgementDetail.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORAcknowledgement.new(
  status: null,
  details: null
)
```

