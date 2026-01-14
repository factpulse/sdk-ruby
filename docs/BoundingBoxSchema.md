# OpenapiClient::BoundingBoxSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x0** | **Float** | Left X coordinate |  |
| **y0** | **Float** | Bottom Y coordinate |  |
| **x1** | **Float** | Right X coordinate |  |
| **y1** | **Float** | Top Y coordinate |  |
| **page** | **Integer** | Page number (0-indexed) | [optional][default to 0] |
| **width** | **Float** | Area width |  |
| **height** | **Float** | Area height |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BoundingBoxSchema.new(
  x0: null,
  y0: null,
  x1: null,
  y1: null,
  page: null,
  width: null,
  height: null
)
```

