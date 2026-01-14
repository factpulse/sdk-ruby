# FactPulse::SearchServicesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_code** | **Integer** | Return code (0 &#x3D; success) |  |
| **message** | **String** | Response message |  |
| **services** | [**Array&lt;StructureService&gt;**](StructureService.md) | List of services | [optional] |
| **total** | **Integer** | Number of services | [optional][default to 0] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::SearchServicesResponse.new(
  return_code: null,
  message: null,
  services: null,
  total: null
)
```

