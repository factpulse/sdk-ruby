# OpenapiClient::AFNORFlow

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **submitted_at** | **Time** | The flow submission date and time (the date and time when the flow was created on the system)  | [optional] |
| **updated_at** | **Time** | The last update date and time of the flow. When the flow is submitted updatedAt is equal to submittedAt. When the flow acknowledgment status is changed updatedAt date and time is updated.  | [optional] |
| **flow_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose | [optional] |
| **tracking_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose | [optional] |
| **flow_type** | [**AFNORFlowType**](AFNORFlowType.md) |  | [optional] |
| **processing_rule** | [**AFNORProcessingRule**](AFNORProcessingRule.md) |  | [optional] |
| **processing_rule_source** | **String** | Says whether the processing rule has been computed or the processing rule was an input parameter | [optional] |
| **flow_direction** | [**AFNORFlowDirection**](AFNORFlowDirection.md) |  | [optional] |
| **flow_syntax** | [**AFNORFlowSyntax**](AFNORFlowSyntax.md) |  | [optional] |
| **flow_profile** | [**AFNORFlowProfile**](AFNORFlowProfile.md) |  | [optional] |
| **acknowledgement** | [**AFNORAcknowledgement**](AFNORAcknowledgement.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORFlow.new(
  submitted_at: null,
  updated_at: null,
  flow_id: null,
  tracking_id: null,
  flow_type: null,
  processing_rule: null,
  processing_rule_source: null,
  flow_direction: null,
  flow_syntax: null,
  flow_profile: null,
  acknowledgement: null
)
```

