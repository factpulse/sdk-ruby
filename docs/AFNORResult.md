# FactPulse::AFNORResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Submitted flow identifier |  |
| **tracking_id** | **String** |  | [optional] |
| **sha256** | **String** | SHA-256 hash of submitted file |  |
| **flow_syntax** | **String** | Flow syntax |  |
| **flow_profile** | **String** |  | [optional] |
| **flow_type** | **String** |  | [optional] |
| **processing_rule** | **String** |  | [optional] |
| **processing_rule_source** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORResult.new(
  flow_id: null,
  tracking_id: null,
  sha256: null,
  flow_syntax: null,
  flow_profile: null,
  flow_type: null,
  processing_rule: null,
  processing_rule_source: null
)
```

