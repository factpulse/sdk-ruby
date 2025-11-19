=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for FactPulse::AFNORPDPPADirectoryServiceApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'AFNORPDPPADirectoryServiceApi' do
  before do
    # run before each test
    @api_instance = FactPulse::AFNORPDPPADirectoryServiceApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of AFNORPDPPADirectoryServiceApi' do
    it 'should create an instance of AFNORPDPPADirectoryServiceApi' do
      expect(@api_instance).to be_instance_of(FactPulse::AFNORPDPPADirectoryServiceApi)
    end
  end

  # unit tests for create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post
  # Creating a directory line
  # Créer une ligne dans l&#39;annuaire
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'create_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post
  # Create a routing code
  # Créer un code de routage dans l&#39;annuaire
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'create_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete
  # Delete a directory line
  # Supprimer une ligne d&#39;annuaire
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'delete_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_delete test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get
  # Healthcheck Directory Service
  # Vérifier la disponibilité du Directory Service
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'directory_healthcheck_proxy_api_v1_afnor_directory_v1_healthcheck_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get
  # Get a directory line
  # Obtenir une ligne d&#39;annuaire identifiée par un identifiant d&#39;adressage
  # @param addressing_identifier 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_directory_line_by_code_proxy_api_v1_afnor_directory_v1_directory_line_code_addressing_identifier_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get
  # Get a directory line
  # Obtenir une ligne d&#39;annuaire identifiée par son idInstance
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_directory_line_by_id_instance_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get
  # Get a routing code by instance-id
  # Obtenir un code de routage identifié par son idInstance
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_routing_code_by_id_instance_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get
  # Get a routing code by SIRET and routing identifier
  # Consulter un code de routage identifié par SIRET et identifiant de routage
  # @param siret 
  # @param routing_identifier 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_routing_code_by_siret_and_code_proxy_api_v1_afnor_directory_v1_routing_code_siret_siret_code_routing_identifier_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get
  # Consult a siren (legal unit) by SIREN number
  # Retourne les détails d&#39;une entreprise (unité légale) identifiée par son numéro SIREN
  # @param siren 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_siren_by_code_insee_proxy_api_v1_afnor_directory_v1_siren_code_insee_siren_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get
  # Gets a siren (legal unit) by instance ID
  # Obtenir une entreprise (unité légale) identifiée par son idInstance
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_siren_by_id_instance_proxy_api_v1_afnor_directory_v1_siren_id_instance_id_instance_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get
  # Gets a siret (facility) by SIRET number
  # Obtenir un établissement identifié par son numéro SIRET
  # @param siret 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_siret_by_code_insee_proxy_api_v1_afnor_directory_v1_siret_code_insee_siret_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get
  # Gets a siret (facility) by id-instance
  # Obtenir un établissement identifié par son idInstance
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'get_siret_by_id_instance_proxy_api_v1_afnor_directory_v1_siret_id_instance_id_instance_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch
  # Partially updates a directory line
  # Mettre à jour partiellement une ligne d&#39;annuaire
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'patch_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_id_instance_id_instance_patch test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch
  # Partially update a private routing code
  # Mettre à jour partiellement un code de routage privé
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'patch_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_patch test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put
  # Completely update a private routing code
  # Mettre à jour complètement un code de routage privé
  # @param id_instance 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'put_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_id_instance_id_instance_put test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post
  # Search for a directory line
  # Rechercher des lignes d&#39;annuaire selon des critères
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'search_directory_line_proxy_api_v1_afnor_directory_v1_directory_line_search_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post
  # Search for a routing code
  # Rechercher des codes de routage selon des critères
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'search_routing_code_proxy_api_v1_afnor_directory_v1_routing_code_search_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post
  # SIREN search (or legal unit)
  # Recherche multi-critères d&#39;entreprises (unités légales)
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'search_siren_proxy_api_v1_afnor_directory_v1_siren_search_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post
  # Search for a SIRET (facility)
  # Recherche multi-critères d&#39;établissements
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'search_siret_proxy_api_v1_afnor_directory_v1_siret_search_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
