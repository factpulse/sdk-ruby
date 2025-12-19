# FactPulse::AFNORDestination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  | [optional][default to &#39;afnor&#39;] |
| **credentials** | [**AFNORCredentials**](AFNORCredentials.md) |  | [optional] |
| **flow_syntax** | **String** | Flow syntax to send | [optional][default to &#39;Factur-X&#39;] |
| **tracking_id** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::AFNORDestination.new(
  type: null,
  credentials: null,
  flow_syntax: null,
  tracking_id: null
)
```

