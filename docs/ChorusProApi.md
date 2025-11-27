# FactPulse::ChorusProApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post**](ChorusProApi.md#ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post) | **POST** /api/v1/chorus-pro/transverses/ajouter-fichier | Ajouter une pièce jointe |
| [**completer_facture_api_v1_chorus_pro_factures_completer_post**](ChorusProApi.md#completer_facture_api_v1_chorus_pro_factures_completer_post) | **POST** /api/v1/chorus-pro/factures/completer | Compléter une facture suspendue (Fournisseur) |
| [**consulter_facture_api_v1_chorus_pro_factures_consulter_post**](ChorusProApi.md#consulter_facture_api_v1_chorus_pro_factures_consulter_post) | **POST** /api/v1/chorus-pro/factures/consulter | Consulter le statut d&#39;une facture |
| [**consulter_structure_api_v1_chorus_pro_structures_consulter_post**](ChorusProApi.md#consulter_structure_api_v1_chorus_pro_structures_consulter_post) | **POST** /api/v1/chorus-pro/structures/consulter | Consulter les détails d&#39;une structure |
| [**lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get**](ChorusProApi.md#lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get) | **GET** /api/v1/chorus-pro/structures/{id_structure_cpp}/services | Lister les services d&#39;une structure |
| [**obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post**](ChorusProApi.md#obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post) | **POST** /api/v1/chorus-pro/structures/obtenir-id-depuis-siret | Utilitaire : Obtenir l&#39;ID Chorus Pro depuis un SIRET |
| [**rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post**](ChorusProApi.md#rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post) | **POST** /api/v1/chorus-pro/factures/rechercher-destinataire | Rechercher factures reçues (Destinataire) |
| [**rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post**](ChorusProApi.md#rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post) | **POST** /api/v1/chorus-pro/factures/rechercher-fournisseur | Rechercher factures émises (Fournisseur) |
| [**rechercher_structures_api_v1_chorus_pro_structures_rechercher_post**](ChorusProApi.md#rechercher_structures_api_v1_chorus_pro_structures_rechercher_post) | **POST** /api/v1/chorus-pro/structures/rechercher | Rechercher des structures Chorus Pro |
| [**recycler_facture_api_v1_chorus_pro_factures_recycler_post**](ChorusProApi.md#recycler_facture_api_v1_chorus_pro_factures_recycler_post) | **POST** /api/v1/chorus-pro/factures/recycler | Recycler une facture (Fournisseur) |
| [**soumettre_facture_api_v1_chorus_pro_factures_soumettre_post**](ChorusProApi.md#soumettre_facture_api_v1_chorus_pro_factures_soumettre_post) | **POST** /api/v1/chorus-pro/factures/soumettre | Soumettre une facture à Chorus Pro |
| [**telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post**](ChorusProApi.md#telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post) | **POST** /api/v1/chorus-pro/factures/telecharger-groupe | Télécharger un groupe de factures |
| [**traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post**](ChorusProApi.md#traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post) | **POST** /api/v1/chorus-pro/factures/traiter-facture-recue | Traiter une facture reçue (Destinataire) |
| [**valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post**](ChorusProApi.md#valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post) | **POST** /api/v1/chorus-pro/factures/valideur/consulter | Consulter une facture (Valideur) |
| [**valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post**](ChorusProApi.md#valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post) | **POST** /api/v1/chorus-pro/factures/valideur/rechercher | Rechercher factures à valider (Valideur) |
| [**valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post**](ChorusProApi.md#valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post) | **POST** /api/v1/chorus-pro/factures/valideur/traiter | Valider ou refuser une facture (Valideur) |


## ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post

> Object ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post(request_body)

Ajouter une pièce jointe

Ajoute une pièce jointe au compte utilisateur courant.      **Taille max** : 10 Mo par fichier      **Payload exemple** :     ```json     {       \"pieceJointeFichier\": \"JVBERi0xLjQKJeLjz9MKNSAwIG9iago8P...\",       \"pieceJointeNom\": \"bon_commande.pdf\",       \"pieceJointeTypeMime\": \"application/pdf\",       \"pieceJointeExtension\": \"PDF\"     }     ```      **Retour** : L'ID de la pièce jointe (`pieceJointeIdFichier`) à utiliser ensuite dans `/factures/completer`.      **Extensions acceptées** : PDF, JPG, PNG, ZIP, XML, etc.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Ajouter une pièce jointe
  result = api_instance.ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post: #{e}"
end
```

#### Using the ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info(request_body)

```ruby
begin
  # Ajouter une pièce jointe
  data, status_code, headers = api_instance.ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## completer_facture_api_v1_chorus_pro_factures_completer_post

> Object completer_facture_api_v1_chorus_pro_factures_completer_post(request_body)

Compléter une facture suspendue (Fournisseur)

Complète une facture au statut SUSPENDUE en ajoutant des pièces jointes ou un commentaire.      **Statut requis** : SUSPENDUE      **Actions possibles** :     - Ajouter des pièces jointes (justificatifs, bons de commande, etc.)     - Modifier le commentaire      **Payload exemple** :     ```json     {       \"identifiantFactureCPP\": 12345,       \"commentaire\": \"Voici les justificatifs demandés\",       \"listePiecesJointes\": [         {           \"pieceJointeIdFichier\": 98765,           \"pieceJointeNom\": \"bon_commande.pdf\"         }       ]     }     ```      **Note** : Les pièces jointes doivent d'abord être uploadées via `/transverses/ajouter-fichier`.      **Après complétion** : La facture repasse au statut MISE_A_DISPOSITION.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Compléter une facture suspendue (Fournisseur)
  result = api_instance.completer_facture_api_v1_chorus_pro_factures_completer_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->completer_facture_api_v1_chorus_pro_factures_completer_post: #{e}"
end
```

#### Using the completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info(request_body)

```ruby
begin
  # Compléter une facture suspendue (Fournisseur)
  data, status_code, headers = api_instance.completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## consulter_facture_api_v1_chorus_pro_factures_consulter_post

> <ConsulterFactureResponse> consulter_facture_api_v1_chorus_pro_factures_consulter_post(consulter_facture_request)

Consulter le statut d'une facture

Récupère les informations et le statut actuel d'une facture soumise à Chorus Pro.      **Retour** :     - Numéro et date de facture     - Montant TTC     - **Statut courant** : SOUMISE, VALIDEE, REJETEE, SUSPENDUE, MANDATEE, MISE_EN_PAIEMENT, etc.     - Structure destinataire      **Cas d'usage** :     - Suivre l'évolution du traitement d'une facture     - Vérifier si une facture a été validée ou rejetée     - Obtenir la date de mise en paiement      **Polling** : Appelez cet endpoint régulièrement pour suivre l'évolution du statut.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
consulter_facture_request = FactPulse::ConsulterFactureRequest.new({identifiant_facture_cpp: 37}) # ConsulterFactureRequest | 

begin
  # Consulter le statut d'une facture
  result = api_instance.consulter_facture_api_v1_chorus_pro_factures_consulter_post(consulter_facture_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_facture_api_v1_chorus_pro_factures_consulter_post: #{e}"
end
```

#### Using the consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConsulterFactureResponse>, Integer, Hash)> consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info(consulter_facture_request)

```ruby
begin
  # Consulter le statut d'une facture
  data, status_code, headers = api_instance.consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info(consulter_facture_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConsulterFactureResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **consulter_facture_request** | [**ConsulterFactureRequest**](ConsulterFactureRequest.md) |  |  |

### Return type

[**ConsulterFactureResponse**](ConsulterFactureResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## consulter_structure_api_v1_chorus_pro_structures_consulter_post

> <ConsulterStructureResponse> consulter_structure_api_v1_chorus_pro_structures_consulter_post(consulter_structure_request)

Consulter les détails d'une structure

Récupère les informations détaillées d'une structure Chorus Pro.       **Retour** :     - Raison sociale     - Numéro de TVA intracommunautaire     - Email de contact     - **Paramètres obligatoires** : Indique si le code service et/ou numéro d'engagement sont requis pour soumettre une facture      **Étape typique** : Appelée après `rechercher-structures` pour savoir quels champs sont obligatoires avant de soumettre une facture.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
consulter_structure_request = FactPulse::ConsulterStructureRequest.new({id_structure_cpp: 37}) # ConsulterStructureRequest | 

begin
  # Consulter les détails d'une structure
  result = api_instance.consulter_structure_api_v1_chorus_pro_structures_consulter_post(consulter_structure_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_structure_api_v1_chorus_pro_structures_consulter_post: #{e}"
end
```

#### Using the consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ConsulterStructureResponse>, Integer, Hash)> consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info(consulter_structure_request)

```ruby
begin
  # Consulter les détails d'une structure
  data, status_code, headers = api_instance.consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info(consulter_structure_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ConsulterStructureResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **consulter_structure_request** | [**ConsulterStructureRequest**](ConsulterStructureRequest.md) |  |  |

### Return type

[**ConsulterStructureResponse**](ConsulterStructureResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get

> <RechercherServicesResponse> lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get(id_structure_cpp)

Lister les services d'une structure

Récupère la liste des services actifs d'une structure publique.      **Cas d'usage** :     - Lister les services disponibles pour une administration     - Vérifier qu'un code service existe avant de soumettre une facture      **Retour** :     - Liste des services avec leur code, libellé et statut (actif/inactif)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
id_structure_cpp = 56 # Integer | 

begin
  # Lister les services d'une structure
  result = api_instance.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get(id_structure_cpp)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get: #{e}"
end
```

#### Using the lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RechercherServicesResponse>, Integer, Hash)> lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info(id_structure_cpp)

```ruby
begin
  # Lister les services d'une structure
  data, status_code, headers = api_instance.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info(id_structure_cpp)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RechercherServicesResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id_structure_cpp** | **Integer** |  |  |

### Return type

[**RechercherServicesResponse**](RechercherServicesResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post

> <ObtenirIdChorusProResponse> obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post(obtenir_id_chorus_pro_request)

Utilitaire : Obtenir l'ID Chorus Pro depuis un SIRET

**Utilitaire pratique** pour obtenir l'ID Chorus Pro d'une structure à partir de son SIRET.       Cette fonction wrapper combine :     1. Recherche de la structure par SIRET     2. Extraction de l'`id_structure_cpp` si une seule structure est trouvée      **Retour** :     - `id_structure_cpp` : ID Chorus Pro (0 si non trouvé ou si plusieurs résultats)     - `designation_structure` : Nom de la structure (si trouvée)     - `message` : Message explicatif      **Cas d'usage** :     - Raccourci pour obtenir directement l'ID Chorus Pro avant de soumettre une facture     - Alternative simplifiée à `rechercher-structures` + extraction manuelle de l'ID      **Note** : Si plusieurs structures correspondent au SIRET (rare), retourne 0 et un message d'erreur.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
obtenir_id_chorus_pro_request = FactPulse::ObtenirIdChorusProRequest.new({siret: 'siret_example'}) # ObtenirIdChorusProRequest | 

begin
  # Utilitaire : Obtenir l'ID Chorus Pro depuis un SIRET
  result = api_instance.obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post(obtenir_id_chorus_pro_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post: #{e}"
end
```

#### Using the obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ObtenirIdChorusProResponse>, Integer, Hash)> obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info(obtenir_id_chorus_pro_request)

```ruby
begin
  # Utilitaire : Obtenir l'ID Chorus Pro depuis un SIRET
  data, status_code, headers = api_instance.obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info(obtenir_id_chorus_pro_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ObtenirIdChorusProResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **obtenir_id_chorus_pro_request** | [**ObtenirIdChorusProRequest**](ObtenirIdChorusProRequest.md) |  |  |

### Return type

[**ObtenirIdChorusProResponse**](ObtenirIdChorusProResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post

> Object rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post(request_body)

Rechercher factures reçues (Destinataire)

Recherche les factures reçues par le destinataire connecté.      **Filtres** :     - Téléchargée / non téléchargée     - Dates de réception     - Statut (MISE_A_DISPOSITION, SUSPENDUE, etc.)     - Fournisseur      **Indicateur utile** : `factureTelechargeeParDestinataire` permet de savoir si la facture a déjà été téléchargée.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Rechercher factures reçues (Destinataire)
  result = api_instance.rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post: #{e}"
end
```

#### Using the rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info(request_body)

```ruby
begin
  # Rechercher factures reçues (Destinataire)
  data, status_code, headers = api_instance.rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post

> Object rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post(request_body)

Rechercher factures émises (Fournisseur)

Recherche les factures émises par le fournisseur connecté.      **Filtres disponibles** :     - Numéro de facture     - Dates (début/fin)     - Statut     - Structure destinataire     - Montant      **Cas d'usage** :     - Suivi des factures émises     - Vérification des statuts     - Export pour comptabilité

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Rechercher factures émises (Fournisseur)
  result = api_instance.rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post: #{e}"
end
```

#### Using the rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info(request_body)

```ruby
begin
  # Rechercher factures émises (Fournisseur)
  data, status_code, headers = api_instance.rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## rechercher_structures_api_v1_chorus_pro_structures_rechercher_post

> <RechercherStructureResponse> rechercher_structures_api_v1_chorus_pro_structures_rechercher_post(rechercher_structure_request)

Rechercher des structures Chorus Pro

Recherche des structures (entreprises, administrations) enregistrées sur Chorus Pro.      **Cas d'usage** :     - Trouver l'ID Chorus Pro d'une structure à partir de son SIRET     - Vérifier si une structure est enregistrée sur Chorus Pro     - Lister les structures correspondant à des critères      **Filtres disponibles** :     - Identifiant (SIRET, SIREN, etc.)     - Raison sociale     - Type d'identifiant     - Structures privées uniquement      **Étape typique** : Appelée avant `soumettre-facture` pour obtenir l'`id_structure_cpp` du destinataire.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
rechercher_structure_request = FactPulse::RechercherStructureRequest.new # RechercherStructureRequest | 

begin
  # Rechercher des structures Chorus Pro
  result = api_instance.rechercher_structures_api_v1_chorus_pro_structures_rechercher_post(rechercher_structure_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_structures_api_v1_chorus_pro_structures_rechercher_post: #{e}"
end
```

#### Using the rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RechercherStructureResponse>, Integer, Hash)> rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info(rechercher_structure_request)

```ruby
begin
  # Rechercher des structures Chorus Pro
  data, status_code, headers = api_instance.rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info(rechercher_structure_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RechercherStructureResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rechercher_structure_request** | [**RechercherStructureRequest**](RechercherStructureRequest.md) |  |  |

### Return type

[**RechercherStructureResponse**](RechercherStructureResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## recycler_facture_api_v1_chorus_pro_factures_recycler_post

> Object recycler_facture_api_v1_chorus_pro_factures_recycler_post(request_body)

Recycler une facture (Fournisseur)

Recycle une facture au statut A_RECYCLER en modifiant les données d'acheminement.      **Statut requis** : A_RECYCLER      **Champs modifiables** :     - Destinataire (`idStructureCPP`)     - Code service     - Numéro d'engagement      **Cas d'usage** :     - Erreur de destinataire     - Changement de service facturation     - Mise à jour du numéro d'engagement      **Payload exemple** :     ```json     {       \"identifiantFactureCPP\": 12345,       \"idStructureCPP\": 67890,       \"codeService\": \"SERVICE_01\",       \"numeroEngagement\": \"ENG2024001\"     }     ```      **Note** : La facture conserve son numéro et ses montants, seuls les champs d'acheminement changent.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Recycler une facture (Fournisseur)
  result = api_instance.recycler_facture_api_v1_chorus_pro_factures_recycler_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->recycler_facture_api_v1_chorus_pro_factures_recycler_post: #{e}"
end
```

#### Using the recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info(request_body)

```ruby
begin
  # Recycler une facture (Fournisseur)
  data, status_code, headers = api_instance.recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## soumettre_facture_api_v1_chorus_pro_factures_soumettre_post

> <SoumettreFactureResponse> soumettre_facture_api_v1_chorus_pro_factures_soumettre_post(soumettre_facture_request)

Soumettre une facture à Chorus Pro

Soumet une facture électronique à une structure publique via Chorus Pro.       **📋 Workflow complet** :     1. **Uploader le PDF Factur-X** via `/transverses/ajouter-fichier` → récupérer `pieceJointeId`     2. **Obtenir l'ID structure** via `/structures/rechercher` ou `/structures/obtenir-id-depuis-siret`     3. **Vérifier les paramètres obligatoires** via `/structures/consulter`     4. **Soumettre la facture** avec le `piece_jointe_principale_id` obtenu à l'étape 1      **Pré-requis** :     1. Avoir l'`id_structure_cpp` du destinataire (via `/structures/rechercher`)     2. Connaître les paramètres obligatoires (via `/structures/consulter`) :        - Code service si `code_service_doit_etre_renseigne=true`        - Numéro d'engagement si `numero_ej_doit_etre_renseigne=true`     3. Avoir uploadé le PDF Factur-X (via `/transverses/ajouter-fichier`)      **Format attendu** :     - `piece_jointe_principale_id` : ID retourné par `/transverses/ajouter-fichier`     - Montants : Chaînes de caractères avec 2 décimales (ex: \"1250.50\")     - Dates : Format ISO 8601 (YYYY-MM-DD)      **Retour** :     - `identifiant_facture_cpp` : ID Chorus Pro de la facture créée     - `numero_flux_depot` : Numéro de suivi du dépôt      **Statuts possibles après soumission** :     - SOUMISE : En attente de validation     - VALIDEE : Validée par le destinataire     - REJETEE : Rejetée (erreur de données ou refus métier)     - SUSPENDUE : En attente d'informations complémentaires      **Note** : Utilisez `/factures/consulter` pour suivre l'évolution du statut.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
soumettre_facture_request = FactPulse::SoumettreFactureRequest.new({numero_facture: 'numero_facture_example', date_facture: 'date_facture_example', id_structure_cpp: 37, montant_ht_total: FactPulse::MontantHtTotal.new, montant_tva: FactPulse::MontantTva.new, montant_ttc_total: FactPulse::MontantTtcTotal.new}) # SoumettreFactureRequest | 

begin
  # Soumettre une facture à Chorus Pro
  result = api_instance.soumettre_facture_api_v1_chorus_pro_factures_soumettre_post(soumettre_facture_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->soumettre_facture_api_v1_chorus_pro_factures_soumettre_post: #{e}"
end
```

#### Using the soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SoumettreFactureResponse>, Integer, Hash)> soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info(soumettre_facture_request)

```ruby
begin
  # Soumettre une facture à Chorus Pro
  data, status_code, headers = api_instance.soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info(soumettre_facture_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SoumettreFactureResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **soumettre_facture_request** | [**SoumettreFactureRequest**](SoumettreFactureRequest.md) |  |  |

### Return type

[**SoumettreFactureResponse**](SoumettreFactureResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post

> Object telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post(request_body)

Télécharger un groupe de factures

Télécharge une ou plusieurs factures (max 10 recommandé) avec leurs pièces jointes.      **Formats disponibles** :     - PDF : Fichier PDF uniquement     - XML : Fichier XML uniquement     - ZIP : Archive contenant PDF + XML + pièces jointes      **Taille maximale** : 120 Mo par téléchargement      **Payload exemple** :     ```json     {       \"listeIdentifiantsFactureCPP\": [12345, 12346],       \"inclurePiecesJointes\": true,       \"formatFichier\": \"ZIP\"     }     ```      **Retour** : Le fichier est encodé en base64 dans le champ `fichierBase64`.      **Note** : Le flag `factureTelechargeeParDestinataire` est mis à jour automatiquement.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Télécharger un groupe de factures
  result = api_instance.telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post: #{e}"
end
```

#### Using the telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info(request_body)

```ruby
begin
  # Télécharger un groupe de factures
  data, status_code, headers = api_instance.telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post

> Object traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post(request_body)

Traiter une facture reçue (Destinataire)

Change le statut d'une facture reçue.      **Statuts possibles** :     - MISE_A_DISPOSITION : Facture acceptée     - SUSPENDUE : En attente d'informations complémentaires (motif obligatoire)     - REJETEE : Facture refusée (motif obligatoire)     - MANDATEE : Facture mandatée     - MISE_EN_PAIEMENT : Facture en cours de paiement     - COMPTABILISEE : Facture comptabilisée     - MISE_A_DISPOSITION_COMPTABLE : Mise à disposition comptable     - A_RECYCLER : À recycler     - COMPLETEE : Complétée     - SERVICE-FAIT : Service fait     - PRISE_EN_COMPTE_DESTINATAIRE : Prise en compte     - TRANSMISE_MOA : Transmise à la MOA      **Payload exemple** :     ```json     {       \"identifiantFactureCPP\": 12345,       \"nouveauStatut\": \"REJETEE\",       \"motifRejet\": \"Facture en double\",       \"commentaire\": \"Facture déjà reçue sous la référence ABC123\"     }     ```      **Règles** :     - Un motif est **obligatoire** pour SUSPENDUE et REJETEE     - Seuls certains statuts sont autorisés selon le statut actuel de la facture

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Traiter une facture reçue (Destinataire)
  result = api_instance.traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post: #{e}"
end
```

#### Using the traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info(request_body)

```ruby
begin
  # Traiter une facture reçue (Destinataire)
  data, status_code, headers = api_instance.traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post

> Object valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post(request_body)

Consulter une facture (Valideur)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Consulter une facture (Valideur)
  result = api_instance.valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post: #{e}"
end
```

#### Using the valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info(request_body)

```ruby
begin
  # Consulter une facture (Valideur)
  data, status_code, headers = api_instance.valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post

> Object valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post(request_body)

Rechercher factures à valider (Valideur)

Recherche les factures en attente de validation par le valideur connecté.      **Rôle** : Valideur dans le circuit de validation interne.      **Filtres** : Dates, structure, service, etc.

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Rechercher factures à valider (Valideur)
  result = api_instance.valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post: #{e}"
end
```

#### Using the valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info(request_body)

```ruby
begin
  # Rechercher factures à valider (Valideur)
  data, status_code, headers = api_instance.valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post

> Object valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post(request_body)

Valider ou refuser une facture (Valideur)

Valide ou refuse une facture en attente de validation.      **Actions** :     - Valider : La facture passe au statut suivant du circuit     - Refuser : La facture est rejetée (motif obligatoire)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ChorusProApi.new
request_body = { key: 3.56} # Hash<String, Object> | 

begin
  # Valider ou refuser une facture (Valideur)
  result = api_instance.valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post(request_body)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post: #{e}"
end
```

#### Using the valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info(request_body)

```ruby
begin
  # Valider ou refuser une facture (Valideur)
  data, status_code, headers = api_instance.valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info(request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling ChorusProApi->valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_body** | [**Hash&lt;String, Object&gt;**](Object.md) |  |  |

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

