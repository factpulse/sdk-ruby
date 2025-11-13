# FactPulse::ResultatAFNOR

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** | Identifiant du flux soumis |  |
| **tracking_id** | **String** |  | [optional] |
| **sha256** | **String** | Hash SHA-256 du fichier soumis |  |
| **flow_syntax** | **String** | Syntaxe du flux |  |
| **flow_profile** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ResultatAFNOR.new(
  flow_id: null,
  tracking_id: null,
  sha256: null,
  flow_syntax: null,
  flow_profile: null
)
```

