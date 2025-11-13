# FactPulse::UtilisateurApi

All URIs are relative to *http://localhost*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**obtenir_infos_utilisateur_api_v1_moi_get**](UtilisateurApi.md#obtenir_infos_utilisateur_api_v1_moi_get) | **GET** /api/v1/moi | Obtenir les informations de l&#39;utilisateur connecté |


## obtenir_infos_utilisateur_api_v1_moi_get

> Object obtenir_infos_utilisateur_api_v1_moi_get

Obtenir les informations de l'utilisateur connecté

Retourne les informations de l'utilisateur authentifié.  Cet endpoint permet de : - Vérifier que l'authentification fonctionne - Obtenir les détails du compte connecté - Tester la validité du token JWT - Consulter son quota de consommation  **Nécessite une authentification valide.**

### Examples

```ruby
require 'time'
require 'factpulse'
# setup authorization
FactPulse.configure do |config|
  # Configure Bearer authorization: HTTPBearer
  config.access_token = 'YOUR_BEARER_TOKEN'
end

api_instance = FactPulse::UtilisateurApi.new

begin
  # Obtenir les informations de l'utilisateur connecté
  result = api_instance.obtenir_infos_utilisateur_api_v1_moi_get
  p result
rescue FactPulse::ApiError => e
  puts "Error when calling UtilisateurApi->obtenir_infos_utilisateur_api_v1_moi_get: #{e}"
end
```

#### Using the obtenir_infos_utilisateur_api_v1_moi_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> obtenir_infos_utilisateur_api_v1_moi_get_with_http_info

```ruby
begin
  # Obtenir les informations de l'utilisateur connecté
  data, status_code, headers = api_instance.obtenir_infos_utilisateur_api_v1_moi_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue FactPulse::ApiError => e
  puts "Error when calling UtilisateurApi->obtenir_infos_utilisateur_api_v1_moi_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

**Object**

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

