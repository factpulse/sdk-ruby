# FactPulse::StatutTache

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_tache** | **String** |  |  |
| **statut** | [**StatutCelery**](StatutCelery.md) | Statut Celery de la tâche (PENDING, STARTED, SUCCESS, FAILURE, RETRY) |  |
| **resultat** | **Hash&lt;String, Object&gt;** |  | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::StatutTache.new(
  id_tache: null,
  statut: null,
  resultat: null
)
```

