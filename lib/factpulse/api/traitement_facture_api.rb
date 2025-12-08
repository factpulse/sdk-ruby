=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'cgi'

module FactPulse
  class TraitementFactureApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Générer un certificat X.509 auto-signé de test
    # Génère un certificat X.509 auto-signé pour les tests de signature électronique PDF.      **⚠️ ATTENTION : Certificat de TEST uniquement !**      Ce certificat est :     - ✅ Adapté pour tests et développement     - ✅ Compatible signature PDF (PAdES)     - ✅ Conforme eIDAS niveau **SES** (Simple Electronic Signature)     - ❌ **JAMAIS utilisable en production**     - ❌ **Non reconnu** par les navigateurs et lecteurs PDF     - ❌ **Aucune valeur juridique**      ## Niveaux eIDAS      - **SES** (Simple) : Certificat auto-signé ← Généré par cet endpoint     - **AdES** (Advanced) : Certificat CA commerciale (Let's Encrypt, etc.)     - **QES** (Qualified) : Certificat qualifié PSCO (CertEurope, Universign, etc.)      ## Utilisation      Une fois généré, le certificat peut être :      1. **Enregistré dans Django** (recommandé) :        - Django Admin > Certificats de signature        - Upload `certificat_pem` et `cle_privee_pem`      2. **Utilisé directement** :        - Signer un PDF avec `/signer-pdf`        - Le certificat sera automatiquement utilisé      ## Exemple d'appel      ```bash     curl -X POST \"https://www.factpulse.fr/api/facturation/generer-certificat-test\" \\       -H \"Authorization: Bearer eyJ0eXAi...\" \\       -H \"Content-Type: application/json\" \\       -d '{         \"cn\": \"Test Client XYZ\",         \"organisation\": \"Client XYZ SARL\",         \"email\": \"contact@xyz.fr\",         \"duree_jours\": 365       }'     ```      ## Cas d'usage      - Tests de signature PDF en développement     - POC de signature électronique     - Formation et démos     - Tests d'intégration automatisés      ## Conformité technique      Certificat généré avec :     - Clé RSA 2048 ou 4096 bits     - Algorithme SHA-256     - Extensions Key Usage : `digitalSignature`, `contentCommitment` (non-repudiation)     - Extensions Extended Key Usage : `codeSigning`, `emailProtection`     - Validité : 1 jour à 10 ans (configurable)     - Format : PEM (certificat et clé)     - Optionnel : PKCS#12 (.p12)
    # @param generate_certificate_request [GenerateCertificateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [GenerateCertificateResponse]
    def generer_certificat_test_api_v1_traitement_generer_certificat_test_post(generate_certificate_request, opts = {})
      data, _status_code, _headers = generer_certificat_test_api_v1_traitement_generer_certificat_test_post_with_http_info(generate_certificate_request, opts)
      data
    end

    # Générer un certificat X.509 auto-signé de test
    # Génère un certificat X.509 auto-signé pour les tests de signature électronique PDF.      **⚠️ ATTENTION : Certificat de TEST uniquement !**      Ce certificat est :     - ✅ Adapté pour tests et développement     - ✅ Compatible signature PDF (PAdES)     - ✅ Conforme eIDAS niveau **SES** (Simple Electronic Signature)     - ❌ **JAMAIS utilisable en production**     - ❌ **Non reconnu** par les navigateurs et lecteurs PDF     - ❌ **Aucune valeur juridique**      ## Niveaux eIDAS      - **SES** (Simple) : Certificat auto-signé ← Généré par cet endpoint     - **AdES** (Advanced) : Certificat CA commerciale (Let&#39;s Encrypt, etc.)     - **QES** (Qualified) : Certificat qualifié PSCO (CertEurope, Universign, etc.)      ## Utilisation      Une fois généré, le certificat peut être :      1. **Enregistré dans Django** (recommandé) :        - Django Admin &gt; Certificats de signature        - Upload &#x60;certificat_pem&#x60; et &#x60;cle_privee_pem&#x60;      2. **Utilisé directement** :        - Signer un PDF avec &#x60;/signer-pdf&#x60;        - Le certificat sera automatiquement utilisé      ## Exemple d&#39;appel      &#x60;&#x60;&#x60;bash     curl -X POST \&quot;https://www.factpulse.fr/api/facturation/generer-certificat-test\&quot; \\       -H \&quot;Authorization: Bearer eyJ0eXAi...\&quot; \\       -H \&quot;Content-Type: application/json\&quot; \\       -d &#39;{         \&quot;cn\&quot;: \&quot;Test Client XYZ\&quot;,         \&quot;organisation\&quot;: \&quot;Client XYZ SARL\&quot;,         \&quot;email\&quot;: \&quot;contact@xyz.fr\&quot;,         \&quot;duree_jours\&quot;: 365       }&#39;     &#x60;&#x60;&#x60;      ## Cas d&#39;usage      - Tests de signature PDF en développement     - POC de signature électronique     - Formation et démos     - Tests d&#39;intégration automatisés      ## Conformité technique      Certificat généré avec :     - Clé RSA 2048 ou 4096 bits     - Algorithme SHA-256     - Extensions Key Usage : &#x60;digitalSignature&#x60;, &#x60;contentCommitment&#x60; (non-repudiation)     - Extensions Extended Key Usage : &#x60;codeSigning&#x60;, &#x60;emailProtection&#x60;     - Validité : 1 jour à 10 ans (configurable)     - Format : PEM (certificat et clé)     - Optionnel : PKCS#12 (.p12)
    # @param generate_certificate_request [GenerateCertificateRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(GenerateCertificateResponse, Integer, Hash)>] GenerateCertificateResponse data, response status code and response headers
    def generer_certificat_test_api_v1_traitement_generer_certificat_test_post_with_http_info(generate_certificate_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.generer_certificat_test_api_v1_traitement_generer_certificat_test_post ...'
      end
      # verify the required parameter 'generate_certificate_request' is set
      if @api_client.config.client_side_validation && generate_certificate_request.nil?
        fail ArgumentError, "Missing the required parameter 'generate_certificate_request' when calling TraitementFactureApi.generer_certificat_test_api_v1_traitement_generer_certificat_test_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/generer-certificat-test'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(generate_certificate_request)

      # return_type
      return_type = opts[:debug_return_type] || 'GenerateCertificateResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.generer_certificat_test_api_v1_traitement_generer_certificat_test_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#generer_certificat_test_api_v1_traitement_generer_certificat_test_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Générer une facture Factur-X
    # Génère une facture électronique au format Factur-X conforme aux normes européennes.  ## Normes appliquées  - **Factur-X** (France) : Norme FNFE-MPE (Forum National de la Facture Électronique) - **ZUGFeRD** (Allemagne) : Format allemand compatible Factur-X - **EN 16931** : Norme sémantique européenne pour la facturation électronique - **ISO 19005-3** (PDF/A-3) : Archivage électronique à long terme - **Cross Industry Invoice (CII)** : Syntaxe XML UN/CEFACT  ## 🆕 Nouveau : Format simplifié avec auto-enrichissement (P0.1)  Vous pouvez désormais créer une facture en fournissant uniquement : - Un numéro de facture - Un SIRET émetteur + **IBAN** (obligatoire) - Un SIRET destinataire - Les lignes de facture (description, quantité, prix HT)  **Exemple format simplifié** : ```json {   \"numero\": \"FACT-2025-001\",   \"emetteur\": {     \"siret\": \"92019522900017\",     \"iban\": \"FR7630001007941234567890185\"   },   \"destinataire\": {\"siret\": \"35600000000048\"},   \"lignes\": [     {\"description\": \"Prestation\", \"quantite\": 10, \"prix_ht\": 100.00, \"tva\": 20.0}   ] } ```  **⚠️ Champs obligatoires (format simplifié)** : - `numero` : Numéro de facture unique - `emetteur.siret` : SIRET de l'émetteur (14 chiffres) - `emetteur.iban` : IBAN du compte bancaire (pas d'API publique pour le récupérer) - `destinataire.siret` : SIRET du destinataire - `lignes[]` : Au moins une ligne de facture  **Ce qui se passe automatiquement avec `auto_enrichir=True`** : - ✅ Enrichissement des noms depuis API Chorus Pro - ✅ Enrichissement des adresses depuis API Recherche Entreprises (gratuite, publique) - ✅ Calcul automatique de la TVA intracommunautaire (FR + clé + SIREN) - ✅ Récupération de l'ID Chorus Pro pour la facturation électronique - ✅ Calcul des totaux HT/TVA/TTC - ✅ Génération des dates (aujourd'hui + échéance 30j) - ✅ Gestion multi-taux de TVA  **Identifiants supportés** : - SIRET (14 chiffres) : Établissement précis ⭐ Recommandé - SIREN (9 chiffres) : Entreprise (sélection auto du siège) - Types spéciaux : UE_HORS_FRANCE, RIDET, TAHITI, etc.  ## Contrôles effectués lors de la génération  ### 1. Validation des données (Pydantic) - Types de données (montants en Decimal, dates ISO 8601) - Formats (SIRET 14 chiffres, SIREN 9 chiffres, IBAN) - Champs obligatoires selon le profil - Cohérence des montants (HT + TVA = TTC)  ### 2. Génération XML conforme CII - Sérialisation selon schéma XSD Cross Industry Invoice - Namespaces UN/CEFACT corrects - Structure hiérarchique respectée - Encodage UTF-8 sans BOM  ### 3. Validation Schematron - Règles métier du profil sélectionné (MINIMUM, BASIC, EN16931, EXTENDED) - Cardinalité des éléments (obligatoire, optionnel, répétable) - Règles de calcul (totaux, TVA, remises) - Conformité européenne EN 16931  ### 4. Conversion PDF/A-3 (si format_sortie='pdf') - Conversion du PDF source en PDF/A-3 via Ghostscript - Embarquement du XML Factur-X dans le PDF - Métadonnées XMP conformes - Profil ICC sRGB pour les couleurs - Suppression des éléments interdits (JavaScript, formulaires)  ## Fonctionnement  1. **Soumission** : La facture est mise en file d'attente Celery pour traitement asynchrone 2. **Retour immédiat** : Vous recevez un `id_tache` (HTTP 202 Accepted) 3. **Suivi** : Utilisez l'endpoint `/taches/{id_tache}/statut` pour suivre l'avancement  ## Formats de sortie  - **xml** : Génère uniquement le XML Factur-X (recommandé pour les tests) - **pdf** : Génère un PDF/A-3 avec XML embarqué (nécessite `source_pdf`)  ## Profils Factur-X  - **MINIMUM** : Données minimales (facture simplifiée) - **BASIC** : Informations de base (PME) - **EN16931** : Standard européen (recommandé, conforme directive 2014/55/UE) - **EXTENDED** : Toutes les données disponibles (grands comptes)  ## Ce que vous obtenez  Après traitement réussi (statut `completed`) : - **XML seul** : Fichier XML encodé base64 conforme Factur-X - **PDF/A-3** : PDF avec XML embarqué, prêt pour envoi/archivage - **Métadonnées** : Profil, version Factur-X, taille fichier - **Validation** : Confirmation de conformité Schematron  ## Validation  Les données sont validées automatiquement selon le format détecté. En cas d'erreur, un statut 422 est retourné avec les détails des champs invalides.
    # @param donnees_facture [String] Données de la facture au format JSON.              Deux formats acceptés :             1. **Format classique** : Structure complète FactureFacturX (tous les champs)             2. **Format simplifié** (🆕 P0.1) : Structure minimale avec auto-enrichissement              Le format est détecté automatiquement !             
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil Profil Factur-X : MINIMUM, BASIC, EN16931 ou EXTENDED.
    # @option opts [FormatSortie] :format_sortie Format de sortie : &#39;xml&#39; (XML seul) ou &#39;pdf&#39; (PDF Factur-X avec XML embarqué).
    # @option opts [Boolean] :auto_enrichir 🆕 Activer l&#39;auto-enrichissement depuis SIRET/SIREN (format simplifié uniquement) (default to true)
    # @option opts [File] :source_pdf 
    # @return [ReponseTache]
    def generer_facture_api_v1_traitement_generer_facture_post(donnees_facture, opts = {})
      data, _status_code, _headers = generer_facture_api_v1_traitement_generer_facture_post_with_http_info(donnees_facture, opts)
      data
    end

    # Générer une facture Factur-X
    # Génère une facture électronique au format Factur-X conforme aux normes européennes.  ## Normes appliquées  - **Factur-X** (France) : Norme FNFE-MPE (Forum National de la Facture Électronique) - **ZUGFeRD** (Allemagne) : Format allemand compatible Factur-X - **EN 16931** : Norme sémantique européenne pour la facturation électronique - **ISO 19005-3** (PDF/A-3) : Archivage électronique à long terme - **Cross Industry Invoice (CII)** : Syntaxe XML UN/CEFACT  ## 🆕 Nouveau : Format simplifié avec auto-enrichissement (P0.1)  Vous pouvez désormais créer une facture en fournissant uniquement : - Un numéro de facture - Un SIRET émetteur + **IBAN** (obligatoire) - Un SIRET destinataire - Les lignes de facture (description, quantité, prix HT)  **Exemple format simplifié** : &#x60;&#x60;&#x60;json {   \&quot;numero\&quot;: \&quot;FACT-2025-001\&quot;,   \&quot;emetteur\&quot;: {     \&quot;siret\&quot;: \&quot;92019522900017\&quot;,     \&quot;iban\&quot;: \&quot;FR7630001007941234567890185\&quot;   },   \&quot;destinataire\&quot;: {\&quot;siret\&quot;: \&quot;35600000000048\&quot;},   \&quot;lignes\&quot;: [     {\&quot;description\&quot;: \&quot;Prestation\&quot;, \&quot;quantite\&quot;: 10, \&quot;prix_ht\&quot;: 100.00, \&quot;tva\&quot;: 20.0}   ] } &#x60;&#x60;&#x60;  **⚠️ Champs obligatoires (format simplifié)** : - &#x60;numero&#x60; : Numéro de facture unique - &#x60;emetteur.siret&#x60; : SIRET de l&#39;émetteur (14 chiffres) - &#x60;emetteur.iban&#x60; : IBAN du compte bancaire (pas d&#39;API publique pour le récupérer) - &#x60;destinataire.siret&#x60; : SIRET du destinataire - &#x60;lignes[]&#x60; : Au moins une ligne de facture  **Ce qui se passe automatiquement avec &#x60;auto_enrichir&#x3D;True&#x60;** : - ✅ Enrichissement des noms depuis API Chorus Pro - ✅ Enrichissement des adresses depuis API Recherche Entreprises (gratuite, publique) - ✅ Calcul automatique de la TVA intracommunautaire (FR + clé + SIREN) - ✅ Récupération de l&#39;ID Chorus Pro pour la facturation électronique - ✅ Calcul des totaux HT/TVA/TTC - ✅ Génération des dates (aujourd&#39;hui + échéance 30j) - ✅ Gestion multi-taux de TVA  **Identifiants supportés** : - SIRET (14 chiffres) : Établissement précis ⭐ Recommandé - SIREN (9 chiffres) : Entreprise (sélection auto du siège) - Types spéciaux : UE_HORS_FRANCE, RIDET, TAHITI, etc.  ## Contrôles effectués lors de la génération  ### 1. Validation des données (Pydantic) - Types de données (montants en Decimal, dates ISO 8601) - Formats (SIRET 14 chiffres, SIREN 9 chiffres, IBAN) - Champs obligatoires selon le profil - Cohérence des montants (HT + TVA &#x3D; TTC)  ### 2. Génération XML conforme CII - Sérialisation selon schéma XSD Cross Industry Invoice - Namespaces UN/CEFACT corrects - Structure hiérarchique respectée - Encodage UTF-8 sans BOM  ### 3. Validation Schematron - Règles métier du profil sélectionné (MINIMUM, BASIC, EN16931, EXTENDED) - Cardinalité des éléments (obligatoire, optionnel, répétable) - Règles de calcul (totaux, TVA, remises) - Conformité européenne EN 16931  ### 4. Conversion PDF/A-3 (si format_sortie&#x3D;&#39;pdf&#39;) - Conversion du PDF source en PDF/A-3 via Ghostscript - Embarquement du XML Factur-X dans le PDF - Métadonnées XMP conformes - Profil ICC sRGB pour les couleurs - Suppression des éléments interdits (JavaScript, formulaires)  ## Fonctionnement  1. **Soumission** : La facture est mise en file d&#39;attente Celery pour traitement asynchrone 2. **Retour immédiat** : Vous recevez un &#x60;id_tache&#x60; (HTTP 202 Accepted) 3. **Suivi** : Utilisez l&#39;endpoint &#x60;/taches/{id_tache}/statut&#x60; pour suivre l&#39;avancement  ## Formats de sortie  - **xml** : Génère uniquement le XML Factur-X (recommandé pour les tests) - **pdf** : Génère un PDF/A-3 avec XML embarqué (nécessite &#x60;source_pdf&#x60;)  ## Profils Factur-X  - **MINIMUM** : Données minimales (facture simplifiée) - **BASIC** : Informations de base (PME) - **EN16931** : Standard européen (recommandé, conforme directive 2014/55/UE) - **EXTENDED** : Toutes les données disponibles (grands comptes)  ## Ce que vous obtenez  Après traitement réussi (statut &#x60;completed&#x60;) : - **XML seul** : Fichier XML encodé base64 conforme Factur-X - **PDF/A-3** : PDF avec XML embarqué, prêt pour envoi/archivage - **Métadonnées** : Profil, version Factur-X, taille fichier - **Validation** : Confirmation de conformité Schematron  ## Validation  Les données sont validées automatiquement selon le format détecté. En cas d&#39;erreur, un statut 422 est retourné avec les détails des champs invalides.
    # @param donnees_facture [String] Données de la facture au format JSON.              Deux formats acceptés :             1. **Format classique** : Structure complète FactureFacturX (tous les champs)             2. **Format simplifié** (🆕 P0.1) : Structure minimale avec auto-enrichissement              Le format est détecté automatiquement !             
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil Profil Factur-X : MINIMUM, BASIC, EN16931 ou EXTENDED.
    # @option opts [FormatSortie] :format_sortie Format de sortie : &#39;xml&#39; (XML seul) ou &#39;pdf&#39; (PDF Factur-X avec XML embarqué).
    # @option opts [Boolean] :auto_enrichir 🆕 Activer l&#39;auto-enrichissement depuis SIRET/SIREN (format simplifié uniquement) (default to true)
    # @option opts [File] :source_pdf 
    # @return [Array<(ReponseTache, Integer, Hash)>] ReponseTache data, response status code and response headers
    def generer_facture_api_v1_traitement_generer_facture_post_with_http_info(donnees_facture, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.generer_facture_api_v1_traitement_generer_facture_post ...'
      end
      # verify the required parameter 'donnees_facture' is set
      if @api_client.config.client_side_validation && donnees_facture.nil?
        fail ArgumentError, "Missing the required parameter 'donnees_facture' when calling TraitementFactureApi.generer_facture_api_v1_traitement_generer_facture_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/generer-facture'

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
      form_params['donnees_facture'] = donnees_facture
      form_params['profil'] = opts[:'profil'] if !opts[:'profil'].nil?
      form_params['format_sortie'] = opts[:'format_sortie'] if !opts[:'format_sortie'].nil?
      form_params['auto_enrichir'] = opts[:'auto_enrichir'] if !opts[:'auto_enrichir'].nil?
      form_params['source_pdf'] = opts[:'source_pdf'] if !opts[:'source_pdf'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseTache'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.generer_facture_api_v1_traitement_generer_facture_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#generer_facture_api_v1_traitement_generer_facture_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Obtenir le statut d'une tâche de génération
    # Récupère l'état d'avancement d'une tâche de génération de facture.  ## États possibles  Le champ `statut` utilise l'enum `StatutCelery` avec les valeurs : - **PENDING, STARTED, SUCCESS, FAILURE, RETRY**  Voir la documentation du schéma `StatutCelery` pour les détails.  ## Résultat métier  Quand `statut=\"SUCCESS\"`, le champ `resultat` contient : - `statut` : \"SUCCES\" ou \"ERREUR\" (résultat métier) - `chemin_fichier` : Chemin du fichier généré (si succès) - `errorCode`, `errorMessage`, `details` : Format AFNOR (si échec métier)  ## Usage  Appelez cet endpoint en boucle (polling) toutes les 2-3 secondes jusqu'à ce que `statut` soit `SUCCESS` ou `FAILURE`.
    # @param id_tache [String] 
    # @param [Hash] opts the optional parameters
    # @return [StatutTache]
    def obtenir_statut_tache_api_v1_traitement_taches_id_tache_statut_get(id_tache, opts = {})
      data, _status_code, _headers = obtenir_statut_tache_api_v1_traitement_taches_id_tache_statut_get_with_http_info(id_tache, opts)
      data
    end

    # Obtenir le statut d&#39;une tâche de génération
    # Récupère l&#39;état d&#39;avancement d&#39;une tâche de génération de facture.  ## États possibles  Le champ &#x60;statut&#x60; utilise l&#39;enum &#x60;StatutCelery&#x60; avec les valeurs : - **PENDING, STARTED, SUCCESS, FAILURE, RETRY**  Voir la documentation du schéma &#x60;StatutCelery&#x60; pour les détails.  ## Résultat métier  Quand &#x60;statut&#x3D;\&quot;SUCCESS\&quot;&#x60;, le champ &#x60;resultat&#x60; contient : - &#x60;statut&#x60; : \&quot;SUCCES\&quot; ou \&quot;ERREUR\&quot; (résultat métier) - &#x60;chemin_fichier&#x60; : Chemin du fichier généré (si succès) - &#x60;errorCode&#x60;, &#x60;errorMessage&#x60;, &#x60;details&#x60; : Format AFNOR (si échec métier)  ## Usage  Appelez cet endpoint en boucle (polling) toutes les 2-3 secondes jusqu&#39;à ce que &#x60;statut&#x60; soit &#x60;SUCCESS&#x60; ou &#x60;FAILURE&#x60;.
    # @param id_tache [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(StatutTache, Integer, Hash)>] StatutTache data, response status code and response headers
    def obtenir_statut_tache_api_v1_traitement_taches_id_tache_statut_get_with_http_info(id_tache, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.obtenir_statut_tache_api_v1_traitement_taches_id_tache_statut_get ...'
      end
      # verify the required parameter 'id_tache' is set
      if @api_client.config.client_side_validation && id_tache.nil?
        fail ArgumentError, "Missing the required parameter 'id_tache' when calling TraitementFactureApi.obtenir_statut_tache_api_v1_traitement_taches_id_tache_statut_get"
      end
      # resource path
      local_var_path = '/api/v1/traitement/taches/{id_tache}/statut'.sub('{' + 'id_tache' + '}', CGI.escape(id_tache.to_s))

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
        :operation => :"TraitementFactureApi.obtenir_statut_tache_api_v1_traitement_taches_id_tache_statut_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#obtenir_statut_tache_api_v1_traitement_taches_id_tache_statut_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Signer un PDF avec le certificat du client (PAdES-B-LT)
    # Signe un PDF uploadé avec le certificat électronique configuré pour le client (via client_uid du JWT).      **Standards supportés** : PAdES-B-B, PAdES-B-T (horodatage), PAdES-B-LT (archivage long terme).      **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO - hors scope).      **Sécurité** : Double authentification X-Internal-Secret + JWT Bearer pour récupérer le certificat.      **⚠️ Disclaimer légal** : Les signatures générées sont des cachets électroniques au sens     du règlement eIDAS. Le niveau de validité juridique dépend du certificat utilisé (SES/AdES/QES).     FactPulse ne fournit pas de certificats qualifiés QES - vous devez obtenir un certificat auprès     d'un PSCO (Prestataire de Services de Confiance qualifié) pour une validité juridique maximale.
    # @param fichier_pdf [File] Fichier PDF à signer (sera traité puis retourné signé en base64)
    # @param [Hash] opts the optional parameters
    # @option opts [String] :raison 
    # @option opts [String] :localisation 
    # @option opts [String] :contact 
    # @option opts [String] :field_name Nom du champ de signature PDF (default to 'FactPulseSignature')
    # @option opts [Boolean] :use_pades_lt Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL. (default to false)
    # @option opts [Boolean] :use_timestamp Activer l&#39;horodatage RFC 3161 avec FreeTSA (PAdES-B-T) (default to true)
    # @return [Object]
    def signer_pdf_api_v1_traitement_signer_pdf_post(fichier_pdf, opts = {})
      data, _status_code, _headers = signer_pdf_api_v1_traitement_signer_pdf_post_with_http_info(fichier_pdf, opts)
      data
    end

    # Signer un PDF avec le certificat du client (PAdES-B-LT)
    # Signe un PDF uploadé avec le certificat électronique configuré pour le client (via client_uid du JWT).      **Standards supportés** : PAdES-B-B, PAdES-B-T (horodatage), PAdES-B-LT (archivage long terme).      **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO - hors scope).      **Sécurité** : Double authentification X-Internal-Secret + JWT Bearer pour récupérer le certificat.      **⚠️ Disclaimer légal** : Les signatures générées sont des cachets électroniques au sens     du règlement eIDAS. Le niveau de validité juridique dépend du certificat utilisé (SES/AdES/QES).     FactPulse ne fournit pas de certificats qualifiés QES - vous devez obtenir un certificat auprès     d&#39;un PSCO (Prestataire de Services de Confiance qualifié) pour une validité juridique maximale.
    # @param fichier_pdf [File] Fichier PDF à signer (sera traité puis retourné signé en base64)
    # @param [Hash] opts the optional parameters
    # @option opts [String] :raison 
    # @option opts [String] :localisation 
    # @option opts [String] :contact 
    # @option opts [String] :field_name Nom du champ de signature PDF (default to 'FactPulseSignature')
    # @option opts [Boolean] :use_pades_lt Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL. (default to false)
    # @option opts [Boolean] :use_timestamp Activer l&#39;horodatage RFC 3161 avec FreeTSA (PAdES-B-T) (default to true)
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def signer_pdf_api_v1_traitement_signer_pdf_post_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.signer_pdf_api_v1_traitement_signer_pdf_post ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling TraitementFactureApi.signer_pdf_api_v1_traitement_signer_pdf_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/signer-pdf'

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
      form_params['raison'] = opts[:'raison'] if !opts[:'raison'].nil?
      form_params['localisation'] = opts[:'localisation'] if !opts[:'localisation'].nil?
      form_params['contact'] = opts[:'contact'] if !opts[:'contact'].nil?
      form_params['field_name'] = opts[:'field_name'] if !opts[:'field_name'].nil?
      form_params['use_pades_lt'] = opts[:'use_pades_lt'] if !opts[:'use_pades_lt'].nil?
      form_params['use_timestamp'] = opts[:'use_timestamp'] if !opts[:'use_timestamp'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.signer_pdf_api_v1_traitement_signer_pdf_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#signer_pdf_api_v1_traitement_signer_pdf_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Signer un PDF de manière asynchrone (Celery)
    # Signe un PDF uploadé de manière asynchrone via une tâche Celery.      **Différence avec /signer-pdf** :     - `/signer-pdf` : Signature synchrone (blocage jusqu'à la fin)     - `/signer-pdf-async` : Signature asynchrone (retourne immédiatement un task_id)      **Avantages de l'async** :     - Pas de timeout pour les gros fichiers     - Pas de blocage du worker FastAPI     - Possibilité de suivre la progression via le task_id     - Idéal pour les traitements par lot      **Standards supportés** : PAdES-B-B, PAdES-B-T (horodatage), PAdES-B-LT (archivage long terme).      **⚠️ Disclaimer légal** : Identique à /signer-pdf (voir documentation de cet endpoint).
    # @param fichier_pdf [File] Fichier PDF à signer (traité de manière asynchrone)
    # @param [Hash] opts the optional parameters
    # @option opts [String] :raison 
    # @option opts [String] :localisation 
    # @option opts [String] :contact 
    # @option opts [String] :field_name Nom du champ de signature PDF (default to 'FactPulseSignature')
    # @option opts [Boolean] :use_pades_lt Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL. (default to false)
    # @option opts [Boolean] :use_timestamp Activer l&#39;horodatage RFC 3161 avec FreeTSA (PAdES-B-T) (default to true)
    # @return [Object]
    def signer_pdf_async_api_v1_traitement_signer_pdf_async_post(fichier_pdf, opts = {})
      data, _status_code, _headers = signer_pdf_async_api_v1_traitement_signer_pdf_async_post_with_http_info(fichier_pdf, opts)
      data
    end

    # Signer un PDF de manière asynchrone (Celery)
    # Signe un PDF uploadé de manière asynchrone via une tâche Celery.      **Différence avec /signer-pdf** :     - &#x60;/signer-pdf&#x60; : Signature synchrone (blocage jusqu&#39;à la fin)     - &#x60;/signer-pdf-async&#x60; : Signature asynchrone (retourne immédiatement un task_id)      **Avantages de l&#39;async** :     - Pas de timeout pour les gros fichiers     - Pas de blocage du worker FastAPI     - Possibilité de suivre la progression via le task_id     - Idéal pour les traitements par lot      **Standards supportés** : PAdES-B-B, PAdES-B-T (horodatage), PAdES-B-LT (archivage long terme).      **⚠️ Disclaimer légal** : Identique à /signer-pdf (voir documentation de cet endpoint).
    # @param fichier_pdf [File] Fichier PDF à signer (traité de manière asynchrone)
    # @param [Hash] opts the optional parameters
    # @option opts [String] :raison 
    # @option opts [String] :localisation 
    # @option opts [String] :contact 
    # @option opts [String] :field_name Nom du champ de signature PDF (default to 'FactPulseSignature')
    # @option opts [Boolean] :use_pades_lt Activer PAdES-B-LT (archivage long terme avec données de validation embarquées). NÉCESSITE un certificat avec accès OCSP/CRL. (default to false)
    # @option opts [Boolean] :use_timestamp Activer l&#39;horodatage RFC 3161 avec FreeTSA (PAdES-B-T) (default to true)
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def signer_pdf_async_api_v1_traitement_signer_pdf_async_post_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.signer_pdf_async_api_v1_traitement_signer_pdf_async_post ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling TraitementFactureApi.signer_pdf_async_api_v1_traitement_signer_pdf_async_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/signer-pdf-async'

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
      form_params['raison'] = opts[:'raison'] if !opts[:'raison'].nil?
      form_params['localisation'] = opts[:'localisation'] if !opts[:'localisation'].nil?
      form_params['contact'] = opts[:'contact'] if !opts[:'contact'].nil?
      form_params['field_name'] = opts[:'field_name'] if !opts[:'field_name'].nil?
      form_params['use_pades_lt'] = opts[:'use_pades_lt'] if !opts[:'use_pades_lt'].nil?
      form_params['use_timestamp'] = opts[:'use_timestamp'] if !opts[:'use_timestamp'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.signer_pdf_async_api_v1_traitement_signer_pdf_async_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#signer_pdf_async_api_v1_traitement_signer_pdf_async_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Soumettre une facture complète (génération + signature + soumission)
    # Endpoint unifié pour soumettre une facture complète vers différentes destinations.      **Workflow automatisé :**     1. **Auto-enrichissement** (optionnel) : récupère les données via APIs publiques et Chorus Pro/AFNOR     2. **Génération PDF Factur-X** : crée un PDF/A-3 avec XML embarqué     3. **Signature électronique** (optionnelle) : signe le PDF avec un certificat     4. **Soumission** : envoie vers la destination choisie (Chorus Pro ou AFNOR PDP)      **Destinations supportées :**     - **Chorus Pro** : plateforme B2G française (factures vers secteur public)     - **AFNOR PDP** : Plateformes de Dématérialisation Partenaires      **Credentials de destination - 2 modes disponibles :**      **Mode 1 - Récupération via JWT (recommandé) :**     - Les credentials sont récupérés automatiquement via le `client_uid` du JWT     - Ne pas fournir le champ `credentials` dans `destination`     - Architecture 0-trust : aucun secret dans le payload     - Exemple : `\"destination\": {\"type\": \"chorus_pro\"}`      **Mode 2 - Credentials dans le payload :**     - Fournir les credentials directement dans le payload     - Utile pour tests ou intégrations tierces     - Exemple : `\"destination\": {\"type\": \"chorus_pro\", \"credentials\": {...}}`       **Signature électronique (optionnelle) - 2 modes disponibles :**      **Mode 1 - Certificat stocké (recommandé) :**     - Le certificat est récupéré automatiquement via le `client_uid` du JWT     - Aucune clé à fournir dans le payload     - Signature PAdES-B-LT avec horodatage (conforme eIDAS)     - Exemple : `\"signature\": {\"raison\": \"Conformité Factur-X\"}`      **Mode 2 - Clés dans le payload (pour tests) :**     - Fournir `key_pem` et `cert_pem` directement     - Format PEM accepté : brut ou base64     - Utile pour tests ou cas spéciaux sans certificat stocké     - Exemple : `\"signature\": {\"key_pem\": \"-----BEGIN...\", \"cert_pem\": \"-----BEGIN...\"}`      Si `key_pem` et `cert_pem` sont fournis → Mode 2     Sinon → Mode 1 (certificat récupéré via `client_uid`)
    # @param soumettre_facture_complete_request [SoumettreFactureCompleteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [SoumettreFactureCompleteResponse]
    def soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post(soumettre_facture_complete_request, opts = {})
      data, _status_code, _headers = soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post_with_http_info(soumettre_facture_complete_request, opts)
      data
    end

    # Soumettre une facture complète (génération + signature + soumission)
    # Endpoint unifié pour soumettre une facture complète vers différentes destinations.      **Workflow automatisé :**     1. **Auto-enrichissement** (optionnel) : récupère les données via APIs publiques et Chorus Pro/AFNOR     2. **Génération PDF Factur-X** : crée un PDF/A-3 avec XML embarqué     3. **Signature électronique** (optionnelle) : signe le PDF avec un certificat     4. **Soumission** : envoie vers la destination choisie (Chorus Pro ou AFNOR PDP)      **Destinations supportées :**     - **Chorus Pro** : plateforme B2G française (factures vers secteur public)     - **AFNOR PDP** : Plateformes de Dématérialisation Partenaires      **Credentials de destination - 2 modes disponibles :**      **Mode 1 - Récupération via JWT (recommandé) :**     - Les credentials sont récupérés automatiquement via le &#x60;client_uid&#x60; du JWT     - Ne pas fournir le champ &#x60;credentials&#x60; dans &#x60;destination&#x60;     - Architecture 0-trust : aucun secret dans le payload     - Exemple : &#x60;\&quot;destination\&quot;: {\&quot;type\&quot;: \&quot;chorus_pro\&quot;}&#x60;      **Mode 2 - Credentials dans le payload :**     - Fournir les credentials directement dans le payload     - Utile pour tests ou intégrations tierces     - Exemple : &#x60;\&quot;destination\&quot;: {\&quot;type\&quot;: \&quot;chorus_pro\&quot;, \&quot;credentials\&quot;: {...}}&#x60;       **Signature électronique (optionnelle) - 2 modes disponibles :**      **Mode 1 - Certificat stocké (recommandé) :**     - Le certificat est récupéré automatiquement via le &#x60;client_uid&#x60; du JWT     - Aucune clé à fournir dans le payload     - Signature PAdES-B-LT avec horodatage (conforme eIDAS)     - Exemple : &#x60;\&quot;signature\&quot;: {\&quot;raison\&quot;: \&quot;Conformité Factur-X\&quot;}&#x60;      **Mode 2 - Clés dans le payload (pour tests) :**     - Fournir &#x60;key_pem&#x60; et &#x60;cert_pem&#x60; directement     - Format PEM accepté : brut ou base64     - Utile pour tests ou cas spéciaux sans certificat stocké     - Exemple : &#x60;\&quot;signature\&quot;: {\&quot;key_pem\&quot;: \&quot;-----BEGIN...\&quot;, \&quot;cert_pem\&quot;: \&quot;-----BEGIN...\&quot;}&#x60;      Si &#x60;key_pem&#x60; et &#x60;cert_pem&#x60; sont fournis → Mode 2     Sinon → Mode 1 (certificat récupéré via &#x60;client_uid&#x60;)
    # @param soumettre_facture_complete_request [SoumettreFactureCompleteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(SoumettreFactureCompleteResponse, Integer, Hash)>] SoumettreFactureCompleteResponse data, response status code and response headers
    def soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post_with_http_info(soumettre_facture_complete_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post ...'
      end
      # verify the required parameter 'soumettre_facture_complete_request' is set
      if @api_client.config.client_side_validation && soumettre_facture_complete_request.nil?
        fail ArgumentError, "Missing the required parameter 'soumettre_facture_complete_request' when calling TraitementFactureApi.soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/factures/soumettre-complete'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(soumettre_facture_complete_request)

      # return_type
      return_type = opts[:debug_return_type] || 'SoumettreFactureCompleteResponse'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#soumettre_facture_complete_api_v1_traitement_factures_soumettre_complete_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Soumettre une facture complète (asynchrone avec Celery)
    # Version asynchrone de l'endpoint `/factures/soumettre-complete` utilisant Celery pour le traitement en arrière-plan.      **Workflow automatisé (identique à la version synchrone) :**     1. **Auto-enrichissement** (optionnel) : récupère les données via APIs publiques et Chorus Pro/AFNOR     2. **Génération PDF Factur-X** : crée un PDF/A-3 avec XML embarqué     3. **Signature électronique** (optionnelle) : signe le PDF avec un certificat     4. **Soumission** : envoie vers la destination choisie (Chorus Pro ou AFNOR PDP)      **Destinations supportées :**     - **Chorus Pro** : plateforme B2G française (factures vers secteur public)     - **AFNOR PDP** : Plateformes de Dématérialisation Partenaires      **Différences avec la version synchrone :**     - ✅ **Non-bloquant** : Retourne immédiatement un `id_tache` (HTTP 202 Accepted)     - ✅ **Traitement en arrière-plan** : La facture est traitée par un worker Celery     - ✅ **Suivi d'avancement** : Utilisez `/taches/{id_tache}/statut` pour suivre le statut     - ✅ **Idéal pour gros volumes** : Permet de traiter de nombreuses factures en parallèle      **Comment utiliser :**     1. **Soumission** : Appelez cet endpoint avec vos données de facture     2. **Retour immédiat** : Vous recevez un `id_tache` (ex: \"abc123-def456\")     3. **Suivi** : Appelez `/taches/{id_tache}/statut` pour vérifier l'avancement     4. **Résultat** : Quand `statut = \"SUCCESS\"`, le champ `resultat` contient la réponse complète      **Credentials et signature** : Mêmes modes que la version synchrone (JWT ou payload).
    # @param soumettre_facture_complete_request [SoumettreFactureCompleteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [ReponseTache]
    def soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post(soumettre_facture_complete_request, opts = {})
      data, _status_code, _headers = soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post_with_http_info(soumettre_facture_complete_request, opts)
      data
    end

    # Soumettre une facture complète (asynchrone avec Celery)
    # Version asynchrone de l&#39;endpoint &#x60;/factures/soumettre-complete&#x60; utilisant Celery pour le traitement en arrière-plan.      **Workflow automatisé (identique à la version synchrone) :**     1. **Auto-enrichissement** (optionnel) : récupère les données via APIs publiques et Chorus Pro/AFNOR     2. **Génération PDF Factur-X** : crée un PDF/A-3 avec XML embarqué     3. **Signature électronique** (optionnelle) : signe le PDF avec un certificat     4. **Soumission** : envoie vers la destination choisie (Chorus Pro ou AFNOR PDP)      **Destinations supportées :**     - **Chorus Pro** : plateforme B2G française (factures vers secteur public)     - **AFNOR PDP** : Plateformes de Dématérialisation Partenaires      **Différences avec la version synchrone :**     - ✅ **Non-bloquant** : Retourne immédiatement un &#x60;id_tache&#x60; (HTTP 202 Accepted)     - ✅ **Traitement en arrière-plan** : La facture est traitée par un worker Celery     - ✅ **Suivi d&#39;avancement** : Utilisez &#x60;/taches/{id_tache}/statut&#x60; pour suivre le statut     - ✅ **Idéal pour gros volumes** : Permet de traiter de nombreuses factures en parallèle      **Comment utiliser :**     1. **Soumission** : Appelez cet endpoint avec vos données de facture     2. **Retour immédiat** : Vous recevez un &#x60;id_tache&#x60; (ex: \&quot;abc123-def456\&quot;)     3. **Suivi** : Appelez &#x60;/taches/{id_tache}/statut&#x60; pour vérifier l&#39;avancement     4. **Résultat** : Quand &#x60;statut &#x3D; \&quot;SUCCESS\&quot;&#x60;, le champ &#x60;resultat&#x60; contient la réponse complète      **Credentials et signature** : Mêmes modes que la version synchrone (JWT ou payload).
    # @param soumettre_facture_complete_request [SoumettreFactureCompleteRequest] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ReponseTache, Integer, Hash)>] ReponseTache data, response status code and response headers
    def soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post_with_http_info(soumettre_facture_complete_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post ...'
      end
      # verify the required parameter 'soumettre_facture_complete_request' is set
      if @api_client.config.client_side_validation && soumettre_facture_complete_request.nil?
        fail ArgumentError, "Missing the required parameter 'soumettre_facture_complete_request' when calling TraitementFactureApi.soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/factures/soumettre-complete-async'

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(soumettre_facture_complete_request)

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseTache'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#soumettre_facture_complete_async_api_v1_traitement_factures_soumettre_complete_async_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Valider un PDF Factur-X complet
    # Valide un PDF Factur-X complet selon les normes européennes et françaises.  ## Normes de validation appliquées  - **EN 16931** : Norme sémantique européenne (directive 2014/55/UE) - **ISO 19005-3** (PDF/A-3) : Archivage électronique à long terme - **Factur-X / ZUGFeRD** : Spécification franco-allemande - **Schematron** : Validation des règles métier XML - **eIDAS** : Règlement européen sur l'identification électronique (signatures)  ## Contrôles effectués  ### 1. Extraction et validation du XML Factur-X **Contrôles réalisés :** - Présence d'un fichier XML embarqué (`factur-x.xml` ou `zugferd-invoice.xml`) - Détection automatique du profil (MINIMUM, BASIC, EN16931, EXTENDED) - Parsing XML avec validation UTF-8 - Extraction du GuidelineSpecifiedDocumentContextParameter/ID  **Validation Schematron :** - Règles métier du profil détecté (MINIMUM : 45 règles, EN16931 : 178 règles) - Cardinalité des éléments obligatoires - Cohérence des calculs (montants HT, TVA, TTC, remises) - Formats des identifiants (SIRET, TVA intracommunautaire, IBAN) - Codes normalisés (codes pays ISO, unités UN/ECE, codes TVA)  **Ce qui est vérifié :** - ✅ Structure XML conforme XSD Cross Industry Invoice - ✅ Namespace UN/CEFACT correct - ✅ Règles de gestion européennes (BR-xx) - ✅ Règles françaises spécifiques (FR-xx)  ### 2. Conformité PDF/A-3 **Validation de base (métadonnées) :** - Présence du champ `/Type` à `Catalog` - Métadonnée `pdfaid:part` = 3 (PDF/A-3) - Métadonnée `pdfaid:conformance` = B ou U - Version PDF >= 1.4  **Validation stricte VeraPDF (si use_verapdf=True) :** - 146+ règles ISO 19005-3 (PDF/A-3B) - Absence de contenu interdit (JavaScript, multimedia, formulaires dynamiques) - Polices embarquées et sous-ensembles corrects - Espaces colorimétriques conformes (sRGB, DeviceGray) - Structure de fichier valide (cross-reference table) - Métadonnées XMP conformes ISO 16684-1  **Ce qui est vérifié :** - ✅ Fichier archivable à long terme (20+ ans) - ✅ Lisibilité garantie (polices embarquées) - ✅ Conformité légale (France, Allemagne, UE)  ### 3. Métadonnées XMP (eXtensible Metadata Platform) **Contrôles réalisés :** - Présence du bloc `<?xpacket>` avec métadonnées XMP - Namespace `fx:` pour Factur-X : `urn:factur-x:pdfa:CrossIndustryDocument:invoice:1p0#` - Champs Factur-X obligatoires :   - `fx:ConformanceLevel` : Profil (MINIMUM, BASIC, EN16931, EXTENDED)   - `fx:DocumentFileName` : Nom du XML embarqué   - `fx:DocumentType` : \"INVOICE\"   - `fx:Version` : Version Factur-X (1.0.07)  **Ce qui est vérifié :** - ✅ Métadonnées conformes ISO 16684-1 - ✅ Profil Factur-X déclaré correct - ✅ Version Factur-X supportée  ### 4. Signatures électroniques **Détection et analyse :** - Présence de dictionnaires `/Sig` dans le PDF - Type de signature : PAdES (PDF Advanced Electronic Signature) - Extraction des informations :   - Nom du signataire (`/Name`)   - Date de signature (`/M`)   - Raison de la signature (`/Reason`)   - Lieu de signature (`/Location`)   - Type de signature (approval, certification)  **Ce qui est vérifié :** - ✅ Présence de signatures ou cachets - ✅ Nombre de signatures (mono ou multi-signature) - ℹ️ Pas de vérification cryptographique (nécessite certificats)  ## Paramètres  - **fichier_pdf** (requis) : Le fichier PDF Factur-X à valider - **profil** (optionnel) : Profil attendu. Si absent, détection automatique depuis le XML - **use_verapdf** (optionnel, défaut=false) : Active la validation stricte PDF/A avec VeraPDF   - `false` : Validation rapide par métadonnées (2-3 secondes)   - `true` : Validation complète ISO 19005-3 (15-30 secondes, **recommandé en production**)  ## Réponse détaillée  ```json {   \"est_conforme\": true,   \"xml\": {     \"present\": true,     \"conforme\": true,     \"profil\": \"EN16931\",     \"erreurs\": []   },   \"pdfa\": {     \"conforme\": true,     \"version\": \"PDF/A-3B\",     \"methode\": \"verapdf\",     \"erreurs\": []   },   \"xmp\": {     \"present\": true,     \"conforme\": true,     \"metadonnees\": {...}   },   \"signatures\": {     \"present\": true,     \"nombre\": 1,     \"details\": [...]   } } ```  ## Cas d'usage  - **Avant envoi** : Valider la facture générée avant transmission à un client - **À réception** : Vérifier la conformité d'une facture reçue d'un fournisseur - **Audit** : Contrôler la qualité de lots de factures - **Conformité légale** : S'assurer du respect des obligations B2B/B2G en France - **Debugging** : Identifier les problèmes dans le processus de génération - **Archivage** : Garantir la validité à long terme (PDF/A-3)  ## Temps de traitement  - Validation basique : 2-3 secondes - Validation VeraPDF : 15-30 secondes (dépend de la taille du PDF)
    # @param fichier_pdf [File] Fichier PDF Factur-X à valider (format .pdf).
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil 
    # @option opts [Boolean] :use_verapdf Active la validation stricte PDF/A avec VeraPDF (recommandé pour la production). Si False, utilise une validation basique par métadonnées. (default to false)
    # @return [ResultatValidationPDFAPI]
    def valider_pdf_facturx_api_v1_traitement_valider_pdf_facturx_post(fichier_pdf, opts = {})
      data, _status_code, _headers = valider_pdf_facturx_api_v1_traitement_valider_pdf_facturx_post_with_http_info(fichier_pdf, opts)
      data
    end

    # Valider un PDF Factur-X complet
    # Valide un PDF Factur-X complet selon les normes européennes et françaises.  ## Normes de validation appliquées  - **EN 16931** : Norme sémantique européenne (directive 2014/55/UE) - **ISO 19005-3** (PDF/A-3) : Archivage électronique à long terme - **Factur-X / ZUGFeRD** : Spécification franco-allemande - **Schematron** : Validation des règles métier XML - **eIDAS** : Règlement européen sur l&#39;identification électronique (signatures)  ## Contrôles effectués  ### 1. Extraction et validation du XML Factur-X **Contrôles réalisés :** - Présence d&#39;un fichier XML embarqué (&#x60;factur-x.xml&#x60; ou &#x60;zugferd-invoice.xml&#x60;) - Détection automatique du profil (MINIMUM, BASIC, EN16931, EXTENDED) - Parsing XML avec validation UTF-8 - Extraction du GuidelineSpecifiedDocumentContextParameter/ID  **Validation Schematron :** - Règles métier du profil détecté (MINIMUM : 45 règles, EN16931 : 178 règles) - Cardinalité des éléments obligatoires - Cohérence des calculs (montants HT, TVA, TTC, remises) - Formats des identifiants (SIRET, TVA intracommunautaire, IBAN) - Codes normalisés (codes pays ISO, unités UN/ECE, codes TVA)  **Ce qui est vérifié :** - ✅ Structure XML conforme XSD Cross Industry Invoice - ✅ Namespace UN/CEFACT correct - ✅ Règles de gestion européennes (BR-xx) - ✅ Règles françaises spécifiques (FR-xx)  ### 2. Conformité PDF/A-3 **Validation de base (métadonnées) :** - Présence du champ &#x60;/Type&#x60; à &#x60;Catalog&#x60; - Métadonnée &#x60;pdfaid:part&#x60; &#x3D; 3 (PDF/A-3) - Métadonnée &#x60;pdfaid:conformance&#x60; &#x3D; B ou U - Version PDF &gt;&#x3D; 1.4  **Validation stricte VeraPDF (si use_verapdf&#x3D;True) :** - 146+ règles ISO 19005-3 (PDF/A-3B) - Absence de contenu interdit (JavaScript, multimedia, formulaires dynamiques) - Polices embarquées et sous-ensembles corrects - Espaces colorimétriques conformes (sRGB, DeviceGray) - Structure de fichier valide (cross-reference table) - Métadonnées XMP conformes ISO 16684-1  **Ce qui est vérifié :** - ✅ Fichier archivable à long terme (20+ ans) - ✅ Lisibilité garantie (polices embarquées) - ✅ Conformité légale (France, Allemagne, UE)  ### 3. Métadonnées XMP (eXtensible Metadata Platform) **Contrôles réalisés :** - Présence du bloc &#x60;&lt;?xpacket&gt;&#x60; avec métadonnées XMP - Namespace &#x60;fx:&#x60; pour Factur-X : &#x60;urn:factur-x:pdfa:CrossIndustryDocument:invoice:1p0#&#x60; - Champs Factur-X obligatoires :   - &#x60;fx:ConformanceLevel&#x60; : Profil (MINIMUM, BASIC, EN16931, EXTENDED)   - &#x60;fx:DocumentFileName&#x60; : Nom du XML embarqué   - &#x60;fx:DocumentType&#x60; : \&quot;INVOICE\&quot;   - &#x60;fx:Version&#x60; : Version Factur-X (1.0.07)  **Ce qui est vérifié :** - ✅ Métadonnées conformes ISO 16684-1 - ✅ Profil Factur-X déclaré correct - ✅ Version Factur-X supportée  ### 4. Signatures électroniques **Détection et analyse :** - Présence de dictionnaires &#x60;/Sig&#x60; dans le PDF - Type de signature : PAdES (PDF Advanced Electronic Signature) - Extraction des informations :   - Nom du signataire (&#x60;/Name&#x60;)   - Date de signature (&#x60;/M&#x60;)   - Raison de la signature (&#x60;/Reason&#x60;)   - Lieu de signature (&#x60;/Location&#x60;)   - Type de signature (approval, certification)  **Ce qui est vérifié :** - ✅ Présence de signatures ou cachets - ✅ Nombre de signatures (mono ou multi-signature) - ℹ️ Pas de vérification cryptographique (nécessite certificats)  ## Paramètres  - **fichier_pdf** (requis) : Le fichier PDF Factur-X à valider - **profil** (optionnel) : Profil attendu. Si absent, détection automatique depuis le XML - **use_verapdf** (optionnel, défaut&#x3D;false) : Active la validation stricte PDF/A avec VeraPDF   - &#x60;false&#x60; : Validation rapide par métadonnées (2-3 secondes)   - &#x60;true&#x60; : Validation complète ISO 19005-3 (15-30 secondes, **recommandé en production**)  ## Réponse détaillée  &#x60;&#x60;&#x60;json {   \&quot;est_conforme\&quot;: true,   \&quot;xml\&quot;: {     \&quot;present\&quot;: true,     \&quot;conforme\&quot;: true,     \&quot;profil\&quot;: \&quot;EN16931\&quot;,     \&quot;erreurs\&quot;: []   },   \&quot;pdfa\&quot;: {     \&quot;conforme\&quot;: true,     \&quot;version\&quot;: \&quot;PDF/A-3B\&quot;,     \&quot;methode\&quot;: \&quot;verapdf\&quot;,     \&quot;erreurs\&quot;: []   },   \&quot;xmp\&quot;: {     \&quot;present\&quot;: true,     \&quot;conforme\&quot;: true,     \&quot;metadonnees\&quot;: {...}   },   \&quot;signatures\&quot;: {     \&quot;present\&quot;: true,     \&quot;nombre\&quot;: 1,     \&quot;details\&quot;: [...]   } } &#x60;&#x60;&#x60;  ## Cas d&#39;usage  - **Avant envoi** : Valider la facture générée avant transmission à un client - **À réception** : Vérifier la conformité d&#39;une facture reçue d&#39;un fournisseur - **Audit** : Contrôler la qualité de lots de factures - **Conformité légale** : S&#39;assurer du respect des obligations B2B/B2G en France - **Debugging** : Identifier les problèmes dans le processus de génération - **Archivage** : Garantir la validité à long terme (PDF/A-3)  ## Temps de traitement  - Validation basique : 2-3 secondes - Validation VeraPDF : 15-30 secondes (dépend de la taille du PDF)
    # @param fichier_pdf [File] Fichier PDF Factur-X à valider (format .pdf).
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil 
    # @option opts [Boolean] :use_verapdf Active la validation stricte PDF/A avec VeraPDF (recommandé pour la production). Si False, utilise une validation basique par métadonnées. (default to false)
    # @return [Array<(ResultatValidationPDFAPI, Integer, Hash)>] ResultatValidationPDFAPI data, response status code and response headers
    def valider_pdf_facturx_api_v1_traitement_valider_pdf_facturx_post_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.valider_pdf_facturx_api_v1_traitement_valider_pdf_facturx_post ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling TraitementFactureApi.valider_pdf_facturx_api_v1_traitement_valider_pdf_facturx_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/valider-pdf-facturx'

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
      form_params['profil'] = opts[:'profil'] if !opts[:'profil'].nil?
      form_params['use_verapdf'] = opts[:'use_verapdf'] if !opts[:'use_verapdf'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ResultatValidationPDFAPI'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.valider_pdf_facturx_api_v1_traitement_valider_pdf_facturx_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#valider_pdf_facturx_api_v1_traitement_valider_pdf_facturx_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Valider un PDF Factur-X (asynchrone avec polling)
    # Valide un PDF Factur-X de manière asynchrone avec système de polling.  ## Fonctionnement  1. **Soumission** : Le PDF est mis en file d'attente pour validation asynchrone 2. **Retour immédiat** : Vous recevez un `id_tache` (HTTP 202) 3. **Suivi** : Utilisez l'endpoint `/taches/{id_tache}/statut` pour suivre l'avancement  ## Avantages du mode asynchrone  - **Pas de timeout** : Idéal pour les gros PDFs ou la validation VeraPDF (qui peut prendre plusieurs secondes) - **Scalabilité** : Les validations sont traitées par des workers Celery dédiés - **Suivi d'état** : Permet de suivre la progression de la validation - **Non-bloquant** : Votre client ne reste pas en attente pendant la validation  ## Quand utiliser ce mode ?  - **Validation VeraPDF activée** (`use_verapdf=True`) : La validation stricte peut prendre 2-10 secondes - **Gros fichiers PDF** : PDFs > 1 MB - **Traitement par lots** : Validation de multiples factures en parallèle - **Intégration asynchrone** : Votre système supporte le polling  ## Contrôles effectués  ### 1. Extraction et validation du XML Factur-X - Vérifie la présence d'un fichier XML embarqué conforme Factur-X - Détecte automatiquement le profil utilisé (MINIMUM, BASIC, EN16931, EXTENDED) - Valide le XML contre les règles Schematron du profil détecté  ### 2. Conformité PDF/A - **Sans VeraPDF** : Validation basique par métadonnées (rapide, ~100ms) - **Avec VeraPDF** : Validation stricte selon ISO 19005 (146+ règles, 2-10s)   - Détecte la version PDF/A (PDF/A-1, PDF/A-3, etc.)   - Rapports détaillés des non-conformités  ### 3. Métadonnées XMP - Vérifie la présence de métadonnées XMP dans le PDF - Valide la conformité des métadonnées Factur-X (profil, version) - Extrait toutes les métadonnées XMP disponibles  ### 4. Signatures électroniques - Détecte la présence de signatures ou cachets électroniques - Extrait les informations sur chaque signature (signataire, date, raison) - Compte le nombre de signatures présentes  ## Paramètres  - **fichier_pdf** : Le fichier PDF Factur-X à valider - **profil** : Le profil Factur-X attendu (optionnel). Si non spécifié, le profil   sera automatiquement détecté depuis le fichier XML embarqué. - **use_verapdf** : Active la validation stricte PDF/A avec VeraPDF.   ⚠️ **Attention** : VeraPDF peut prendre 2-10 secondes selon la taille du PDF.   Recommandé uniquement en mode asynchrone pour éviter les timeouts.  ## Récupération du résultat  Après soumission, utilisez l'endpoint `GET /taches/{id_tache}/statut` pour récupérer le résultat.  **Exemple de polling** : ```python import requests import time  # 1. Soumettre la tâche response = requests.post(\"/valider-facturx-async\", files={\"fichier_pdf\": pdf_file}) task_id = response.json()[\"id_tache\"]  # 2. Polling toutes les 2 secondes while True:     status_response = requests.get(f\"/taches/{task_id}/statut\")     status = status_response.json()      if status[\"statut\"] == \"SUCCESS\":         resultat = status[\"resultat\"][\"resultat_validation\"]         print(f\"Conforme: {resultat['est_conforme']}\")         break     elif status[\"statut\"] == \"FAILURE\":         print(f\"Erreur: {status['resultat']['errorMessage']}\")         break      time.sleep(2)  # Attendre 2 secondes avant le prochain check ```  ## Cas d'usage  - Valider des factures avant envoi avec VeraPDF (validation stricte) - Traiter des lots de factures en parallèle - Intégrer la validation dans un pipeline asynchrone - Valider des PDFs volumineux sans risque de timeout
    # @param fichier_pdf [File] Fichier PDF Factur-X à valider (format .pdf).
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil 
    # @option opts [Boolean] :use_verapdf Active la validation stricte PDF/A avec VeraPDF (recommandé pour la production). Peut prendre plusieurs secondes. (default to false)
    # @return [ReponseTache]
    def valider_pdf_facturx_async_api_v1_traitement_valider_facturx_async_post(fichier_pdf, opts = {})
      data, _status_code, _headers = valider_pdf_facturx_async_api_v1_traitement_valider_facturx_async_post_with_http_info(fichier_pdf, opts)
      data
    end

    # Valider un PDF Factur-X (asynchrone avec polling)
    # Valide un PDF Factur-X de manière asynchrone avec système de polling.  ## Fonctionnement  1. **Soumission** : Le PDF est mis en file d&#39;attente pour validation asynchrone 2. **Retour immédiat** : Vous recevez un &#x60;id_tache&#x60; (HTTP 202) 3. **Suivi** : Utilisez l&#39;endpoint &#x60;/taches/{id_tache}/statut&#x60; pour suivre l&#39;avancement  ## Avantages du mode asynchrone  - **Pas de timeout** : Idéal pour les gros PDFs ou la validation VeraPDF (qui peut prendre plusieurs secondes) - **Scalabilité** : Les validations sont traitées par des workers Celery dédiés - **Suivi d&#39;état** : Permet de suivre la progression de la validation - **Non-bloquant** : Votre client ne reste pas en attente pendant la validation  ## Quand utiliser ce mode ?  - **Validation VeraPDF activée** (&#x60;use_verapdf&#x3D;True&#x60;) : La validation stricte peut prendre 2-10 secondes - **Gros fichiers PDF** : PDFs &gt; 1 MB - **Traitement par lots** : Validation de multiples factures en parallèle - **Intégration asynchrone** : Votre système supporte le polling  ## Contrôles effectués  ### 1. Extraction et validation du XML Factur-X - Vérifie la présence d&#39;un fichier XML embarqué conforme Factur-X - Détecte automatiquement le profil utilisé (MINIMUM, BASIC, EN16931, EXTENDED) - Valide le XML contre les règles Schematron du profil détecté  ### 2. Conformité PDF/A - **Sans VeraPDF** : Validation basique par métadonnées (rapide, ~100ms) - **Avec VeraPDF** : Validation stricte selon ISO 19005 (146+ règles, 2-10s)   - Détecte la version PDF/A (PDF/A-1, PDF/A-3, etc.)   - Rapports détaillés des non-conformités  ### 3. Métadonnées XMP - Vérifie la présence de métadonnées XMP dans le PDF - Valide la conformité des métadonnées Factur-X (profil, version) - Extrait toutes les métadonnées XMP disponibles  ### 4. Signatures électroniques - Détecte la présence de signatures ou cachets électroniques - Extrait les informations sur chaque signature (signataire, date, raison) - Compte le nombre de signatures présentes  ## Paramètres  - **fichier_pdf** : Le fichier PDF Factur-X à valider - **profil** : Le profil Factur-X attendu (optionnel). Si non spécifié, le profil   sera automatiquement détecté depuis le fichier XML embarqué. - **use_verapdf** : Active la validation stricte PDF/A avec VeraPDF.   ⚠️ **Attention** : VeraPDF peut prendre 2-10 secondes selon la taille du PDF.   Recommandé uniquement en mode asynchrone pour éviter les timeouts.  ## Récupération du résultat  Après soumission, utilisez l&#39;endpoint &#x60;GET /taches/{id_tache}/statut&#x60; pour récupérer le résultat.  **Exemple de polling** : &#x60;&#x60;&#x60;python import requests import time  # 1. Soumettre la tâche response &#x3D; requests.post(\&quot;/valider-facturx-async\&quot;, files&#x3D;{\&quot;fichier_pdf\&quot;: pdf_file}) task_id &#x3D; response.json()[\&quot;id_tache\&quot;]  # 2. Polling toutes les 2 secondes while True:     status_response &#x3D; requests.get(f\&quot;/taches/{task_id}/statut\&quot;)     status &#x3D; status_response.json()      if status[\&quot;statut\&quot;] &#x3D;&#x3D; \&quot;SUCCESS\&quot;:         resultat &#x3D; status[\&quot;resultat\&quot;][\&quot;resultat_validation\&quot;]         print(f\&quot;Conforme: {resultat[&#39;est_conforme&#39;]}\&quot;)         break     elif status[\&quot;statut\&quot;] &#x3D;&#x3D; \&quot;FAILURE\&quot;:         print(f\&quot;Erreur: {status[&#39;resultat&#39;][&#39;errorMessage&#39;]}\&quot;)         break      time.sleep(2)  # Attendre 2 secondes avant le prochain check &#x60;&#x60;&#x60;  ## Cas d&#39;usage  - Valider des factures avant envoi avec VeraPDF (validation stricte) - Traiter des lots de factures en parallèle - Intégrer la validation dans un pipeline asynchrone - Valider des PDFs volumineux sans risque de timeout
    # @param fichier_pdf [File] Fichier PDF Factur-X à valider (format .pdf).
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil 
    # @option opts [Boolean] :use_verapdf Active la validation stricte PDF/A avec VeraPDF (recommandé pour la production). Peut prendre plusieurs secondes. (default to false)
    # @return [Array<(ReponseTache, Integer, Hash)>] ReponseTache data, response status code and response headers
    def valider_pdf_facturx_async_api_v1_traitement_valider_facturx_async_post_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.valider_pdf_facturx_async_api_v1_traitement_valider_facturx_async_post ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling TraitementFactureApi.valider_pdf_facturx_async_api_v1_traitement_valider_facturx_async_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/valider-facturx-async'

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
      form_params['profil'] = opts[:'profil'] if !opts[:'profil'].nil?
      form_params['use_verapdf'] = opts[:'use_verapdf'] if !opts[:'use_verapdf'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseTache'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.valider_pdf_facturx_async_api_v1_traitement_valider_facturx_async_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#valider_pdf_facturx_async_api_v1_traitement_valider_facturx_async_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Valider les signatures électroniques d'un PDF
    # Valide les signatures électroniques présentes dans un PDF uploadé.      **Vérifications effectuées** :     - Présence de signatures     - Intégrité du document (non modifié depuis signature)     - Validité des certificats     - Chaîne de confiance (si disponible)     - Présence d'horodatage (PAdES-B-T)     - Données de validation (PAdES-B-LT)      **Standards supportés** : PAdES-B-B, PAdES-B-T, PAdES-B-LT, ISO 32000-2.      **⚠️ Note** : Cette validation est technique (intégrité cryptographique). La validité juridique     dépend du niveau eIDAS du certificat (SES/AdES/QES) et du contexte d'utilisation.
    # @param fichier_pdf [File] Fichier PDF à valider (sera analysé pour détecter et valider les signatures)
    # @param [Hash] opts the optional parameters
    # @return [Object]
    def valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post(fichier_pdf, opts = {})
      data, _status_code, _headers = valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post_with_http_info(fichier_pdf, opts)
      data
    end

    # Valider les signatures électroniques d&#39;un PDF
    # Valide les signatures électroniques présentes dans un PDF uploadé.      **Vérifications effectuées** :     - Présence de signatures     - Intégrité du document (non modifié depuis signature)     - Validité des certificats     - Chaîne de confiance (si disponible)     - Présence d&#39;horodatage (PAdES-B-T)     - Données de validation (PAdES-B-LT)      **Standards supportés** : PAdES-B-B, PAdES-B-T, PAdES-B-LT, ISO 32000-2.      **⚠️ Note** : Cette validation est technique (intégrité cryptographique). La validité juridique     dépend du niveau eIDAS du certificat (SES/AdES/QES) et du contexte d&#39;utilisation.
    # @param fichier_pdf [File] Fichier PDF à valider (sera analysé pour détecter et valider les signatures)
    # @param [Hash] opts the optional parameters
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post_with_http_info(fichier_pdf, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post ...'
      end
      # verify the required parameter 'fichier_pdf' is set
      if @api_client.config.client_side_validation && fichier_pdf.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_pdf' when calling TraitementFactureApi.valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/valider-signature-pdf'

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
      return_type = opts[:debug_return_type] || 'Object'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#valider_signature_pdf_endpoint_api_v1_traitement_valider_signature_pdf_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Valider un XML Factur-X existant
    # Valide un fichier XML Factur-X contre les règles métier Schematron selon la norme EN 16931.  ## Norme appliquée  **Schematron ISO/IEC 19757-3** : Langage de validation de règles métier pour XML - Validation sémantique (au-delà de la syntaxe XSD) - Règles métier européennes EN 16931 - Règles françaises spécifiques Factur-X - Calculs arithmétiques et cohérence des données  ## Profils et règles validées  ### MINIMUM (45 règles) - Identifiant de facture unique - Dates (émission, échéance) - Identifiants parties (SIRET/SIREN) - Montant total TTC  ### BASIC (102 règles) - Toutes les règles MINIMUM - Lignes de facture détaillées - Calculs de TVA basiques - Modes de paiement - Références (commande, contrat)  ### EN16931 (178 règles) - Toutes les règles BASIC - **Règles européennes (BR-xx)** : 81 règles business - **Règles françaises (FR-xx)** : 12 règles spécifiques France - **Calculs avancés (CR-xx)** : 32 règles de calcul - **Codes normalisés (CL-xx)** : 52 listes de codes  ### EXTENDED (210+ règles) - Toutes les règles EN16931 - Informations logistiques - Données comptables avancées - Références externes multiples  ## Contrôles effectués  ### 1. Validation syntaxique - Parsing XML correct (UTF-8, bien formé) - Namespaces UN/CEFACT présents - Structure hiérarchique respectée  ### 2. Règles business (BR-xx) Exemples : - `BR-1` : Le total de la facture doit être égal à la somme des totaux de lignes + montants au niveau document - `BR-CO-10` : La somme des montants de base de TVA doit être égale au total net de la facture - `BR-16` : Le code de devise de la facture doit figurer dans la liste ISO 4217  ### 3. Règles françaises (FR-xx) Exemples : - `FR-1` : Le SIRET fournisseur doit avoir 14 chiffres - `FR-2` : Le SIRET client doit avoir 14 chiffres (si présent) - `FR-5` : Le numéro de TVA intracommunautaire doit être au format FRxx999999999  ### 4. Règles de calcul (CR-xx) - Montants HT + TVA = TTC - Somme des lignes = Total document - Remises et majorations correctement appliquées - Arrondis conformes (2 décimales pour les montants)  ### 5. Codes normalisés (CL-xx) - Codes pays ISO 3166-1 alpha-2 - Codes devises ISO 4217 - Unités de mesure UN/ECE Rec 20 - Codes TVA (types, catégories, exonérations) - SchemeID pour identifiants (0002=SIREN, 0009=SIRET, etc.)  ## Processus de validation  1. **Chargement XSLT** : Fichier Schematron converti en XSLT (Saxon-HE) 2. **Transformation** : Application des règles sur le XML 3. **Analyse résultats** : Extraction des erreurs (`failed-assert`) et avertissements (`successful-report`) 4. **Rapport** : Liste structurée des non-conformités  ## Réponses  **200 OK** : XML conforme ```json {   \"message\": \"Le XML est conforme au profil EN16931\" } ```  **400 Bad Request** : XML non conforme ```json {   \"detail\": [     \"[BR-1] Le total de la facture (120.00) ne correspond pas à la somme calculée (100.00 + 20.00)\",     \"[FR-1] Le SIRET fournisseur doit contenir exactement 14 chiffres\"   ] } ```  ## Cas d'usage  - **Pré-validation** : Vérifier un XML avant intégration dans un PDF/A - **Debugging** : Identifier précisément les erreurs de génération - **Tests** : Valider des XMLs de test ou d'exemple - **Conformité** : S'assurer du respect des règles européennes et françaises - **Développement** : Tester rapidement sans générer de PDF  ## Temps de traitement  - Profil MINIMUM : ~0.5 seconde - Profil EN16931 : ~1-2 secondes - Profil EXTENDED : ~2-3 secondes
    # @param fichier_xml [File] Fichier XML Factur-X à valider (format .xml).
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil Profil de validation (MINIMUM, BASIC, EN16931, EXTENDED).
    # @return [ReponseValidationSucces]
    def valider_xml_api_v1_traitement_valider_xml_post(fichier_xml, opts = {})
      data, _status_code, _headers = valider_xml_api_v1_traitement_valider_xml_post_with_http_info(fichier_xml, opts)
      data
    end

    # Valider un XML Factur-X existant
    # Valide un fichier XML Factur-X contre les règles métier Schematron selon la norme EN 16931.  ## Norme appliquée  **Schematron ISO/IEC 19757-3** : Langage de validation de règles métier pour XML - Validation sémantique (au-delà de la syntaxe XSD) - Règles métier européennes EN 16931 - Règles françaises spécifiques Factur-X - Calculs arithmétiques et cohérence des données  ## Profils et règles validées  ### MINIMUM (45 règles) - Identifiant de facture unique - Dates (émission, échéance) - Identifiants parties (SIRET/SIREN) - Montant total TTC  ### BASIC (102 règles) - Toutes les règles MINIMUM - Lignes de facture détaillées - Calculs de TVA basiques - Modes de paiement - Références (commande, contrat)  ### EN16931 (178 règles) - Toutes les règles BASIC - **Règles européennes (BR-xx)** : 81 règles business - **Règles françaises (FR-xx)** : 12 règles spécifiques France - **Calculs avancés (CR-xx)** : 32 règles de calcul - **Codes normalisés (CL-xx)** : 52 listes de codes  ### EXTENDED (210+ règles) - Toutes les règles EN16931 - Informations logistiques - Données comptables avancées - Références externes multiples  ## Contrôles effectués  ### 1. Validation syntaxique - Parsing XML correct (UTF-8, bien formé) - Namespaces UN/CEFACT présents - Structure hiérarchique respectée  ### 2. Règles business (BR-xx) Exemples : - &#x60;BR-1&#x60; : Le total de la facture doit être égal à la somme des totaux de lignes + montants au niveau document - &#x60;BR-CO-10&#x60; : La somme des montants de base de TVA doit être égale au total net de la facture - &#x60;BR-16&#x60; : Le code de devise de la facture doit figurer dans la liste ISO 4217  ### 3. Règles françaises (FR-xx) Exemples : - &#x60;FR-1&#x60; : Le SIRET fournisseur doit avoir 14 chiffres - &#x60;FR-2&#x60; : Le SIRET client doit avoir 14 chiffres (si présent) - &#x60;FR-5&#x60; : Le numéro de TVA intracommunautaire doit être au format FRxx999999999  ### 4. Règles de calcul (CR-xx) - Montants HT + TVA &#x3D; TTC - Somme des lignes &#x3D; Total document - Remises et majorations correctement appliquées - Arrondis conformes (2 décimales pour les montants)  ### 5. Codes normalisés (CL-xx) - Codes pays ISO 3166-1 alpha-2 - Codes devises ISO 4217 - Unités de mesure UN/ECE Rec 20 - Codes TVA (types, catégories, exonérations) - SchemeID pour identifiants (0002&#x3D;SIREN, 0009&#x3D;SIRET, etc.)  ## Processus de validation  1. **Chargement XSLT** : Fichier Schematron converti en XSLT (Saxon-HE) 2. **Transformation** : Application des règles sur le XML 3. **Analyse résultats** : Extraction des erreurs (&#x60;failed-assert&#x60;) et avertissements (&#x60;successful-report&#x60;) 4. **Rapport** : Liste structurée des non-conformités  ## Réponses  **200 OK** : XML conforme &#x60;&#x60;&#x60;json {   \&quot;message\&quot;: \&quot;Le XML est conforme au profil EN16931\&quot; } &#x60;&#x60;&#x60;  **400 Bad Request** : XML non conforme &#x60;&#x60;&#x60;json {   \&quot;detail\&quot;: [     \&quot;[BR-1] Le total de la facture (120.00) ne correspond pas à la somme calculée (100.00 + 20.00)\&quot;,     \&quot;[FR-1] Le SIRET fournisseur doit contenir exactement 14 chiffres\&quot;   ] } &#x60;&#x60;&#x60;  ## Cas d&#39;usage  - **Pré-validation** : Vérifier un XML avant intégration dans un PDF/A - **Debugging** : Identifier précisément les erreurs de génération - **Tests** : Valider des XMLs de test ou d&#39;exemple - **Conformité** : S&#39;assurer du respect des règles européennes et françaises - **Développement** : Tester rapidement sans générer de PDF  ## Temps de traitement  - Profil MINIMUM : ~0.5 seconde - Profil EN16931 : ~1-2 secondes - Profil EXTENDED : ~2-3 secondes
    # @param fichier_xml [File] Fichier XML Factur-X à valider (format .xml).
    # @param [Hash] opts the optional parameters
    # @option opts [ProfilAPI] :profil Profil de validation (MINIMUM, BASIC, EN16931, EXTENDED).
    # @return [Array<(ReponseValidationSucces, Integer, Hash)>] ReponseValidationSucces data, response status code and response headers
    def valider_xml_api_v1_traitement_valider_xml_post_with_http_info(fichier_xml, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TraitementFactureApi.valider_xml_api_v1_traitement_valider_xml_post ...'
      end
      # verify the required parameter 'fichier_xml' is set
      if @api_client.config.client_side_validation && fichier_xml.nil?
        fail ArgumentError, "Missing the required parameter 'fichier_xml' when calling TraitementFactureApi.valider_xml_api_v1_traitement_valider_xml_post"
      end
      # resource path
      local_var_path = '/api/v1/traitement/valider-xml'

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
      form_params['fichier_xml'] = fichier_xml
      form_params['profil'] = opts[:'profil'] if !opts[:'profil'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'ReponseValidationSucces'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['HTTPBearer']

      new_options = opts.merge(
        :operation => :"TraitementFactureApi.valider_xml_api_v1_traitement_valider_xml_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TraitementFactureApi#valider_xml_api_v1_traitement_valider_xml_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
