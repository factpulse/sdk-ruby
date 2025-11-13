# FactPulse::DestinationAFNOR

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  | [optional][default to &#39;afnor&#39;] |
| **credentials** | [**CredentialsAFNOR**](CredentialsAFNOR.md) |  | [optional] |
| **flow_syntax** | **String** | Syntaxe du flux à envoyer | [optional][default to &#39;Factur-X&#39;] |
| **tracking_id** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::DestinationAFNOR.new(
  type: null,
  credentials: null,
  flow_syntax: null,
  tracking_id: null
)
```

