=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'spec_helper'
require 'json'

# Unit tests for FactPulse::ChorusProApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ChorusProApi' do
  before do
    # run before each test
    @api_instance = FactPulse::ChorusProApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ChorusProApi' do
    it 'should create an instance of ChorusProApi' do
      expect(@api_instance).to be_instance_of(FactPulse::ChorusProApi)
    end
  end

  # unit tests for ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post
  # Ajouter une pièce jointe
  # Ajoute une pièce jointe au compte utilisateur courant.      **Taille max** : 10 Mo par fichier      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;pieceJointeFichier\&quot;: \&quot;JVBERi0xLjQKJeLjz9MKNSAwIG9iago8P...\&quot;,       \&quot;pieceJointeNom\&quot;: \&quot;bon_commande.pdf\&quot;,       \&quot;pieceJointeTypeMime\&quot;: \&quot;application/pdf\&quot;,       \&quot;pieceJointeExtension\&quot;: \&quot;PDF\&quot;     }     &#x60;&#x60;&#x60;      **Retour** : L&#39;ID de la pièce jointe (&#x60;pieceJointeIdFichier&#x60;) à utiliser ensuite dans &#x60;/factures/completer&#x60;.      **Extensions acceptées** : PDF, JPG, PNG, ZIP, XML, etc.
  # @param body_ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'ajouter_fichier_api_v1_chorus_pro_transverses_ajouter_fichier_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for completer_facture_api_v1_chorus_pro_factures_completer_post
  # Compléter une facture suspendue (Fournisseur)
  # Complète une facture au statut SUSPENDUE en ajoutant des pièces jointes ou un commentaire.      **Statut requis** : SUSPENDUE      **Actions possibles** :     - Ajouter des pièces jointes (justificatifs, bons de commande, etc.)     - Modifier le commentaire      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;identifiantFactureCPP\&quot;: 12345,       \&quot;commentaire\&quot;: \&quot;Voici les justificatifs demandés\&quot;,       \&quot;listePiecesJointes\&quot;: [         {           \&quot;pieceJointeIdFichier\&quot;: 98765,           \&quot;pieceJointeNom\&quot;: \&quot;bon_commande.pdf\&quot;         }       ]     }     &#x60;&#x60;&#x60;      **Note** : Les pièces jointes doivent d&#39;abord être uploadées via &#x60;/transverses/ajouter-fichier&#x60;.      **Après complétion** : La facture repasse au statut MISE_A_DISPOSITION.
  # @param body_completer_facture_api_v1_chorus_pro_factures_completer_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'completer_facture_api_v1_chorus_pro_factures_completer_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for consulter_facture_api_v1_chorus_pro_factures_consulter_post
  # Consulter le statut d&#39;une facture
  # Récupère les informations et le statut actuel d&#39;une facture soumise à Chorus Pro.      **Retour** :     - Numéro et date de facture     - Montant TTC     - **Statut courant** : SOUMISE, VALIDEE, REJETEE, SUSPENDUE, MANDATEE, MISE_EN_PAIEMENT, etc.     - Structure destinataire      **Cas d&#39;usage** :     - Suivre l&#39;évolution du traitement d&#39;une facture     - Vérifier si une facture a été validée ou rejetée     - Obtenir la date de mise en paiement      **Polling** : Appelez cet endpoint régulièrement pour suivre l&#39;évolution du statut.
  # @param consulter_facture_request 
  # @param [Hash] opts the optional parameters
  # @return [ConsulterFactureResponse]
  describe 'consulter_facture_api_v1_chorus_pro_factures_consulter_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for consulter_structure_api_v1_chorus_pro_structures_consulter_post
  # Consulter les détails d&#39;une structure
  # Récupère les informations détaillées d&#39;une structure Chorus Pro.       **Retour** :     - Raison sociale     - Numéro de TVA intracommunautaire     - Email de contact     - **Paramètres obligatoires** : Indique si le code service et/ou numéro d&#39;engagement sont requis pour soumettre une facture      **Étape typique** : Appelée après &#x60;rechercher-structures&#x60; pour savoir quels champs sont obligatoires avant de soumettre une facture.
  # @param consulter_structure_request 
  # @param [Hash] opts the optional parameters
  # @return [ConsulterStructureResponse]
  describe 'consulter_structure_api_v1_chorus_pro_structures_consulter_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get
  # Lister les services d&#39;une structure
  # Récupère la liste des services actifs d&#39;une structure publique.      **Cas d&#39;usage** :     - Lister les services disponibles pour une administration     - Vérifier qu&#39;un code service existe avant de soumettre une facture      **Retour** :     - Liste des services avec leur code, libellé et statut (actif/inactif)
  # @param id_structure_cpp 
  # @param body_lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get 
  # @param [Hash] opts the optional parameters
  # @return [RechercherServicesResponse]
  describe 'lister_services_structure_api_v1_chorus_pro_structures_id_structure_cpp_services_get test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post
  # Utilitaire : Obtenir l&#39;ID Chorus Pro depuis un SIRET
  # **Utilitaire pratique** pour obtenir l&#39;ID Chorus Pro d&#39;une structure à partir de son SIRET.       Cette fonction wrapper combine :     1. Recherche de la structure par SIRET     2. Extraction de l&#39;&#x60;id_structure_cpp&#x60; si une seule structure est trouvée      **Retour** :     - &#x60;id_structure_cpp&#x60; : ID Chorus Pro (0 si non trouvé ou si plusieurs résultats)     - &#x60;designation_structure&#x60; : Nom de la structure (si trouvée)     - &#x60;message&#x60; : Message explicatif      **Cas d&#39;usage** :     - Raccourci pour obtenir directement l&#39;ID Chorus Pro avant de soumettre une facture     - Alternative simplifiée à &#x60;rechercher-structures&#x60; + extraction manuelle de l&#39;ID      **Note** : Si plusieurs structures correspondent au SIRET (rare), retourne 0 et un message d&#39;erreur.
  # @param obtenir_id_chorus_pro_request 
  # @param [Hash] opts the optional parameters
  # @return [ObtenirIdChorusProResponse]
  describe 'obtenir_id_chorus_pro_depuis_siret_api_v1_chorus_pro_structures_obtenir_id_depuis_siret_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post
  # Rechercher factures reçues (Destinataire)
  # Recherche les factures reçues par le destinataire connecté.      **Filtres** :     - Téléchargée / non téléchargée     - Dates de réception     - Statut (MISE_A_DISPOSITION, SUSPENDUE, etc.)     - Fournisseur      **Indicateur utile** : &#x60;factureTelechargeeParDestinataire&#x60; permet de savoir si la facture a déjà été téléchargée.
  # @param body_rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'rechercher_factures_destinataire_api_v1_chorus_pro_factures_rechercher_destinataire_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post
  # Rechercher factures émises (Fournisseur)
  # Recherche les factures émises par le fournisseur connecté.      **Filtres disponibles** :     - Numéro de facture     - Dates (début/fin)     - Statut     - Structure destinataire     - Montant      **Cas d&#39;usage** :     - Suivi des factures émises     - Vérification des statuts     - Export pour comptabilité
  # @param body_rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'rechercher_factures_fournisseur_api_v1_chorus_pro_factures_rechercher_fournisseur_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for rechercher_structures_api_v1_chorus_pro_structures_rechercher_post
  # Rechercher des structures Chorus Pro
  # Recherche des structures (entreprises, administrations) enregistrées sur Chorus Pro.      **Cas d&#39;usage** :     - Trouver l&#39;ID Chorus Pro d&#39;une structure à partir de son SIRET     - Vérifier si une structure est enregistrée sur Chorus Pro     - Lister les structures correspondant à des critères      **Filtres disponibles** :     - Identifiant (SIRET, SIREN, etc.)     - Raison sociale     - Type d&#39;identifiant     - Structures privées uniquement      **Étape typique** : Appelée avant &#x60;soumettre-facture&#x60; pour obtenir l&#39;&#x60;id_structure_cpp&#x60; du destinataire.
  # @param rechercher_structure_request 
  # @param [Hash] opts the optional parameters
  # @return [RechercherStructureResponse]
  describe 'rechercher_structures_api_v1_chorus_pro_structures_rechercher_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for recycler_facture_api_v1_chorus_pro_factures_recycler_post
  # Recycler une facture (Fournisseur)
  # Recycle une facture au statut A_RECYCLER en modifiant les données d&#39;acheminement.      **Statut requis** : A_RECYCLER      **Champs modifiables** :     - Destinataire (&#x60;idStructureCPP&#x60;)     - Code service     - Numéro d&#39;engagement      **Cas d&#39;usage** :     - Erreur de destinataire     - Changement de service facturation     - Mise à jour du numéro d&#39;engagement      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;identifiantFactureCPP\&quot;: 12345,       \&quot;idStructureCPP\&quot;: 67890,       \&quot;codeService\&quot;: \&quot;SERVICE_01\&quot;,       \&quot;numeroEngagement\&quot;: \&quot;ENG2024001\&quot;     }     &#x60;&#x60;&#x60;      **Note** : La facture conserve son numéro et ses montants, seuls les champs d&#39;acheminement changent.
  # @param body_recycler_facture_api_v1_chorus_pro_factures_recycler_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'recycler_facture_api_v1_chorus_pro_factures_recycler_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for soumettre_facture_api_v1_chorus_pro_factures_soumettre_post
  # Soumettre une facture à Chorus Pro
  # Soumet une facture électronique à une structure publique via Chorus Pro.       **📋 Workflow complet** :     1. **Uploader le PDF Factur-X** via &#x60;/transverses/ajouter-fichier&#x60; → récupérer &#x60;pieceJointeId&#x60;     2. **Obtenir l&#39;ID structure** via &#x60;/structures/rechercher&#x60; ou &#x60;/structures/obtenir-id-depuis-siret&#x60;     3. **Vérifier les paramètres obligatoires** via &#x60;/structures/consulter&#x60;     4. **Soumettre la facture** avec le &#x60;piece_jointe_principale_id&#x60; obtenu à l&#39;étape 1      **Pré-requis** :     1. Avoir l&#39;&#x60;id_structure_cpp&#x60; du destinataire (via &#x60;/structures/rechercher&#x60;)     2. Connaître les paramètres obligatoires (via &#x60;/structures/consulter&#x60;) :        - Code service si &#x60;code_service_doit_etre_renseigne&#x3D;true&#x60;        - Numéro d&#39;engagement si &#x60;numero_ej_doit_etre_renseigne&#x3D;true&#x60;     3. Avoir uploadé le PDF Factur-X (via &#x60;/transverses/ajouter-fichier&#x60;)      **Format attendu** :     - &#x60;piece_jointe_principale_id&#x60; : ID retourné par &#x60;/transverses/ajouter-fichier&#x60;     - Montants : Chaînes de caractères avec 2 décimales (ex: \&quot;1250.50\&quot;)     - Dates : Format ISO 8601 (YYYY-MM-DD)      **Retour** :     - &#x60;identifiant_facture_cpp&#x60; : ID Chorus Pro de la facture créée     - &#x60;numero_flux_depot&#x60; : Numéro de suivi du dépôt      **Statuts possibles après soumission** :     - SOUMISE : En attente de validation     - VALIDEE : Validée par le destinataire     - REJETEE : Rejetée (erreur de données ou refus métier)     - SUSPENDUE : En attente d&#39;informations complémentaires      **Note** : Utilisez &#x60;/factures/consulter&#x60; pour suivre l&#39;évolution du statut.
  # @param soumettre_facture_request 
  # @param [Hash] opts the optional parameters
  # @return [SoumettreFactureResponse]
  describe 'soumettre_facture_api_v1_chorus_pro_factures_soumettre_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post
  # Télécharger un groupe de factures
  # Télécharge une ou plusieurs factures (max 10 recommandé) avec leurs pièces jointes.      **Formats disponibles** :     - PDF : Fichier PDF uniquement     - XML : Fichier XML uniquement     - ZIP : Archive contenant PDF + XML + pièces jointes      **Taille maximale** : 120 Mo par téléchargement      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;listeIdentifiantsFactureCPP\&quot;: [12345, 12346],       \&quot;inclurePiecesJointes\&quot;: true,       \&quot;formatFichier\&quot;: \&quot;ZIP\&quot;     }     &#x60;&#x60;&#x60;      **Retour** : Le fichier est encodé en base64 dans le champ &#x60;fichierBase64&#x60;.      **Note** : Le flag &#x60;factureTelechargeeParDestinataire&#x60; est mis à jour automatiquement.
  # @param body_telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'telecharger_groupe_factures_api_v1_chorus_pro_factures_telecharger_groupe_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post
  # Traiter une facture reçue (Destinataire)
  # Change le statut d&#39;une facture reçue.      **Statuts possibles** :     - MISE_A_DISPOSITION : Facture acceptée     - SUSPENDUE : En attente d&#39;informations complémentaires (motif obligatoire)     - REJETEE : Facture refusée (motif obligatoire)     - MANDATEE : Facture mandatée     - MISE_EN_PAIEMENT : Facture en cours de paiement     - COMPTABILISEE : Facture comptabilisée     - MISE_A_DISPOSITION_COMPTABLE : Mise à disposition comptable     - A_RECYCLER : À recycler     - COMPLETEE : Complétée     - SERVICE-FAIT : Service fait     - PRISE_EN_COMPTE_DESTINATAIRE : Prise en compte     - TRANSMISE_MOA : Transmise à la MOA      **Payload exemple** :     &#x60;&#x60;&#x60;json     {       \&quot;identifiantFactureCPP\&quot;: 12345,       \&quot;nouveauStatut\&quot;: \&quot;REJETEE\&quot;,       \&quot;motifRejet\&quot;: \&quot;Facture en double\&quot;,       \&quot;commentaire\&quot;: \&quot;Facture déjà reçue sous la référence ABC123\&quot;     }     &#x60;&#x60;&#x60;      **Règles** :     - Un motif est **obligatoire** pour SUSPENDUE et REJETEE     - Seuls certains statuts sont autorisés selon le statut actuel de la facture
  # @param body_traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'traiter_facture_recue_api_v1_chorus_pro_factures_traiter_facture_recue_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post
  # Consulter une facture (Valideur)
  # Consulte facture (valideur).
  # @param body_valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'valideur_consulter_facture_api_v1_chorus_pro_factures_valideur_consulter_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post
  # Rechercher factures à valider (Valideur)
  # Recherche les factures en attente de validation par le valideur connecté.      **Rôle** : Valideur dans le circuit de validation interne.      **Filtres** : Dates, structure, service, etc.
  # @param body_valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'valideur_rechercher_factures_api_v1_chorus_pro_factures_valideur_rechercher_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

  # unit tests for valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post
  # Valider ou refuser une facture (Valideur)
  # Valide ou refuse une facture en attente de validation.      **Actions** :     - Valider : La facture passe au statut suivant du circuit     - Refuser : La facture est rejetée (motif obligatoire)
  # @param body_valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post 
  # @param [Hash] opts the optional parameters
  # @return [Object]
  describe 'valideur_traiter_facture_api_v1_chorus_pro_factures_valideur_traiter_post test' do
    it 'should work' do
      # assertion here. ref: https://rspec.info/features/3-12/rspec-expectations/built-in-matchers/
    end
  end

end
