# FactPulse::GenerateCDARResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **document_id** | **String** |  |  |
| **xml** | **String** | XML CDAR généré |  |
| **xml_size** | **Integer** | Taille du XML en octets |  |
| **sha256** | **String** | Hash SHA256 du XML |  |
| **message** | **String** | Message de succès |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::GenerateCDARResponse.new(
  document_id: null,
  xml: null,
  xml_size: null,
  sha256: null,
  message: null
)
```

