# FactPulse::BoundingBoxSchema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x0** | **Float** | Coordonnée X gauche |  |
| **y0** | **Float** | Coordonnée Y bas |  |
| **x1** | **Float** | Coordonnée X droite |  |
| **y1** | **Float** | Coordonnée Y haut |  |
| **page** | **Integer** | Numéro de page (0-indexed) | [optional][default to 0] |
| **width** | **Float** | Largeur de la zone |  |
| **height** | **Float** | Hauteur de la zone |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::BoundingBoxSchema.new(
  x0: null,
  y0: null,
  x1: null,
  y1: null,
  page: null,
  width: null,
  height: null
)
```

