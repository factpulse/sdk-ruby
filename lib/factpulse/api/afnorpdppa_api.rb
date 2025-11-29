=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'cgi'

module FactPulse
  class AFNORPDPPAApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Récupérer les credentials AFNOR stockés
    # Récupère les credentials AFNOR/PDP stockés pour le client_uid du JWT. Cet endpoint est utilisé par le SDK en mode 'stored' pour récupérer les credentials avant de faire l'OAuth AFNOR lui-même.
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def get_afnor_credentials_api_v1_afnor_credentials_get(opts = {})
      data, _status_code, _headers = get_afnor_credentials_api_v1_afnor_credentials_get_with_http_info(opts)
      data
    end

    # Récupérer les credentials AFNOR stockés
    # Récupère les credentials AFNOR/PDP stockés pour le client_uid du JWT. Cet endpoint est utilisé par le SDK en mode &#39;stored&#39; pour récupérer les credentials avant de faire l&#39;OAuth AFNOR lui-même.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def get_afnor_credentials_api_v1_afnor_credentials_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPAApi.get_afnor_credentials_api_v1_afnor_credentials_get ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/credentials'

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
        :operation => :"AFNORPDPPAApi.get_afnor_credentials_api_v1_afnor_credentials_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPAApi#get_afnor_credentials_api_v1_afnor_credentials_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Récupérer et extraire une facture entrante
    # Télécharge un flux entrant depuis la PDP AFNOR et extrait les métadonnées de la facture vers un format JSON unifié. Supporte les formats Factur-X, CII et UBL.
    # @param flow_id [String] 
    # @param [Hash] opts the optional parameters
    # @return [FactureEntrante]
    def get_flux_entrant_api_v1_afnor_flux_entrants_flow_id_get(flow_id, opts = {})
      data, _status_code, _headers = get_flux_entrant_api_v1_afnor_flux_entrants_flow_id_get_with_http_info(flow_id, opts)
      data
    end

    # Récupérer et extraire une facture entrante
    # Télécharge un flux entrant depuis la PDP AFNOR et extrait les métadonnées de la facture vers un format JSON unifié. Supporte les formats Factur-X, CII et UBL.
    # @param flow_id [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(FactureEntrante, Integer, Hash)>] FactureEntrante data, response status code and response headers
    def get_flux_entrant_api_v1_afnor_flux_entrants_flow_id_get_with_http_info(flow_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPAApi.get_flux_entrant_api_v1_afnor_flux_entrants_flow_id_get ...'
      end
      # verify the required parameter 'flow_id' is set
      if @api_client.config.client_side_validation && flow_id.nil?
        fail ArgumentError, "Missing the required parameter 'flow_id' when calling AFNORPDPPAApi.get_flux_entrant_api_v1_afnor_flux_entrants_flow_id_get"
      end
      # resource path
      local_var_path = '/api/v1/afnor/flux-entrants/{flow_id}'.sub('{' + 'flow_id' + '}', CGI.escape(flow_id.to_s))

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
      return_type = opts[:debug_return_type] || 'FactureEntrante'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"AFNORPDPPAApi.get_flux_entrant_api_v1_afnor_flux_entrants_flow_id_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPAApi#get_flux_entrant_api_v1_afnor_flux_entrants_flow_id_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Endpoint OAuth2 pour authentification AFNOR
    # Endpoint proxy OAuth2 pour obtenir un token d'accès AFNOR. Fait proxy vers le mock AFNOR (sandbox) ou la vraie PDP selon MOCK_AFNOR_BASE_URL. Cet endpoint est public (pas d'auth Django requise) car il est appelé par le SDK AFNOR.
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def oauth_token_proxy_api_v1_afnor_oauth_token_post(opts = {})
      data, _status_code, _headers = oauth_token_proxy_api_v1_afnor_oauth_token_post_with_http_info(opts)
      data
    end

    # Endpoint OAuth2 pour authentification AFNOR
    # Endpoint proxy OAuth2 pour obtenir un token d&#39;accès AFNOR. Fait proxy vers le mock AFNOR (sandbox) ou la vraie PDP selon MOCK_AFNOR_BASE_URL. Cet endpoint est public (pas d&#39;auth Django requise) car il est appelé par le SDK AFNOR.
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def oauth_token_proxy_api_v1_afnor_oauth_token_post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: AFNORPDPPAApi.oauth_token_proxy_api_v1_afnor_oauth_token_post ...'
      end
      # resource path
      local_var_path = '/api/v1/afnor/oauth/token'

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
        :operation => :"AFNORPDPPAApi.oauth_token_proxy_api_v1_afnor_oauth_token_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: AFNORPDPPAApi#oauth_token_proxy_api_v1_afnor_oauth_token_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
