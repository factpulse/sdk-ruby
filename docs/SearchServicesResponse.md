# FactPulse::SearchServicesResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_code** | **Integer** |  |  |
| **message** | **String** |  |  |
| **services** | [**Array&lt;StructureService&gt;**](StructureService.md) |  | [optional] |
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

