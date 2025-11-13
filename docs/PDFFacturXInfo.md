# FactPulse::PDFFacturXInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **taille** | **Integer** | Taille du PDF en octets |  |
| **profil** | **String** | Profil Factur-X utilisé |  |
| **signe** | **Boolean** | PDF signé électroniquement | [optional][default to false] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::PDFFacturXInfo.new(
  taille: null,
  profil: null,
  signe: null
)
```

