# FactPulse::ProcessingEndpointsUnifisApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post**](ProcessingEndpointsUnifisApi.md#soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post) | **POST** /api/v1/traitement/factures/soumettre-complete | Soumettre une facture complète (génération + signature + soumission) |
| [**soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post**](ProcessingEndpointsUnifisApi.md#soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post) | **POST** /api/v1/traitement/factures/soumettre-complete-async | Soumettre une facture complète (asynchrone avec Celery) |


## soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post

> <SoumettreFactureCompleteResponse> soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post(soumettre_facture_complete_request)

Soumettre une facture complète (génération + signature + soumission)

Endpoint unifié pour soumettre une facture complète vers différentes destinations.      **Workflow automatisé :**     1. **Auto-enrichissement** (optionnel) : récupère les données via APIs publiques et Chorus Pro/AFNOR     2. **Génération PDF Factur-X** : crée un PDF/A-3 avec XML embarqué     3. **Signature électronique** (optionnelle) : signe le PDF avec un certificat     4. **Soumission** : envoie vers la destination choisie (Chorus Pro ou AFNOR PDP)      **Destinations supportées :**     - **Chorus Pro** : plateforme B2G française (factures vers secteur public)     - **AFNOR PDP** : Plateformes de Dématérialisation Partenaires      **Credentials de destination - 2 modes disponibles :**      **Mode 1 - Récupération via JWT (recommandé) :**     - Les credentials sont récupérés automatiquement via le `client_uid` du JWT     - Ne pas fournir le champ `credentials` dans `destination`     - Architecture 0-trust : aucun secret dans le payload     - Exemple : `\"destination\": {\"type\": \"chorus_pro\"}`      **Mode 2 - Credentials dans le payload :**     - Fournir les credentials directement dans le payload     - Utile pour tests ou intégrations tierces     - Exemple : `\"destination\": {\"type\": \"chorus_pro\", \"credentials\": {...}}`       **Signature électronique (optionnelle) - 2 modes disponibles :**      **Mode 1 - Certificat stocké (recommandé) :**     - Le certificat est récupéré automatiquement via le `client_uid` du JWT     - Aucune clé à fournir dans le payload     - Signature PAdES-B-LT avec horodatage (conforme eIDAS)     - Exemple : `\"signature\": {\"raison\": \"Conformité Factur-X\"}`      **Mode 2 - Clés dans le payload (pour tests) :**     - Fournir `key_pem` et `cert_pem` directement     - Format PEM accepté : brut ou base64     - Utile pour tests ou cas spéciaux sans certificat stocké     - Exemple : `\"signature\": {\"key_pem\": \"-----BEGIN...\", \"cert_pem\": \"-----BEGIN...\"}`      Si `key_pem` et `cert_pem` sont fournis → Mode 2     Sinon → Mode 1 (certificat récupéré via `client_uid`)

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ProcessingEndpointsUnifisApi.new
soumettre_facture_complete_request = FactPulse::SoumettreFactureCompleteRequest.new({donnees_facture: FactPulse::DonneesFactureSimplifiees.new({numero: 'numero_example', emetteur: { key: 3.56}, destinataire: { key: 3.56}, lignes: [{ key: 3.56}]}), pdf_source: 'pdf_source_example', destination: FactPulse::DestinationAFNOR.new}) # SoumettreFactureCompleteRequest | 

begin
  # Soumettre une facture complète (génération + signature + soumission)
  result = api_instance.soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post(soumettre_facture_complete_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ProcessingEndpointsUnifisApi->soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post: #{e}"
end
```

#### Using the soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SoumettreFactureCompleteResponse>, Integer, Hash)> soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post_with_http_info(soumettre_facture_complete_request)

```ruby
begin
  # Soumettre une facture complète (génération + signature + soumission)
  data, status_code, headers = api_instance.soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post_with_http_info(soumettre_facture_complete_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SoumettreFactureCompleteResponse>
rescue FactPulse::ApiError => e
  puts "Error when calling ProcessingEndpointsUnifisApi->soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **soumettre_facture_complete_request** | [**SoumettreFactureCompleteRequest**](SoumettreFactureCompleteRequest.md) |  |  |

### Return type

[**SoumettreFactureCompleteResponse**](SoumettreFactureCompleteResponse.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post

> <ReponseTache> soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post(soumettre_facture_complete_request)

Soumettre une facture complète (asynchrone avec Celery)

Version asynchrone de l'endpoint `/factures/soumettre-complete` utilisant Celery pour le traitement en arrière-plan.      **Workflow automatisé (identique à la version synchrone) :**     1. **Auto-enrichissement** (optionnel) : récupère les données via APIs publiques et Chorus Pro/AFNOR     2. **Génération PDF Factur-X** : crée un PDF/A-3 avec XML embarqué     3. **Signature électronique** (optionnelle) : signe le PDF avec un certificat     4. **Soumission** : envoie vers la destination choisie (Chorus Pro ou AFNOR PDP)      **Destinations supportées :**     - **Chorus Pro** : plateforme B2G française (factures vers secteur public)     - **AFNOR PDP** : Plateformes de Dématérialisation Partenaires      **Différences avec la version synchrone :**     - ✅ **Non-bloquant** : Retourne immédiatement un `id_tache` (HTTP 202 Accepted)     - ✅ **Traitement en arrière-plan** : La facture est traitée par un worker Celery     - ✅ **Suivi d'avancement** : Utilisez `/taches/{id_tache}/statut` pour suivre le statut     - ✅ **Idéal pour gros volumes** : Permet de traiter de nombreuses factures en parallèle      **Comment utiliser :**     1. **Soumission** : Appelez cet endpoint avec vos données de facture     2. **Retour immédiat** : Vous recevez un `id_tache` (ex: \"abc123-def456\")     3. **Suivi** : Appelez `/taches/{id_tache}/statut` pour vérifier l'avancement     4. **Résultat** : Quand `statut = \"SUCCESS\"`, le champ `resultat` contient la réponse complète      **Credentials et signature** : Mêmes modes que la version synchrone (JWT ou payload).

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::ProcessingEndpointsUnifisApi.new
soumettre_facture_complete_request = FactPulse::SoumettreFactureCompleteRequest.new({donnees_facture: FactPulse::DonneesFactureSimplifiees.new({numero: 'numero_example', emetteur: { key: 3.56}, destinataire: { key: 3.56}, lignes: [{ key: 3.56}]}), pdf_source: 'pdf_source_example', destination: FactPulse::DestinationAFNOR.new}) # SoumettreFactureCompleteRequest | 

begin
  # Soumettre une facture complète (asynchrone avec Celery)
  result = api_instance.soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post(soumettre_facture_complete_request)
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling ProcessingEndpointsUnifisApi->soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post: #{e}"
end
```

#### Using the soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReponseTache>, Integer, Hash)> soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post_with_http_info(soumettre_facture_complete_request)

```ruby
begin
  # Soumettre une facture complète (asynchrone avec Celery)
  data, status_code, headers = api_instance.soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post_with_http_info(soumettre_facture_complete_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReponseTache>
rescue FactPulse::ApiError => e
  puts "Error when calling ProcessingEndpointsUnifisApi->soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **soumettre_facture_complete_request** | [**SoumettreFactureCompleteRequest**](SoumettreFactureCompleteRequest.md) |  |  |

### Return type

[**ReponseTache**](ReponseTache.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

