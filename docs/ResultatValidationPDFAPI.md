# FactPulse::ResultatValidationPDFAPI

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **est_conforme** | **Boolean** | True si le PDF est conforme à tous les critères (XML, PDF/A, XMP) |  |
| **xml_present** | **Boolean** | True si un XML Factur-X est embarqué dans le PDF |  |
| **xml_conforme** | **Boolean** | True si le XML Factur-X est conforme aux règles Schematron |  |
| **profil_detecte** | **String** |  | [optional] |
| **erreurs_xml** | **Array&lt;String&gt;** | Liste des erreurs de validation XML | [optional] |
| **pdfa_conforme** | **Boolean** | True si le PDF est conforme PDF/A |  |
| **version_pdfa** | **String** |  | [optional] |
| **methode_validation_pdfa** | **String** | Méthode utilisée pour la validation PDF/A (metadata ou verapdf) | [optional][default to &#39;metadata&#39;] |
| **regles_validees** | **Integer** |  | [optional] |
| **regles_echouees** | **Integer** |  | [optional] |
| **erreurs_pdfa** | **Array&lt;String&gt;** | Liste des erreurs de conformité PDF/A | [optional] |
| **avertissements_pdfa** | **Array&lt;String&gt;** | Liste des avertissements PDF/A | [optional] |
| **xmp_present** | **Boolean** | True si des métadonnées XMP sont présentes |  |
| **xmp_conforme_facturx** | **Boolean** | True si les métadonnées XMP contiennent des informations Factur-X |  |
| **profil_xmp** | **String** |  | [optional] |
| **version_xmp** | **String** |  | [optional] |
| **erreurs_xmp** | **Array&lt;String&gt;** | Liste des erreurs de métadonnées XMP | [optional] |
| **metadonnees_xmp** | **Hash&lt;String, Object&gt;** | Métadonnées XMP extraites du PDF | [optional] |
| **est_signe** | **Boolean** | True si le PDF contient au moins une signature |  |
| **nombre_signatures** | **Integer** | Nombre de signatures électroniques trouvées | [optional][default to 0] |
| **signatures** | [**Array&lt;InformationSignatureAPI&gt;**](InformationSignatureAPI.md) | Liste des signatures trouvées avec leurs informations | [optional] |
| **erreurs_signatures** | **Array&lt;String&gt;** | Liste des erreurs lors de l&#39;analyse des signatures | [optional] |
| **message_resume** | **String** | Message résumant le résultat de la validation |  |

## Example

```ruby
require 'factpulse'

instance = FactPulse::ResultatValidationPDFAPI.new(
  est_conforme: null,
  xml_present: null,
  xml_conforme: null,
  profil_detecte: null,
  erreurs_xml: null,
  pdfa_conforme: null,
  version_pdfa: null,
  methode_validation_pdfa: null,
  regles_validees: null,
  regles_echouees: null,
  erreurs_pdfa: null,
  avertissements_pdfa: null,
  xmp_present: null,
  xmp_conforme_facturx: null,
  profil_xmp: null,
  version_xmp: null,
  erreurs_xmp: null,
  metadonnees_xmp: null,
  est_signe: null,
  nombre_signatures: null,
  signatures: null,
  erreurs_signatures: null,
  message_resume: null
)
```

