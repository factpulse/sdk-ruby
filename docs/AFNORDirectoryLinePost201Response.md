# OpenapiClient::AFNORDirectoryLinePost201Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_instance** | **Integer** | Platform instance identifier in the directory | [optional] |
| **addressing_identifier** | **String** | Addressing identifier of the directory line. | [optional] |
| **date_from** | **Date** | Effective start date of the directory line.. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::AFNORDirectoryLinePost201Response.new(
  id_instance: 120,
  addressing_identifier: dcsc456sdcsdcs556,
  date_from: 2023-01-01
)
```

