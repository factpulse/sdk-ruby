# OpenapiClient::SearchStructureResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_code** | **Integer** | Return code (0 &#x3D; success) |  |
| **message** | **String** | Return message |  |
| **structures** | [**Array&lt;StructureInfo&gt;**](StructureInfo.md) |  | [optional] |
| **total** | **Integer** | Total number of results | [optional][default to 0] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::SearchStructureResponse.new(
  return_code: null,
  message: null,
  structures: null,
  total: null
)
```

