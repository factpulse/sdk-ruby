# FactPulse::ParametresStructure

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code_service_doit_etre_renseigne** | **Boolean** | Le code service est obligatoire | [optional][default to false] |
| **numero_ej_doit_etre_renseigne** | **Boolean** | Le numéro d&#39;engagement est obligatoire | [optional][default to false] |
| **gestion_numero_ej_ou_code_service** | **Boolean** | Gestion EJ ou code service activée | [optional][default to false] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ParametresStructure.new(
  code_service_doit_etre_renseigne: null,
  numero_ej_doit_etre_renseigne: null,
  gestion_numero_ej_ou_code_service: null
)
```

