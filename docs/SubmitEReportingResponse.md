# FactPulse::SubmitEReportingResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Flow identifier from PA/PDP |  |
| **report_id** | **String** | Report identifier |  |
| **tracking_id** | **String** |  | [optional] |
| **flow_type** | **String** | Flux type |  |
| **sha256** | **String** | SHA256 hash of submitted XML |  |
| **afnor_flow_type** | **String** |  | [optional] |
| **afnor_response** | **Hash&lt;String, Object&gt;** |  | [optional] |
| **message** | **String** | Status message |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SubmitEReportingResponse.new(
  flow_id: null,
  report_id: null,
  tracking_id: null,
  flow_type: null,
  sha256: null,
  afnor_flow_type: null,
  afnor_response: null,
  message: null
)
```

