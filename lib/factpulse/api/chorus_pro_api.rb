=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'cgi'

module FactPulse
  class ChorusProApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Ajouter une pièce jointe
    # Ajoute une pièce jointe au compte utilisateur courant.      **Taille max** : 10 Mo par fichier      **Payload exemple** :     ```json     {       \"pieceJointeFichier\": \"JVBERi0xLjQKJeLjz9MKNSAwIG9iago8P...\",       \"pieceJointeNom\": \"bon_commande.pdf\",       \"pieceJointeTypeMime\": \"application/pdf\",       \"pieceJointeExtension\": \"PDF\"     }     ```      **Retour** : L'ID de la pièce jointe (`pieceJointeIdFichier`) à utiliser ensuite dans `/factures/completer`.      **Extensions acceptées** : PDF, JPG, PNG, ZIP, XML, etc.
    # @param body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post [BodyAjouterFichierApiV1ChorusProTransversesAjouterFichierPost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post(body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post, opts = {})
      data, _status_code, _headers = ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info(body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post, opts)
      data
    end

    # Ajouter une pièce jointe
    # Ajoute une pièce jointe au compte utilisateur courant.      **Taille max** : 10 Mo par fichier      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;pieceJointeFichier\&quot;: \&quot;JVBERi0xLjQKJeLjz9MKNSAwIG9iago8P...\&quot;,       \&quot;pieceJointeNom\&quot;: \&quot;bon_commande.pdf\&quot;,       \&quot;pieceJointeTypeMime\&quot;: \&quot;application/pdf\&quot;,       \&quot;pieceJointeExtension\&quot;: \&quot;PDF\&quot;     }     &#x60;&#x60;&#x60;      **Retour** : L&#39;ID de la pièce jointe (&#x60;pieceJointeIdFichier&#x60;) à utiliser ensuite dans &#x60;/factures/completer&#x60;.      **Extensions acceptées** : PDF, JPG, PNG, ZIP, XML, etc.
    # @param body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post [BodyAjouterFichierApiV1ChorusProTransversesAjouterFichierPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post_with_http_info(body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post ...'
      end
      # verify the required parameter 'body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post' is set
      if @api_client.config.client_side_validation && body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post' when calling ChorusProApi.ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/transverses/ajouter-fichier'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Compléter une facture suspendue (Fournisseur)
    # Complète une facture au statut SUSPENDUE en ajoutant des pièces jointes ou un commentaire.      **Statut requis** : SUSPENDUE      **Actions possibles** :     - Ajouter des pièces jointes (justificatifs, bons de commande, etc.)     - Modifier le commentaire      **Payload exemple** :     ```json     {       \"identifiantFactureCPP\": 12345,       \"commentaire\": \"Voici les justificatifs demandés\",       \"listePiecesJointes\": [         {           \"pieceJointeIdFichier\": 98765,           \"pieceJointeNom\": \"bon_commande.pdf\"         }       ]     }     ```      **Note** : Les pièces jointes doivent d'abord être uploadées via `/transverses/ajouter-fichier`.      **Après complétion** : La facture repasse au statut MISE_A_DISPOSITION.
    # @param body_completer_facture_api_v1_chorus_pro_factures_completer_post [BodyCompleterFactureApiV1ChorusProFacturesCompleterPost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def completer_facture_api_v1_chorus_pro_factures_completer_post(body_completer_facture_api_v1_chorus_pro_factures_completer_post, opts = {})
      data, _status_code, _headers = completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info(body_completer_facture_api_v1_chorus_pro_factures_completer_post, opts)
      data
    end

    # Compléter une facture suspendue (Fournisseur)
    # Complète une facture au statut SUSPENDUE en ajoutant des pièces jointes ou un commentaire.      **Statut requis** : SUSPENDUE      **Actions possibles** :     - Ajouter des pièces jointes (justificatifs, bons de commande, etc.)     - Modifier le commentaire      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;identifiantFactureCPP\&quot;: 12345,       \&quot;commentaire\&quot;: \&quot;Voici les justificatifs demandés\&quot;,       \&quot;listePiecesJointes\&quot;: [         {           \&quot;pieceJointeIdFichier\&quot;: 98765,           \&quot;pieceJointeNom\&quot;: \&quot;bon_commande.pdf\&quot;         }       ]     }     &#x60;&#x60;&#x60;      **Note** : Les pièces jointes doivent d&#39;abord être uploadées via &#x60;/transverses/ajouter-fichier&#x60;.      **Après complétion** : La facture repasse au statut MISE_A_DISPOSITION.
    # @param body_completer_facture_api_v1_chorus_pro_factures_completer_post [BodyCompleterFactureApiV1ChorusProFacturesCompleterPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def completer_facture_api_v1_chorus_pro_factures_completer_post_with_http_info(body_completer_facture_api_v1_chorus_pro_factures_completer_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.completer_facture_api_v1_chorus_pro_factures_completer_post ...'
      end
      # verify the required parameter 'body_completer_facture_api_v1_chorus_pro_factures_completer_post' is set
      if @api_client.config.client_side_validation && body_completer_facture_api_v1_chorus_pro_factures_completer_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_completer_facture_api_v1_chorus_pro_factures_completer_post' when calling ChorusProApi.completer_facture_api_v1_chorus_pro_factures_completer_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/completer'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_completer_facture_api_v1_chorus_pro_factures_completer_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.completer_facture_api_v1_chorus_pro_factures_completer_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#completer_facture_api_v1_chorus_pro_factures_completer_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Consulter le statut d'une facture
    # Récupère les informations et le statut actuel d'une facture soumise à Chorus Pro.      **Retour** :     - Numéro et date de facture     - Montant TTC     - **Statut courant** : SOUMISE, VALIDEE, REJETEE, SUSPENDUE, MANDATEE, MISE_EN_PAIEMENT, etc.     - Structure destinataire      **Cas d'usage** :     - Suivre l'évolution du traitement d'une facture     - Vérifier si une facture a été validée ou rejetée     - Obtenir la date de mise en paiement      **Polling** : Appelez cet endpoint régulièrement pour suivre l'évolution du statut.
    # @param consulter_facture_request [ConsulterFactureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [ConsulterFactureResponse]
    def consulter_facture_api_v1_chorus_pro_factures_consulter_post(consulter_facture_request, opts = {})
      data, _status_code, _headers = consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info(consulter_facture_request, opts)
      data
    end

    # Consulter le statut d&#39;une facture
    # Récupère les informations et le statut actuel d&#39;une facture soumise à Chorus Pro.      **Retour** :     - Numéro et date de facture     - Montant TTC     - **Statut courant** : SOUMISE, VALIDEE, REJETEE, SUSPENDUE, MANDATEE, MISE_EN_PAIEMENT, etc.     - Structure destinataire      **Cas d&#39;usage** :     - Suivre l&#39;évolution du traitement d&#39;une facture     - Vérifier si une facture a été validée ou rejetée     - Obtenir la date de mise en paiement      **Polling** : Appelez cet endpoint régulièrement pour suivre l&#39;évolution du statut.
    # @param consulter_facture_request [ConsulterFactureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ConsulterFactureResponse, Integer, Hash)>] ConsulterFactureResponse data, response status code and response headers
    def consulter_facture_api_v1_chorus_pro_factures_consulter_post_with_http_info(consulter_facture_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.consulter_facture_api_v1_chorus_pro_factures_consulter_post ...'
      end
      # verify the required parameter 'consulter_facture_request' is set
      if @api_client.config.client_side_validation && consulter_facture_request.nil?
        fail ArgumentError, "Missing the required parameter 'consulter_facture_request' when calling ChorusProApi.consulter_facture_api_v1_chorus_pro_factures_consulter_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/consulter'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(consulter_facture_request)

      # return_type
      return_type = opts[:debug_return_type] || 'ConsulterFactureResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.consulter_facture_api_v1_chorus_pro_factures_consulter_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#consulter_facture_api_v1_chorus_pro_factures_consulter_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Consulter les détails d'une structure
    # Récupère les informations détaillées d'une structure Chorus Pro.       **Retour** :     - Raison sociale     - Numéro de TVA intracommunautaire     - Email de contact     - **Paramètres obligatoires** : Indique si le code service et/ou numéro d'engagement sont requis pour soumettre une facture      **Étape typique** : Appelée après `rechercher-structures` pour savoir quels champs sont obligatoires avant de soumettre une facture.
    # @param consulter_structure_request [ConsulterStructureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [ConsulterStructureResponse]
    def consulter_structure_api_v1_chorus_pro_structures_consulter_post(consulter_structure_request, opts = {})
      data, _status_code, _headers = consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info(consulter_structure_request, opts)
      data
    end

    # Consulter les détails d&#39;une structure
    # Récupère les informations détaillées d&#39;une structure Chorus Pro.       **Retour** :     - Raison sociale     - Numéro de TVA intracommunautaire     - Email de contact     - **Paramètres obligatoires** : Indique si le code service et/ou numéro d&#39;engagement sont requis pour soumettre une facture      **Étape typique** : Appelée après &#x60;rechercher-structures&#x60; pour savoir quels champs sont obligatoires avant de soumettre une facture.
    # @param consulter_structure_request [ConsulterStructureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ConsulterStructureResponse, Integer, Hash)>] ConsulterStructureResponse data, response status code and response headers
    def consulter_structure_api_v1_chorus_pro_structures_consulter_post_with_http_info(consulter_structure_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.consulter_structure_api_v1_chorus_pro_structures_consulter_post ...'
      end
      # verify the required parameter 'consulter_structure_request' is set
      if @api_client.config.client_side_validation && consulter_structure_request.nil?
        fail ArgumentError, "Missing the required parameter 'consulter_structure_request' when calling ChorusProApi.consulter_structure_api_v1_chorus_pro_structures_consulter_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/structures/consulter'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(consulter_structure_request)

      # return_type
      return_type = opts[:debug_return_type] || 'ConsulterStructureResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.consulter_structure_api_v1_chorus_pro_structures_consulter_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#consulter_structure_api_v1_chorus_pro_structures_consulter_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Lister les services d'une structure
    # Récupère la liste des services actifs d'une structure publique.      **Cas d'usage** :     - Lister les services disponibles pour une administration     - Vérifier qu'un code service existe avant de soumettre une facture      **Retour** :     - Liste des services avec leur code, libellé et statut (actif/inactif)
    # @param id_structure_cpp [Integer] 
    # @param body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get [BodyListerServicesStructureApiV1ChorusProStructuresIdStructureCppServicesGet] 
    # @param [Hash] opts the optional parameters
    # @return [RechercherServicesResponse]
    def lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get(id_structure_cpp, body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get, opts = {})
      data, _status_code, _headers = lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info(id_structure_cpp, body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get, opts)
      data
    end

    # Lister les services d&#39;une structure
    # Récupère la liste des services actifs d&#39;une structure publique.      **Cas d&#39;usage** :     - Lister les services disponibles pour une administration     - Vérifier qu&#39;un code service existe avant de soumettre une facture      **Retour** :     - Liste des services avec leur code, libellé et statut (actif/inactif)
    # @param id_structure_cpp [Integer] 
    # @param body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get [BodyListerServicesStructureApiV1ChorusProStructuresIdStructureCppServicesGet] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(RechercherServicesResponse, Integer, Hash)>] RechercherServicesResponse data, response status code and response headers
    def lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get_with_http_info(id_structure_cpp, body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get ...'
      end
      # verify the required parameter 'id_structure_cpp' is set
      if @api_client.config.client_side_validation && id_structure_cpp.nil?
        fail ArgumentError, "Missing the required parameter 'id_structure_cpp' when calling ChorusProApi.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get"
      end
      # verify the required parameter 'body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get' is set
      if @api_client.config.client_side_validation && body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get.nil?
        fail ArgumentError, "Missing the required parameter 'body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get' when calling ChorusProApi.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/structures/{id_structure_cpp}/services'.sub('{' + 'id_structure_cpp' + '}', CGI.escape(id_structure_cpp.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get)

      # return_type
      return_type = opts[:debug_return_type] || 'RechercherServicesResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Utilitaire : Obtenir l'ID Chorus Pro depuis un SIRET
    # **Utilitaire pratique** pour obtenir l'ID Chorus Pro d'une structure à partir de son SIRET.       Cette fonction wrapper combine :     1. Recherche de la structure par SIRET     2. Extraction de l'`id_structure_cpp` si une seule structure est trouvée      **Retour** :     - `id_structure_cpp` : ID Chorus Pro (0 si non trouvé ou si plusieurs résultats)     - `designation_structure` : Nom de la structure (si trouvée)     - `message` : Message explicatif      **Cas d'usage** :     - Raccourci pour obtenir directement l'ID Chorus Pro avant de soumettre une facture     - Alternative simplifiée à `rechercher-structures` + extraction manuelle de l'ID      **Note** : Si plusieurs structures correspondent au SIRET (rare), retourne 0 et un message d'erreur.
    # @param obtenir_id_chorus_pro_request [ObtenirIdChorusProRequest] 
    # @param [Hash] opts the optional parameters
    # @return [ObtenirIdChorusProResponse]
    def obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post(obtenir_id_chorus_pro_request, opts = {})
      data, _status_code, _headers = obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info(obtenir_id_chorus_pro_request, opts)
      data
    end

    # Utilitaire : Obtenir l&#39;ID Chorus Pro depuis un SIRET
    # **Utilitaire pratique** pour obtenir l&#39;ID Chorus Pro d&#39;une structure à partir de son SIRET.       Cette fonction wrapper combine :     1. Recherche de la structure par SIRET     2. Extraction de l&#39;&#x60;id_structure_cpp&#x60; si une seule structure est trouvée      **Retour** :     - &#x60;id_structure_cpp&#x60; : ID Chorus Pro (0 si non trouvé ou si plusieurs résultats)     - &#x60;designation_structure&#x60; : Nom de la structure (si trouvée)     - &#x60;message&#x60; : Message explicatif      **Cas d&#39;usage** :     - Raccourci pour obtenir directement l&#39;ID Chorus Pro avant de soumettre une facture     - Alternative simplifiée à &#x60;rechercher-structures&#x60; + extraction manuelle de l&#39;ID      **Note** : Si plusieurs structures correspondent au SIRET (rare), retourne 0 et un message d&#39;erreur.
    # @param obtenir_id_chorus_pro_request [ObtenirIdChorusProRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ObtenirIdChorusProResponse, Integer, Hash)>] ObtenirIdChorusProResponse data, response status code and response headers
    def obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post_with_http_info(obtenir_id_chorus_pro_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post ...'
      end
      # verify the required parameter 'obtenir_id_chorus_pro_request' is set
      if @api_client.config.client_side_validation && obtenir_id_chorus_pro_request.nil?
        fail ArgumentError, "Missing the required parameter 'obtenir_id_chorus_pro_request' when calling ChorusProApi.obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/structures/obtenir-id-depuis-siret'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(obtenir_id_chorus_pro_request)

      # return_type
      return_type = opts[:debug_return_type] || 'ObtenirIdChorusProResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Rechercher factures reçues (Destinataire)
    # Recherche les factures reçues par le destinataire connecté.      **Filtres** :     - Téléchargée / non téléchargée     - Dates de réception     - Statut (MISE_A_DISPOSITION, SUSPENDUE, etc.)     - Fournisseur      **Indicateur utile** : `factureTelechargeeParDestinataire` permet de savoir si la facture a déjà été téléchargée.
    # @param body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post [BodyRechercherFacturesDestinataireApiV1ChorusProFacturesRechercherDestinatairePost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post(body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post, opts = {})
      data, _status_code, _headers = rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info(body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post, opts)
      data
    end

    # Rechercher factures reçues (Destinataire)
    # Recherche les factures reçues par le destinataire connecté.      **Filtres** :     - Téléchargée / non téléchargée     - Dates de réception     - Statut (MISE_A_DISPOSITION, SUSPENDUE, etc.)     - Fournisseur      **Indicateur utile** : &#x60;factureTelechargeeParDestinataire&#x60; permet de savoir si la facture a déjà été téléchargée.
    # @param body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post [BodyRechercherFacturesDestinataireApiV1ChorusProFacturesRechercherDestinatairePost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post_with_http_info(body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post ...'
      end
      # verify the required parameter 'body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post' is set
      if @api_client.config.client_side_validation && body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post' when calling ChorusProApi.rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/rechercher-destinataire'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Rechercher factures émises (Fournisseur)
    # Recherche les factures émises par le fournisseur connecté.      **Filtres disponibles** :     - Numéro de facture     - Dates (début/fin)     - Statut     - Structure destinataire     - Montant      **Cas d'usage** :     - Suivi des factures émises     - Vérification des statuts     - Export pour comptabilité
    # @param body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post [BodyRechercherFacturesFournisseurApiV1ChorusProFacturesRechercherFournisseurPost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post(body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post, opts = {})
      data, _status_code, _headers = rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info(body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post, opts)
      data
    end

    # Rechercher factures émises (Fournisseur)
    # Recherche les factures émises par le fournisseur connecté.      **Filtres disponibles** :     - Numéro de facture     - Dates (début/fin)     - Statut     - Structure destinataire     - Montant      **Cas d&#39;usage** :     - Suivi des factures émises     - Vérification des statuts     - Export pour comptabilité
    # @param body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post [BodyRechercherFacturesFournisseurApiV1ChorusProFacturesRechercherFournisseurPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post_with_http_info(body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post ...'
      end
      # verify the required parameter 'body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post' is set
      if @api_client.config.client_side_validation && body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post' when calling ChorusProApi.rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/rechercher-fournisseur'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Rechercher des structures Chorus Pro
    # Recherche des structures (entreprises, administrations) enregistrées sur Chorus Pro.      **Cas d'usage** :     - Trouver l'ID Chorus Pro d'une structure à partir de son SIRET     - Vérifier si une structure est enregistrée sur Chorus Pro     - Lister les structures correspondant à des critères      **Filtres disponibles** :     - Identifiant (SIRET, SIREN, etc.)     - Raison sociale     - Type d'identifiant     - Structures privées uniquement      **Étape typique** : Appelée avant `soumettre-facture` pour obtenir l'`id_structure_cpp` du destinataire.
    # @param rechercher_structure_request [RechercherStructureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [RechercherStructureResponse]
    def rechercher_structures_api_v1_chorus_pro_structures_rechercher_post(rechercher_structure_request, opts = {})
      data, _status_code, _headers = rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info(rechercher_structure_request, opts)
      data
    end

    # Rechercher des structures Chorus Pro
    # Recherche des structures (entreprises, administrations) enregistrées sur Chorus Pro.      **Cas d&#39;usage** :     - Trouver l&#39;ID Chorus Pro d&#39;une structure à partir de son SIRET     - Vérifier si une structure est enregistrée sur Chorus Pro     - Lister les structures correspondant à des critères      **Filtres disponibles** :     - Identifiant (SIRET, SIREN, etc.)     - Raison sociale     - Type d&#39;identifiant     - Structures privées uniquement      **Étape typique** : Appelée avant &#x60;soumettre-facture&#x60; pour obtenir l&#39;&#x60;id_structure_cpp&#x60; du destinataire.
    # @param rechercher_structure_request [RechercherStructureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(RechercherStructureResponse, Integer, Hash)>] RechercherStructureResponse data, response status code and response headers
    def rechercher_structures_api_v1_chorus_pro_structures_rechercher_post_with_http_info(rechercher_structure_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.rechercher_structures_api_v1_chorus_pro_structures_rechercher_post ...'
      end
      # verify the required parameter 'rechercher_structure_request' is set
      if @api_client.config.client_side_validation && rechercher_structure_request.nil?
        fail ArgumentError, "Missing the required parameter 'rechercher_structure_request' when calling ChorusProApi.rechercher_structures_api_v1_chorus_pro_structures_rechercher_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/structures/rechercher'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(rechercher_structure_request)

      # return_type
      return_type = opts[:debug_return_type] || 'RechercherStructureResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.rechercher_structures_api_v1_chorus_pro_structures_rechercher_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#rechercher_structures_api_v1_chorus_pro_structures_rechercher_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Recycler une facture (Fournisseur)
    # Recycle une facture au statut A_RECYCLER en modifiant les données d'acheminement.      **Statut requis** : A_RECYCLER      **Champs modifiables** :     - Destinataire (`idStructureCPP`)     - Code service     - Numéro d'engagement      **Cas d'usage** :     - Erreur de destinataire     - Changement de service facturation     - Mise à jour du numéro d'engagement      **Payload exemple** :     ```json     {       \"identifiantFactureCPP\": 12345,       \"idStructureCPP\": 67890,       \"codeService\": \"SERVICE_01\",       \"numeroEngagement\": \"ENG2024001\"     }     ```      **Note** : La facture conserve son numéro et ses montants, seuls les champs d'acheminement changent.
    # @param body_recycler_facture_api_v1_chorus_pro_factures_recycler_post [BodyRecyclerFactureApiV1ChorusProFacturesRecyclerPost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def recycler_facture_api_v1_chorus_pro_factures_recycler_post(body_recycler_facture_api_v1_chorus_pro_factures_recycler_post, opts = {})
      data, _status_code, _headers = recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info(body_recycler_facture_api_v1_chorus_pro_factures_recycler_post, opts)
      data
    end

    # Recycler une facture (Fournisseur)
    # Recycle une facture au statut A_RECYCLER en modifiant les données d&#39;acheminement.      **Statut requis** : A_RECYCLER      **Champs modifiables** :     - Destinataire (&#x60;idStructureCPP&#x60;)     - Code service     - Numéro d&#39;engagement      **Cas d&#39;usage** :     - Erreur de destinataire     - Changement de service facturation     - Mise à jour du numéro d&#39;engagement      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;identifiantFactureCPP\&quot;: 12345,       \&quot;idStructureCPP\&quot;: 67890,       \&quot;codeService\&quot;: \&quot;SERVICE_01\&quot;,       \&quot;numeroEngagement\&quot;: \&quot;ENG2024001\&quot;     }     &#x60;&#x60;&#x60;      **Note** : La facture conserve son numéro et ses montants, seuls les champs d&#39;acheminement changent.
    # @param body_recycler_facture_api_v1_chorus_pro_factures_recycler_post [BodyRecyclerFactureApiV1ChorusProFacturesRecyclerPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def recycler_facture_api_v1_chorus_pro_factures_recycler_post_with_http_info(body_recycler_facture_api_v1_chorus_pro_factures_recycler_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.recycler_facture_api_v1_chorus_pro_factures_recycler_post ...'
      end
      # verify the required parameter 'body_recycler_facture_api_v1_chorus_pro_factures_recycler_post' is set
      if @api_client.config.client_side_validation && body_recycler_facture_api_v1_chorus_pro_factures_recycler_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_recycler_facture_api_v1_chorus_pro_factures_recycler_post' when calling ChorusProApi.recycler_facture_api_v1_chorus_pro_factures_recycler_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/recycler'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_recycler_facture_api_v1_chorus_pro_factures_recycler_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.recycler_facture_api_v1_chorus_pro_factures_recycler_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#recycler_facture_api_v1_chorus_pro_factures_recycler_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Soumettre une facture à Chorus Pro
    # Soumet une facture électronique à une structure publique via Chorus Pro.       **📋 Workflow complet** :     1. **Uploader le PDF Factur-X** via `/transverses/ajouter-fichier` → récupérer `pieceJointeId`     2. **Obtenir l'ID structure** via `/structures/rechercher` ou `/structures/obtenir-id-depuis-siret`     3. **Vérifier les paramètres obligatoires** via `/structures/consulter`     4. **Soumettre la facture** avec le `piece_jointe_principale_id` obtenu à l'étape 1      **Pré-requis** :     1. Avoir l'`id_structure_cpp` du destinataire (via `/structures/rechercher`)     2. Connaître les paramètres obligatoires (via `/structures/consulter`) :        - Code service si `code_service_doit_etre_renseigne=true`        - Numéro d'engagement si `numero_ej_doit_etre_renseigne=true`     3. Avoir uploadé le PDF Factur-X (via `/transverses/ajouter-fichier`)      **Format attendu** :     - `piece_jointe_principale_id` : ID retourné par `/transverses/ajouter-fichier`     - Montants : Chaînes de caractères avec 2 décimales (ex: \"1250.50\")     - Dates : Format ISO 8601 (YYYY-MM-DD)      **Retour** :     - `identifiant_facture_cpp` : ID Chorus Pro de la facture créée     - `numero_flux_depot` : Numéro de suivi du dépôt      **Statuts possibles après soumission** :     - SOUMISE : En attente de validation     - VALIDEE : Validée par le destinataire     - REJETEE : Rejetée (erreur de données ou refus métier)     - SUSPENDUE : En attente d'informations complémentaires      **Note** : Utilisez `/factures/consulter` pour suivre l'évolution du statut.
    # @param soumettre_facture_request [SoumettreFactureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [SoumettreFactureResponse]
    def soumettre_facture_api_v1_chorus_pro_factures_soumettre_post(soumettre_facture_request, opts = {})
      data, _status_code, _headers = soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info(soumettre_facture_request, opts)
      data
    end

    # Soumettre une facture à Chorus Pro
    # Soumet une facture électronique à une structure publique via Chorus Pro.       **📋 Workflow complet** :     1. **Uploader le PDF Factur-X** via &#x60;/transverses/ajouter-fichier&#x60; → récupérer &#x60;pieceJointeId&#x60;     2. **Obtenir l&#39;ID structure** via &#x60;/structures/rechercher&#x60; ou &#x60;/structures/obtenir-id-depuis-siret&#x60;     3. **Vérifier les paramètres obligatoires** via &#x60;/structures/consulter&#x60;     4. **Soumettre la facture** avec le &#x60;piece_jointe_principale_id&#x60; obtenu à l&#39;étape 1      **Pré-requis** :     1. Avoir l&#39;&#x60;id_structure_cpp&#x60; du destinataire (via &#x60;/structures/rechercher&#x60;)     2. Connaître les paramètres obligatoires (via &#x60;/structures/consulter&#x60;) :        - Code service si &#x60;code_service_doit_etre_renseigne&#x3D;true&#x60;        - Numéro d&#39;engagement si &#x60;numero_ej_doit_etre_renseigne&#x3D;true&#x60;     3. Avoir uploadé le PDF Factur-X (via &#x60;/transverses/ajouter-fichier&#x60;)      **Format attendu** :     - &#x60;piece_jointe_principale_id&#x60; : ID retourné par &#x60;/transverses/ajouter-fichier&#x60;     - Montants : Chaînes de caractères avec 2 décimales (ex: \&quot;1250.50\&quot;)     - Dates : Format ISO 8601 (YYYY-MM-DD)      **Retour** :     - &#x60;identifiant_facture_cpp&#x60; : ID Chorus Pro de la facture créée     - &#x60;numero_flux_depot&#x60; : Numéro de suivi du dépôt      **Statuts possibles après soumission** :     - SOUMISE : En attente de validation     - VALIDEE : Validée par le destinataire     - REJETEE : Rejetée (erreur de données ou refus métier)     - SUSPENDUE : En attente d&#39;informations complémentaires      **Note** : Utilisez &#x60;/factures/consulter&#x60; pour suivre l&#39;évolution du statut.
    # @param soumettre_facture_request [SoumettreFactureRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(SoumettreFactureResponse, Integer, Hash)>] SoumettreFactureResponse data, response status code and response headers
    def soumettre_facture_api_v1_chorus_pro_factures_soumettre_post_with_http_info(soumettre_facture_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.soumettre_facture_api_v1_chorus_pro_factures_soumettre_post ...'
      end
      # verify the required parameter 'soumettre_facture_request' is set
      if @api_client.config.client_side_validation && soumettre_facture_request.nil?
        fail ArgumentError, "Missing the required parameter 'soumettre_facture_request' when calling ChorusProApi.soumettre_facture_api_v1_chorus_pro_factures_soumettre_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/soumettre'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(soumettre_facture_request)

      # return_type
      return_type = opts[:debug_return_type] || 'SoumettreFactureResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.soumettre_facture_api_v1_chorus_pro_factures_soumettre_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#soumettre_facture_api_v1_chorus_pro_factures_soumettre_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Télécharger un groupe de factures
    # Télécharge une ou plusieurs factures (max 10 recommandé) avec leurs pièces jointes.      **Formats disponibles** :     - PDF : Fichier PDF uniquement     - XML : Fichier XML uniquement     - ZIP : Archive contenant PDF + XML + pièces jointes      **Taille maximale** : 120 Mo par téléchargement      **Payload exemple** :     ```json     {       \"listeIdentifiantsFactureCPP\": [12345, 12346],       \"inclurePiecesJointes\": true,       \"formatFichier\": \"ZIP\"     }     ```      **Retour** : Le fichier est encodé en base64 dans le champ `fichierBase64`.      **Note** : Le flag `factureTelechargeeParDestinataire` est mis à jour automatiquement.
    # @param body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post [BodyTelechargerGroupeFacturesApiV1ChorusProFacturesTelechargerGroupePost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post(body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post, opts = {})
      data, _status_code, _headers = telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info(body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post, opts)
      data
    end

    # Télécharger un groupe de factures
    # Télécharge une ou plusieurs factures (max 10 recommandé) avec leurs pièces jointes.      **Formats disponibles** :     - PDF : Fichier PDF uniquement     - XML : Fichier XML uniquement     - ZIP : Archive contenant PDF + XML + pièces jointes      **Taille maximale** : 120 Mo par téléchargement      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;listeIdentifiantsFactureCPP\&quot;: [12345, 12346],       \&quot;inclurePiecesJointes\&quot;: true,       \&quot;formatFichier\&quot;: \&quot;ZIP\&quot;     }     &#x60;&#x60;&#x60;      **Retour** : Le fichier est encodé en base64 dans le champ &#x60;fichierBase64&#x60;.      **Note** : Le flag &#x60;factureTelechargeeParDestinataire&#x60; est mis à jour automatiquement.
    # @param body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post [BodyTelechargerGroupeFacturesApiV1ChorusProFacturesTelechargerGroupePost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post_with_http_info(body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post ...'
      end
      # verify the required parameter 'body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post' is set
      if @api_client.config.client_side_validation && body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post' when calling ChorusProApi.telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/telecharger-groupe'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Traiter une facture reçue (Destinataire)
    # Change le statut d'une facture reçue.      **Statuts possibles** :     - MISE_A_DISPOSITION : Facture acceptée     - SUSPENDUE : En attente d'informations complémentaires (motif obligatoire)     - REJETEE : Facture refusée (motif obligatoire)     - MANDATEE : Facture mandatée     - MISE_EN_PAIEMENT : Facture en cours de paiement     - COMPTABILISEE : Facture comptabilisée     - MISE_A_DISPOSITION_COMPTABLE : Mise à disposition comptable     - A_RECYCLER : À recycler     - COMPLETEE : Complétée     - SERVICE-FAIT : Service fait     - PRISE_EN_COMPTE_DESTINATAIRE : Prise en compte     - TRANSMISE_MOA : Transmise à la MOA      **Payload exemple** :     ```json     {       \"identifiantFactureCPP\": 12345,       \"nouveauStatut\": \"REJETEE\",       \"motifRejet\": \"Facture en double\",       \"commentaire\": \"Facture déjà reçue sous la référence ABC123\"     }     ```      **Règles** :     - Un motif est **obligatoire** pour SUSPENDUE et REJETEE     - Seuls certains statuts sont autorisés selon le statut actuel de la facture
    # @param body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post [BodyTraiterFactureRecueApiV1ChorusProFacturesTraiterFactureRecuePost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post(body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post, opts = {})
      data, _status_code, _headers = traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info(body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post, opts)
      data
    end

    # Traiter une facture reçue (Destinataire)
    # Change le statut d&#39;une facture reçue.      **Statuts possibles** :     - MISE_A_DISPOSITION : Facture acceptée     - SUSPENDUE : En attente d&#39;informations complémentaires (motif obligatoire)     - REJETEE : Facture refusée (motif obligatoire)     - MANDATEE : Facture mandatée     - MISE_EN_PAIEMENT : Facture en cours de paiement     - COMPTABILISEE : Facture comptabilisée     - MISE_A_DISPOSITION_COMPTABLE : Mise à disposition comptable     - A_RECYCLER : À recycler     - COMPLETEE : Complétée     - SERVICE-FAIT : Service fait     - PRISE_EN_COMPTE_DESTINATAIRE : Prise en compte     - TRANSMISE_MOA : Transmise à la MOA      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;identifiantFactureCPP\&quot;: 12345,       \&quot;nouveauStatut\&quot;: \&quot;REJETEE\&quot;,       \&quot;motifRejet\&quot;: \&quot;Facture en double\&quot;,       \&quot;commentaire\&quot;: \&quot;Facture déjà reçue sous la référence ABC123\&quot;     }     &#x60;&#x60;&#x60;      **Règles** :     - Un motif est **obligatoire** pour SUSPENDUE et REJETEE     - Seuls certains statuts sont autorisés selon le statut actuel de la facture
    # @param body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post [BodyTraiterFactureRecueApiV1ChorusProFacturesTraiterFactureRecuePost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post_with_http_info(body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post ...'
      end
      # verify the required parameter 'body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post' is set
      if @api_client.config.client_side_validation && body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post' when calling ChorusProApi.traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/traiter-facture-recue'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Consulter une facture (Valideur)
    # Consulte facture (valideur).
    # @param body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post [BodyValideurConsulterFactureApiV1ChorusProFacturesValideurConsulterPost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post(body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post, opts = {})
      data, _status_code, _headers = valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info(body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post, opts)
      data
    end

    # Consulter une facture (Valideur)
    # Consulte facture (valideur).
    # @param body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post [BodyValideurConsulterFactureApiV1ChorusProFacturesValideurConsulterPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post_with_http_info(body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post ...'
      end
      # verify the required parameter 'body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post' is set
      if @api_client.config.client_side_validation && body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post' when calling ChorusProApi.valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/valideur/consulter'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Rechercher factures à valider (Valideur)
    # Recherche les factures en attente de validation par le valideur connecté.      **Rôle** : Valideur dans le circuit de validation interne.      **Filtres** : Dates, structure, service, etc.
    # @param body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post [BodyValideurRechercherFacturesApiV1ChorusProFacturesValideurRechercherPost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post(body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post, opts = {})
      data, _status_code, _headers = valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info(body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post, opts)
      data
    end

    # Rechercher factures à valider (Valideur)
    # Recherche les factures en attente de validation par le valideur connecté.      **Rôle** : Valideur dans le circuit de validation interne.      **Filtres** : Dates, structure, service, etc.
    # @param body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post [BodyValideurRechercherFacturesApiV1ChorusProFacturesValideurRechercherPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post_with_http_info(body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post ...'
      end
      # verify the required parameter 'body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post' is set
      if @api_client.config.client_side_validation && body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post' when calling ChorusProApi.valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/valideur/rechercher'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Valider ou refuser une facture (Valideur)
    # Valide ou refuse une facture en attente de validation.      **Actions** :     - Valider : La facture passe au statut suivant du circuit     - Refuser : La facture est rejetée (motif obligatoire)
    # @param body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post [BodyValideurTraiterFactureApiV1ChorusProFacturesValideurTraiterPost] 
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post(body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post, opts = {})
      data, _status_code, _headers = valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info(body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post, opts)
      data
    end

    # Valider ou refuser une facture (Valideur)
    # Valide ou refuse une facture en attente de validation.      **Actions** :     - Valider : La facture passe au statut suivant du circuit     - Refuser : La facture est rejetée (motif obligatoire)
    # @param body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post [BodyValideurTraiterFactureApiV1ChorusProFacturesValideurTraiterPost] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post_with_http_info(body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ChorusProApi.valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post ...'
      end
      # verify the required parameter 'body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post' is set
      if @api_client.config.client_side_validation && body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post.nil?
        fail ArgumentError, "Missing the required parameter 'body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post' when calling ChorusProApi.valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post"
      end
      # resource path
      local_var_path = '/api/v1/chorus-pro/factures/valideur/traiter'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json']) unless header_params['Accept']
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post)

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"ChorusProApi.valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ChorusProApi#valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
