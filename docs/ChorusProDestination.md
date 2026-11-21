# FactPulse::ChorusProDestination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  | [optional][default to &#39;chorus_pro&#39;] |
| **credentials** | [**FactureElectroniqueRestApiSchemasProcessingChorusProCredentials**](FactureElectroniqueRestApiSchemasProcessingChorusProCredentials.md) |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ChorusProDestination.new(
  type: null,
  credentials: null
)
```

