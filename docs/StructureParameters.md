# OpenapiClient::StructureParameters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **service_code_required** | **Boolean** | Service code is mandatory | [optional][default to false] |
| **engagement_number_required** | **Boolean** | Engagement number is mandatory | [optional][default to false] |
| **engagement_or_service_management** | **Boolean** | EJ or service code management enabled | [optional][default to false] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::StructureParameters.new(
  service_code_required: null,
  engagement_number_required: null,
  engagement_or_service_management: null
)
```

