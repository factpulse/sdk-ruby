# FactPulse::ReponseVerificationSucces

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **est_conforme** | **Boolean** | True si aucun écart critique |  |
| **score_conformite** | **Float** | Score de conformité (0-100%) |  |
| **champs_verifies** | **Integer** | Nombre de champs vérifiés | [optional][default to 0] |
| **champs_conformes** | **Integer** | Nombre de champs conformes | [optional][default to 0] |
| **est_facturx** | **Boolean** | True si le PDF contient du XML Factur-X | [optional][default to false] |
| **profil_facturx** | **String** |  | [optional] |
| **champs** | [**Array&lt;ChampVerifieSchema&gt;**](ChampVerifieSchema.md) | Liste des champs vérifiés avec valeurs, statuts et coordonnées PDF | [optional] |
| **notes_obligatoires** | [**Array&lt;NoteObligatoireSchema&gt;**](NoteObligatoireSchema.md) | Notes obligatoires (PMT, PMD, AAB) avec localisation PDF | [optional] |
| **dimensions_pages** | [**Array&lt;DimensionPageSchema&gt;**](DimensionPageSchema.md) | Dimensions de chaque page du PDF (largeur, hauteur) | [optional] |
| **avertissements** | **Array&lt;String&gt;** | Avertissements non bloquants | [optional] |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ReponseVerificationSucces.new(
  est_conforme: null,
  score_conformite: null,
  champs_verifies: null,
  champs_conformes: null,
  est_facturx: null,
  profil_facturx: null,
  champs: null,
  notes_obligatoires: null,
  dimensions_pages: null,
  avertissements: null
)
```

