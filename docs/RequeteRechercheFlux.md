# FactPulse::RequeteRechercheFlux

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date_maj_apres** | **Time** |  | [optional] |
| **date_maj_avant** | **Time** |  | [optional] |
| **type_flux** | [**Array&lt;TypeFlux&gt;**](TypeFlux.md) |  | [optional] |
| **direction_flux** | [**Array&lt;DirectionFlux&gt;**](DirectionFlux.md) |  | [optional] |
| **tracking_id** | **String** |  | [optional] |
| **flow_id** | **String** |  | [optional] |
| **statut_acquittement** | [**StatutAcquittement**](StatutAcquittement.md) |  | [optional] |
| **offset** | **Integer** | Décalage pour la pagination | [optional][default to 0] |
| **limit** | **Integer** | Nombre maximum de résultats (max 100) | [optional][default to 25] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::RequeteRechercheFlux.new(
  date_maj_apres: null,
  date_maj_avant: null,
  type_flux: null,
  direction_flux: null,
  tracking_id: null,
  flow_id: null,
  statut_acquittement: null,
  offset: null,
  limit: null
)
```

