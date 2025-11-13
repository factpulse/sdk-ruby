# FactPulse::ReponseHealthcheckAFNOR

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_service_ok** | **Boolean** | État du Flow Service API |  |
| **directory_service_ok** | **Boolean** | État du Directory Service API |  |
| **message** | **String** | Message descriptif de l&#39;état |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ReponseHealthcheckAFNOR.new(
  flow_service_ok: null,
  directory_service_ok: null,
  message: null
)
```

