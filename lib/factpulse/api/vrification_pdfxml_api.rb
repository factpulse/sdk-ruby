=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'cgi'

module FactPulse
  class VrificationPDFXMLApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Obtenir le statut d'une vérification asynchrone
    # Récupère le statut et le résultat d'une tâche de vérification asynchrone.  **Statuts possibles:** - `PENDING`: Tâche en attente dans la file - `STARTED`: Tâche en cours d'exécution - `SUCCESS`: Tâche terminée avec succès (voir `resultat`) - `FAILURE`: Erreur système (exception non gérée)  **Note:** Le champ `resultat.statut` peut être \"SUCCES\" ou \"ERREUR\" indépendamment du statut Celery (qui sera toujours SUCCESS si la tâche s'est exécutée).
    # @param id_tache [String] 
    # @param [Hash] opts the optional parameters
    # @return [StatutTache]
    def obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get(id_tache, opts = {})
      data, _status_code, _headers = obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_with_http_info(id_tache, opts)
      data
    end

    # Obtenir le statut d&#39;une vérification asynchrone
    # Récupère le statut et le résultat d&#39;une tâche de vérification asynchrone.  **Statuts possibles:** - &#x60;PENDING&#x60;: Tâche en attente dans la file - &#x60;STARTED&#x60;: Tâche en cours d&#39;exécution - &#x60;SUCCESS&#x60;: Tâche terminée avec succès (voir &#x60;resultat&#x60;) - &#x60;FAILURE&#x60;: Erreur système (exception non gérée)  **Note:** Le champ &#x60;resultat.statut&#x60; peut être \&quot;SUCCES\&quot; ou \&quot;ERREUR\&quot; indépendamment du statut Celery (qui sera toujours SUCCESS si la tâche s&#39;est exécutée).
    # @param id_tache [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(StatutTache, Integer, Hash)>] StatutTache data, response status code and response headers
    def obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_with_http_info(id_tache, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VrificationPDFXMLApi.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get ...'
      end
      # verify the required parameter 'id_tache' is set
      if @api_client.config.client_side_validation && id_tache.nil?
        fail ArgumentError, "Missing the required parameter 'id_tache' when calling VrificationPDFXMLApi.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get"
      end
      # resource path
      local_var_path = '/api/v1/verification/verifier-async/{id_tache}/statut'.sub('{' + 'id_tache' + '}', CGI.escape(id_tache.to_s))

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
      return_type = opts[:debug_return_type] || 'StatutTache'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"VrificationPDFXMLApi.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VrificationPDFXMLApi#obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Obtenir le statut d'une vérification asynchrone
    # Récupère le statut et le résultat d'une tâche de vérification asynchrone.  **Statuts possibles:** - `PENDING`: Tâche en attente dans la file - `STARTED`: Tâche en cours d'exécution - `SUCCESS`: Tâche terminée avec succès (voir `resultat`) - `FAILURE`: Erreur système (exception non gérée)  **Note:** Le champ `resultat.statut` peut être \"SUCCES\" ou \"ERREUR\" indépendamment du statut Celery (qui sera toujours SUCCESS si la tâche s'est exécutée).
    # @param id_tache [String] 
    # @param [Hash] opts the optional parameters
    # @return [StatutTache]
    def obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0(id_tache, opts = {})
      data, _status_code, _headers = obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0_with_http_info(id_tache, opts)
      data
    end

    # Obtenir le statut d&#39;une vérification asynchrone
    # Récupère le statut et le résultat d&#39;une tâche de vérification asynchrone.  **Statuts possibles:** - &#x60;PENDING&#x60;: Tâche en attente dans la file - &#x60;STARTED&#x60;: Tâche en cours d&#39;exécution - &#x60;SUCCESS&#x60;: Tâche terminée avec succès (voir &#x60;resultat&#x60;) - &#x60;FAILURE&#x60;: Erreur système (exception non gérée)  **Note:** Le champ &#x60;resultat.statut&#x60; peut être \&quot;SUCCES\&quot; ou \&quot;ERREUR\&quot; indépendamment du statut Celery (qui sera toujours SUCCESS si la tâche s&#39;est exécutée).
    # @param id_tache [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(StatutTache, Integer, Hash)>] StatutTache data, response status code and response headers
    def obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0_with_http_info(id_tache, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VrificationPDFXMLApi.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0 ...'
      end
      # verify the required parameter 'id_tache' is set
      if @api_client.config.client_side_validation && id_tache.nil?
        fail ArgumentError, "Missing the required parameter 'id_tache' when calling VrificationPDFXMLApi.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0"
      end
      # resource path
      local_var_path = '/api/v1/verification/verifier-async/{id_tache}/statut'.sub('{' + 'id_tache' + '}', CGI.escape(id_tache.to_s))

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
      return_type = opts[:debug_return_type] || 'StatutTache'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"VrificationPDFXMLApi.obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VrificationPDFXMLApi#obtenir_statut_verification_api_v1_verification_verifier_async_id_tache_statut_get_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Vérifier la conformité PDF/XML Factur-X (asynchrone)
    # Vérifie la conformité PDF/XML Factur-X de manière asynchrone.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X retourneront une erreur `NOT_FACTURX` dans le résultat.  Cette version utilise une tâche Celery et peut faire appel au service OCR si le PDF est une image ou si `forcer_ocr=true`.  **Retourne immédiatement** un ID de tâche. Utilisez `/verifier-async/{id_tache}/statut` pour récupérer le résultat.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN  **Avantages par rapport à la version synchrone:** - Support OCR pour les PDF images (via service DocTR) - Timeout plus long pour les gros documents - Ne bloque pas le serveur
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :forcer_ocr Forcer l&#39;utilisation de l&#39;OCR même si le PDF contient du texte natif (default to false)
    # @return [ReponseTache]
    def verifier_pdf_async_api_v1_verification_verifier_async_post(fichier_pdf, opts = {})
      data, _status_code, _headers = verifier_pdf_async_api_v1_verification_verifier_async_post_with_http_info(fichier_pdf, opts)
      data
    end

    # Vérifier la conformité PDF/XML Factur-X (asynchrone)
    # Vérifie la conformité PDF/XML Factur-X de manière asynchrone.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X retourneront une erreur &#x60;NOT_FACTURX&#x60; dans le résultat.  Cette version utilise une tâche Celery et peut faire appel au service OCR si le PDF est une image ou si &#x60;forcer_ocr&#x3D;true&#x60;.  **Retourne immédiatement** un ID de tâche. Utilisez &#x60;/verifier-async/{id_tache}/statut&#x60; pour récupérer le résultat.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN  **Avantages par rapport à la version synchrone:** - Support OCR pour les PDF images (via service DocTR) - Timeout plus long pour les gros documents - Ne bloque pas le serveur
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :forcer_ocr Forcer l&#39;utilisation de l&#39;OCR même si le PDF contient du texte natif (default to false)
    # @return [Array<(ReponseTache, Integer, Hash)>] ReponseTache data, response status code and response headers
    def verifier_pdf_async_api_v1_verification_verifier_async_post_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VrificationPDFXMLApi.verifier_pdf_async_api_v1_verification_verifier_async_post ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling VrificationPDFXMLApi.verifier_pdf_async_api_v1_verification_verifier_async_post"
      end
      # resource path
      local_var_path = '/api/v1/verification/verifier-async'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['fichier_pdf'] = fichier_pdf
      form_params['forcer_ocr'] = opts[:'forcer_ocr'] if !opts[:'forcer_ocr'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseTache'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"VrificationPDFXMLApi.verifier_pdf_async_api_v1_verification_verifier_async_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VrificationPDFXMLApi#verifier_pdf_async_api_v1_verification_verifier_async_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Vérifier la conformité PDF/XML Factur-X (asynchrone)
    # Vérifie la conformité PDF/XML Factur-X de manière asynchrone.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X retourneront une erreur `NOT_FACTURX` dans le résultat.  Cette version utilise une tâche Celery et peut faire appel au service OCR si le PDF est une image ou si `forcer_ocr=true`.  **Retourne immédiatement** un ID de tâche. Utilisez `/verifier-async/{id_tache}/statut` pour récupérer le résultat.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN  **Avantages par rapport à la version synchrone:** - Support OCR pour les PDF images (via service DocTR) - Timeout plus long pour les gros documents - Ne bloque pas le serveur
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :forcer_ocr Forcer l&#39;utilisation de l&#39;OCR même si le PDF contient du texte natif (default to false)
    # @return [ReponseTache]
    def verifier_pdf_async_api_v1_verification_verifier_async_post_0(fichier_pdf, opts = {})
      data, _status_code, _headers = verifier_pdf_async_api_v1_verification_verifier_async_post_0_with_http_info(fichier_pdf, opts)
      data
    end

    # Vérifier la conformité PDF/XML Factur-X (asynchrone)
    # Vérifie la conformité PDF/XML Factur-X de manière asynchrone.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X retourneront une erreur &#x60;NOT_FACTURX&#x60; dans le résultat.  Cette version utilise une tâche Celery et peut faire appel au service OCR si le PDF est une image ou si &#x60;forcer_ocr&#x3D;true&#x60;.  **Retourne immédiatement** un ID de tâche. Utilisez &#x60;/verifier-async/{id_tache}/statut&#x60; pour récupérer le résultat.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN  **Avantages par rapport à la version synchrone:** - Support OCR pour les PDF images (via service DocTR) - Timeout plus long pour les gros documents - Ne bloque pas le serveur
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @option opts [Boolean] :forcer_ocr Forcer l&#39;utilisation de l&#39;OCR même si le PDF contient du texte natif (default to false)
    # @return [Array<(ReponseTache, Integer, Hash)>] ReponseTache data, response status code and response headers
    def verifier_pdf_async_api_v1_verification_verifier_async_post_0_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VrificationPDFXMLApi.verifier_pdf_async_api_v1_verification_verifier_async_post_0 ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling VrificationPDFXMLApi.verifier_pdf_async_api_v1_verification_verifier_async_post_0"
      end
      # resource path
      local_var_path = '/api/v1/verification/verifier-async'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['fichier_pdf'] = fichier_pdf
      form_params['forcer_ocr'] = opts[:'forcer_ocr'] if !opts[:'forcer_ocr'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseTache'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"VrificationPDFXMLApi.verifier_pdf_async_api_v1_verification_verifier_async_post_0",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VrificationPDFXMLApi#verifier_pdf_async_api_v1_verification_verifier_async_post_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Vérifier la conformité PDF/XML Factur-X (synchrone)
    # Vérifie la conformité entre le PDF et son XML Factur-X embarqué.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X seront rejetés avec une erreur 400.  Cette version synchrone utilise uniquement l'extraction PDF native (pdfplumber). Pour les PDF images nécessitant de l'OCR, utilisez l'endpoint `/verifier-async`.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @return [ReponseVerificationSucces]
    def verifier_pdf_sync_api_v1_verification_verifier_post(fichier_pdf, opts = {})
      data, _status_code, _headers = verifier_pdf_sync_api_v1_verification_verifier_post_with_http_info(fichier_pdf, opts)
      data
    end

    # Vérifier la conformité PDF/XML Factur-X (synchrone)
    # Vérifie la conformité entre le PDF et son XML Factur-X embarqué.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X seront rejetés avec une erreur 400.  Cette version synchrone utilise uniquement l&#39;extraction PDF native (pdfplumber). Pour les PDF images nécessitant de l&#39;OCR, utilisez l&#39;endpoint &#x60;/verifier-async&#x60;.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @return [Array<(ReponseVerificationSucces, Integer, Hash)>] ReponseVerificationSucces data, response status code and response headers
    def verifier_pdf_sync_api_v1_verification_verifier_post_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VrificationPDFXMLApi.verifier_pdf_sync_api_v1_verification_verifier_post ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling VrificationPDFXMLApi.verifier_pdf_sync_api_v1_verification_verifier_post"
      end
      # resource path
      local_var_path = '/api/v1/verification/verifier'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['fichier_pdf'] = fichier_pdf

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseVerificationSucces'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"VrificationPDFXMLApi.verifier_pdf_sync_api_v1_verification_verifier_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VrificationPDFXMLApi#verifier_pdf_sync_api_v1_verification_verifier_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Vérifier la conformité PDF/XML Factur-X (synchrone)
    # Vérifie la conformité entre le PDF et son XML Factur-X embarqué.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X seront rejetés avec une erreur 400.  Cette version synchrone utilise uniquement l'extraction PDF native (pdfplumber). Pour les PDF images nécessitant de l'OCR, utilisez l'endpoint `/verifier-async`.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @return [ReponseVerificationSucces]
    def verifier_pdf_sync_api_v1_verification_verifier_post_0(fichier_pdf, opts = {})
      data, _status_code, _headers = verifier_pdf_sync_api_v1_verification_verifier_post_0_with_http_info(fichier_pdf, opts)
      data
    end

    # Vérifier la conformité PDF/XML Factur-X (synchrone)
    # Vérifie la conformité entre le PDF et son XML Factur-X embarqué.  **IMPORTANT**: Seuls les PDF Factur-X (avec XML embarqué) sont acceptés. Les PDF sans XML Factur-X seront rejetés avec une erreur 400.  Cette version synchrone utilise uniquement l&#39;extraction PDF native (pdfplumber). Pour les PDF images nécessitant de l&#39;OCR, utilisez l&#39;endpoint &#x60;/verifier-async&#x60;.  **Principe de vérification (Factur-X 1.08):** - Principe n°2: Le XML ne peut contenir que des infos présentes dans le PDF - Principe n°4: Toute info XML doit être présente et conforme dans le PDF  **Champs vérifiés:** - Identification: BT-1 (n° facture), BT-2 (date), BT-3 (type), BT-5 (devise), BT-23 (cadre) - Vendeur: BT-27 (nom), BT-29 (SIRET), BT-30 (SIREN), BT-31 (TVA) - Acheteur: BT-44 (nom), BT-46 (SIRET), BT-47 (SIREN), BT-48 (TVA) - Montants: BT-109 (HT), BT-110 (TVA), BT-112 (TTC), BT-115 (à payer) - Ventilation TVA: BT-116, BT-117, BT-118, BT-119 - Lignes de facture: BT-153, BT-129, BT-146, BT-131 - Notes obligatoires: PMT, PMD, AAB - Règle BR-FR-09: cohérence SIRET/SIREN
    # @param fichier_pdf [File] Fichier PDF Factur-X à vérifier
    # @param [Hash] opts the optional parameters
    # @return [Array<(ReponseVerificationSucces, Integer, Hash)>] ReponseVerificationSucces data, response status code and response headers
    def verifier_pdf_sync_api_v1_verification_verifier_post_0_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: VrificationPDFXMLApi.verifier_pdf_sync_api_v1_verification_verifier_post_0 ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling VrificationPDFXMLApi.verifier_pdf_sync_api_v1_verification_verifier_post_0"
      end
      # resource path
      local_var_path = '/api/v1/verification/verifier'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['fichier_pdf'] = fichier_pdf

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseVerificationSucces'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"VrificationPDFXMLApi.verifier_pdf_sync_api_v1_verification_verifier_post_0",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VrificationPDFXMLApi#verifier_pdf_sync_api_v1_verification_verifier_post_0\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
