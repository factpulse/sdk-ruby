# OpenapiClient::AFNORFullFlowInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tracking_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose | [optional] |
| **name** | **String** | Name of the file | [optional] |
| **processing_rule** | [**AFNORProcessingRule**](AFNORProcessingRule.md) |  | [optional] |
| **flow_syntax** | [**AFNORFlowSyntax**](AFNORFlowSyntax.md) |  |  |
| **flow_profile** | [**AFNORFlowProfile**](AFNORFlowProfile.md) |  | [optional] |
| **sha256** | **String** |  | [optional] |
| **flow_id** | **String** | Unique identifier supporting UUID but not only, for flexibility purpose | [optional] |
| **submitted_at** | **Time** | The flow submission date and time (the date and time when the flow was created on the system) This property should be used by the API consumer as a time reference to avoid clock synchronization issues  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORFullFlowInfo.new(
  tracking_id: null,
  name: null,
  processing_rule: null,
  flow_syntax: null,
  flow_profile: null,
  sha256: null,
  flow_id: null,
  submitted_at: null
)
```

