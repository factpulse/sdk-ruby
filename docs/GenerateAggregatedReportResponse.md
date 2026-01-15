# FactPulse::GenerateAggregatedReportResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **report_id** | **String** | Report identifier |  |
| **transmission_type** | **String** | Transmission type (IN or RE) |  |
| **flow_type** | **String** | AFNOR FlowType determined from content |  |
| **xml** | **String** | Generated XML content |  |
| **xml_size** | **Integer** | XML size in bytes |  |
| **content_summary** | **Hash&lt;String, Object&gt;** | Summary of content (counts by flux type) |  |
| **message** | **String** | Status message |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GenerateAggregatedReportResponse.new(
  report_id: null,
  transmission_type: null,
  flow_type: null,
  xml: null,
  xml_size: null,
  content_summary: null,
  message: null
)
```

