# OpenapiClient::AFNORDestination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  | [optional][default to &#39;afnor&#39;] |
| **credentials** | [**AFNORCredentials**](AFNORCredentials.md) |  | [optional] |
| **flow_syntax** | [**FlowSyntax**](FlowSyntax.md) | Flow syntax (AFNOR XP Z12-013) | [optional] |
| **tracking_id** | **String** |  | [optional] |
| **processing_rule** | [**ProcessingRule**](ProcessingRule.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORDestination.new(
  type: null,
  credentials: null,
  flow_syntax: null,
  tracking_id: null,
  processing_rule: null
)
```

