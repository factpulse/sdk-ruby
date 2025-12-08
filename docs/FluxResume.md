# FactPulse::FluxResume

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **flow_id** | **String** |  |  |
| **tracking_id** | **String** |  | [optional] |
| **nom** | **String** |  |  |
| **type_flux** | **String** |  | [optional] |
| **direction_flux** | **String** |  | [optional] |
| **statut_acquittement** | **String** |  | [optional] |
| **date_creation** | **String** |  | [optional] |
| **date_maj** | **String** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::FluxResume.new(
  flow_id: null,
  tracking_id: null,
  nom: null,
  type_flux: null,
  direction_flux: null,
  statut_acquittement: null,
  date_creation: null,
  date_maj: null
)
```

