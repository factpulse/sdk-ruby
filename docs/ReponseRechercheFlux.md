# FactPulse::ReponseRechercheFlux

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **total** | **Integer** | Nombre total de résultats |  |
| **offset** | **Integer** | Décalage appliqué |  |
| **limit** | **Integer** | Limite de résultats |  |
| **resultats** | [**Array&lt;FluxResume&gt;**](FluxResume.md) | Liste des flux trouvés |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ReponseRechercheFlux.new(
  total: null,
  offset: null,
  limit: null,
  resultats: null
)
```

