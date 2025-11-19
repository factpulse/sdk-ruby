=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'cgi'

module FactPulse
  class AFNORPDPPADirectoryServiceApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Creating a directory line
    # Créer une ligne dans l'annuaire
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post(opts = {})
      data, _status_code, _headers = create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info(opts)
      data
    end

    # Creating a directory line
    # Créer une ligne dans l&#39;annuaire
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/directory-line'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create a routing code
    # Créer un code de routage dans l'annuaire
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post(opts = {})
      data, _status_code, _headers = create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info(opts)
      data
    end

    # Create a routing code
    # Créer un code de routage dans l&#39;annuaire
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/routing-code'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Delete a directory line
    # Supprimer une ligne d'annuaire
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete(id_instance, opts = {})
      data, _status_code, _headers = delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info(id_instance, opts)
      data
    end

    # Delete a directory line
    # Supprimer une ligne d&#39;annuaire
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Healthcheck Directory Service
    # Vérifier la disponibilité du Directory Service
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get(opts = {})
      data, _status_code, _headers = directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get_with_http_info(opts)
      data
    end

    # Healthcheck Directory Service
    # Vérifier la disponibilité du Directory Service
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/healthcheck'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a directory line
    # Obtenir une ligne d'annuaire identifiée par un identifiant d'adressage
    # @param addressing_identifier [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get(addressing_identifier, opts = {})
      data, _status_code, _headers = get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier, opts)
      data
    end

    # Get a directory line
    # Obtenir une ligne d&#39;annuaire identifiée par un identifiant d&#39;adressage
    # @param addressing_identifier [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get_with_http_info(addressing_identifier, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get ...'
      end
      # verify the required parameter 'addressing_identifier' is set
      if @api_client.config.client_side_validation && addressing_identifier.nil?
        fail ArgumentError, "Missing the required parameter 'addressing_identifier' when calling AFNORPDPPADirectoryServiceApi.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/directory-line/code:{addressing_identifier}'.sub('{' + 'addressing_identifier' + '}', CGI.escape(addressing_identifier.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a directory line
    # Obtenir une ligne d'annuaire identifiée par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get(id_instance, opts = {})
      data, _status_code, _headers = get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info(id_instance, opts)
      data
    end

    # Get a directory line
    # Obtenir une ligne d&#39;annuaire identifiée par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a routing code by instance-id
    # Obtenir un code de routage identifié par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get(id_instance, opts = {})
      data, _status_code, _headers = get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info(id_instance, opts)
      data
    end

    # Get a routing code by instance-id
    # Obtenir un code de routage identifié par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get a routing code by SIRET and routing identifier
    # Consulter un code de routage identifié par SIRET et identifiant de routage
    # @param siret [String] 
    # @param routing_identifier [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get(siret, routing_identifier, opts = {})
      data, _status_code, _headers = get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier, opts)
      data
    end

    # Get a routing code by SIRET and routing identifier
    # Consulter un code de routage identifié par SIRET et identifiant de routage
    # @param siret [String] 
    # @param routing_identifier [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get_with_http_info(siret, routing_identifier, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get ...'
      end
      # verify the required parameter 'siret' is set
      if @api_client.config.client_side_validation && siret.nil?
        fail ArgumentError, "Missing the required parameter 'siret' when calling AFNORPDPPADirectoryServiceApi.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get"
      end
      # verify the required parameter 'routing_identifier' is set
      if @api_client.config.client_side_validation && routing_identifier.nil?
        fail ArgumentError, "Missing the required parameter 'routing_identifier' when calling AFNORPDPPADirectoryServiceApi.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/routing-code/siret:{siret}/code:{routing_identifier}'.sub('{' + 'siret' + '}', CGI.escape(siret.to_s)).sub('{' + 'routing_identifier' + '}', CGI.escape(routing_identifier.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Consult a siren (legal unit) by SIREN number
    # Retourne les détails d'une entreprise (unité légale) identifiée par son numéro SIREN
    # @param siren [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get(siren, opts = {})
      data, _status_code, _headers = get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren, opts)
      data
    end

    # Consult a siren (legal unit) by SIREN number
    # Retourne les détails d&#39;une entreprise (unité légale) identifiée par son numéro SIREN
    # @param siren [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get_with_http_info(siren, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get ...'
      end
      # verify the required parameter 'siren' is set
      if @api_client.config.client_side_validation && siren.nil?
        fail ArgumentError, "Missing the required parameter 'siren' when calling AFNORPDPPADirectoryServiceApi.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/siren/code-insee:{siren}'.sub('{' + 'siren' + '}', CGI.escape(siren.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Gets a siren (legal unit) by instance ID
    # Obtenir une entreprise (unité légale) identifiée par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get(id_instance, opts = {})
      data, _status_code, _headers = get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info(id_instance, opts)
      data
    end

    # Gets a siren (legal unit) by instance ID
    # Obtenir une entreprise (unité légale) identifiée par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/siren/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Gets a siret (facility) by SIRET number
    # Obtenir un établissement identifié par son numéro SIRET
    # @param siret [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get(siret, opts = {})
      data, _status_code, _headers = get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret, opts)
      data
    end

    # Gets a siret (facility) by SIRET number
    # Obtenir un établissement identifié par son numéro SIRET
    # @param siret [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get_with_http_info(siret, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get ...'
      end
      # verify the required parameter 'siret' is set
      if @api_client.config.client_side_validation && siret.nil?
        fail ArgumentError, "Missing the required parameter 'siret' when calling AFNORPDPPADirectoryServiceApi.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/siret/code-insee:{siret}'.sub('{' + 'siret' + '}', CGI.escape(siret.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Gets a siret (facility) by id-instance
    # Obtenir un établissement identifié par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get(id_instance, opts = {})
      data, _status_code, _headers = get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info(id_instance, opts)
      data
    end

    # Gets a siret (facility) by id-instance
    # Obtenir un établissement identifié par son idInstance
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/siret/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Partially updates a directory line
    # Mettre à jour partiellement une ligne d'annuaire
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch(id_instance, opts = {})
      data, _status_code, _headers = patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info(id_instance, opts)
      data
    end

    # Partially updates a directory line
    # Mettre à jour partiellement une ligne d&#39;annuaire
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/directory-line/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Partially update a private routing code
    # Mettre à jour partiellement un code de routage privé
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch(id_instance, opts = {})
      data, _status_code, _headers = patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info(id_instance, opts)
      data
    end

    # Partially update a private routing code
    # Mettre à jour partiellement un code de routage privé
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Completely update a private routing code
    # Mettre à jour complètement un code de routage privé
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put(id_instance, opts = {})
      data, _status_code, _headers = put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info(id_instance, opts)
      data
    end

    # Completely update a private routing code
    # Mettre à jour complètement un code de routage privé
    # @param id_instance [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put_with_http_info(id_instance, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put ...'
      end
      # verify the required parameter 'id_instance' is set
      if @api_client.config.client_side_validation && id_instance.nil?
        fail ArgumentError, "Missing the required parameter 'id_instance' when calling AFNORPDPPADirectoryServiceApi.put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put"
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/routing-code/id-instance:{id_instance}'.sub('{' + 'id_instance' + '}', CGI.escape(id_instance.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:PUT, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search for a directory line
    # Rechercher des lignes d'annuaire selon des critères
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post(opts = {})
      data, _status_code, _headers = search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info(opts)
      data
    end

    # Search for a directory line
    # Rechercher des lignes d&#39;annuaire selon des critères
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/directory-line/search'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search for a routing code
    # Rechercher des codes de routage selon des critères
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post(opts = {})
      data, _status_code, _headers = search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info(opts)
      data
    end

    # Search for a routing code
    # Rechercher des codes de routage selon des critères
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/routing-code/search'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # SIREN search (or legal unit)
    # Recherche multi-critères d'entreprises (unités légales)
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post(opts = {})
      data, _status_code, _headers = search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info(opts)
      data
    end

    # SIREN search (or legal unit)
    # Recherche multi-critères d&#39;entreprises (unités légales)
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/siren/search'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Search for a SIRET (facility)
    # Recherche multi-critères d'établissements
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post(opts = {})
      data, _status_code, _headers = search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info(opts)
      data
    end

    # Search for a SIRET (facility)
    # Recherche multi-critères d&#39;établissements
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPADirectoryServiceApi.search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/directory/v1/siret/search'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPADirectoryServiceApi.search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPADirectoryServiceApi#search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
