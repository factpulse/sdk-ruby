=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

# Common files
require 'factpulse/api_client'
require 'factpulse/api_error'
require 'factpulse/api_model_base'
require 'factpulse/version'
require 'factpulse/configuration'

# Models
require 'factpulse/models/api_error'
require 'factpulse/models/adresse_electronique'
require 'factpulse/models/adresse_postale'
require 'factpulse/models/beneficiaire'
require 'factpulse/models/bounding_box_schema'
require 'factpulse/models/cadre_de_facturation'
require 'factpulse/models/categorie_tva'
require 'factpulse/models/certificate_info_response'
require 'factpulse/models/champ_verifie_schema'
require 'factpulse/models/chorus_pro_credentials'
require 'factpulse/models/code_cadre_facturation'
require 'factpulse/models/code_raison_reduction'
require 'factpulse/models/consulter_facture_request'
require 'factpulse/models/consulter_facture_response'
require 'factpulse/models/consulter_structure_request'
require 'factpulse/models/consulter_structure_response'
require 'factpulse/models/credentials_afnor'
require 'factpulse/models/credentials_chorus_pro'
require 'factpulse/models/destinataire'
require 'factpulse/models/destination'
require 'factpulse/models/destination_afnor'
require 'factpulse/models/destination_chorus_pro'
require 'factpulse/models/dimension_page_schema'
require 'factpulse/models/direction_flux'
require 'factpulse/models/donnees_facture_simplifiees'
require 'factpulse/models/error_level'
require 'factpulse/models/error_source'
require 'factpulse/models/facture_enrichie_info'
require 'factpulse/models/facture_entrante'
require 'factpulse/models/facture_factur_x'
require 'factpulse/models/flux_resume'
require 'factpulse/models/format_facture'
require 'factpulse/models/format_sortie'
require 'factpulse/models/fournisseur'
require 'factpulse/models/fournisseur_entrant'
require 'factpulse/models/generate_certificate_request'
require 'factpulse/models/generate_certificate_response'
require 'factpulse/models/http_validation_error'
require 'factpulse/models/information_signature_api'
require 'factpulse/models/ligne_de_poste'
require 'factpulse/models/ligne_de_poste_montant_remise_ht'
require 'factpulse/models/ligne_de_poste_taux_tva_manuel'
require 'factpulse/models/ligne_de_tva'
require 'factpulse/models/mode_depot'
require 'factpulse/models/mode_paiement'
require 'factpulse/models/montant_a_payer'
require 'factpulse/models/montant_base_ht'
require 'factpulse/models/montant_ht_total'
require 'factpulse/models/montant_remise_globale_ttc'
require 'factpulse/models/montant_total'
require 'factpulse/models/montant_total_acompte'
require 'factpulse/models/montant_total_ligne_ht'
require 'factpulse/models/montant_ttc_total'
require 'factpulse/models/montant_tva'
require 'factpulse/models/montant_tva_ligne'
require 'factpulse/models/montant_tva_total'
require 'factpulse/models/montant_unitaire_ht'
require 'factpulse/models/nature_operation'
require 'factpulse/models/note'
require 'factpulse/models/note_obligatoire_schema'
require 'factpulse/models/obtenir_id_chorus_pro_request'
require 'factpulse/models/obtenir_id_chorus_pro_response'
require 'factpulse/models/options_processing'
require 'factpulse/models/pdf_factur_x_info'
require 'factpulse/models/pdp_credentials'
require 'factpulse/models/parametres_signature'
require 'factpulse/models/parametres_structure'
require 'factpulse/models/piece_jointe_complementaire'
require 'factpulse/models/profil_api'
require 'factpulse/models/profil_flux'
require 'factpulse/models/quantite'
require 'factpulse/models/rechercher_services_response'
require 'factpulse/models/rechercher_structure_request'
require 'factpulse/models/rechercher_structure_response'
require 'factpulse/models/references'
require 'factpulse/models/reponse_healthcheck_afnor'
require 'factpulse/models/reponse_recherche_flux'
require 'factpulse/models/reponse_soumission_flux'
require 'factpulse/models/reponse_tache'
require 'factpulse/models/reponse_validation_erreur'
require 'factpulse/models/reponse_validation_succes'
require 'factpulse/models/reponse_verification_succes'
require 'factpulse/models/requete_recherche_flux'
require 'factpulse/models/requete_soumission_flux'
require 'factpulse/models/resultat_afnor'
require 'factpulse/models/resultat_chorus_pro'
require 'factpulse/models/resultat_validation_pdfapi'
require 'factpulse/models/scheme_id'
require 'factpulse/models/service_structure'
require 'factpulse/models/signature_info'
require 'factpulse/models/soumettre_facture_complete_request'
require 'factpulse/models/soumettre_facture_complete_response'
require 'factpulse/models/soumettre_facture_request'
require 'factpulse/models/soumettre_facture_response'
require 'factpulse/models/statut_acquittement'
require 'factpulse/models/statut_celery'
require 'factpulse/models/statut_champ_api'
require 'factpulse/models/statut_facture'
require 'factpulse/models/statut_tache'
require 'factpulse/models/structure_info'
require 'factpulse/models/syntaxe_flux'
require 'factpulse/models/tauxmanuel'
require 'factpulse/models/type_document'
require 'factpulse/models/type_facture'
require 'factpulse/models/type_flux'
require 'factpulse/models/type_tva'
require 'factpulse/models/unite'
require 'factpulse/models/validation_error'
require 'factpulse/models/validation_error_detail'
require 'factpulse/models/validation_error_loc_inner'

# APIs
require 'factpulse/api/afnorpdppa_api'
require 'factpulse/api/afnorpdppa_directory_service_api'
require 'factpulse/api/afnorpdppa_flow_service_api'
require 'factpulse/api/chorus_pro_api'
require 'factpulse/api/sant_api'
require 'factpulse/api/traitement_facture_api'
require 'factpulse/api/utilisateur_api'
require 'factpulse/api/vrification_pdfxml_api'

module FactPulse
  class << self
    # Customize default settings for the SDK using block.
    #   FactPulse.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
