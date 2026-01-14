# OpenapiClient::ReportPeriod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **Date** | Period start date (YYYY-MM-DD) |  |
| **end_date** | **Date** | Period end date (YYYY-MM-DD) |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ReportPeriod.new(
  start_date: 2025-01-01,
  end_date: 2025-01-31
)
```

