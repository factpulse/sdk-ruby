=begin
#API REST FactPulse

# API REST pour la facturation électronique en France : Factur-X, AFNOR PDP/PA, signatures électroniques.  ## 🎯 Fonctionnalités principales  ### 📄 Génération de factures Factur-X - **Formats** : XML seul ou PDF/A-3 avec XML embarqué - **Profils** : MINIMUM, BASIC, EN16931, EXTENDED - **Normes** : EN 16931 (directive UE 2014/55), ISO 19005-3 (PDF/A-3), CII (UN/CEFACT) - **🆕 Format simplifié** : Génération à partir de SIRET + auto-enrichissement (API Chorus Pro + Recherche Entreprises)  ### ✅ Validation et conformité - **Validation XML** : Schematron (45 à 210+ règles selon profil) - **Validation PDF** : PDF/A-3, métadonnées XMP Factur-X, signatures électroniques - **VeraPDF** : Validation stricte PDF/A (146+ règles ISO 19005-3) - **Traitement asynchrone** : Support Celery pour validations lourdes (VeraPDF)  ### 📡 Intégration AFNOR PDP/PA (XP Z12-013) - **Soumission de flux** : Envoi de factures vers Plateformes de Dématérialisation Partenaires - **Recherche de flux** : Consultation des factures soumises - **Téléchargement** : Récupération des PDF/A-3 avec XML - **Directory Service** : Recherche d'entreprises (SIREN/SIRET) - **Multi-client** : Support de plusieurs configs PDP par utilisateur (stored credentials ou zero-storage)  ### ✍️ Signature électronique PDF - **Standards** : PAdES-B-B, PAdES-B-T (horodatage RFC 3161), PAdES-B-LT (archivage long terme) - **Niveaux eIDAS** : SES (auto-signé), AdES (CA commerciale), QES (PSCO) - **Validation** : Vérification intégrité cryptographique et certificats - **Génération de certificats** : Certificats X.509 auto-signés pour tests  ### 🔄 Traitement asynchrone - **Celery** : Génération, validation et signature asynchrones - **Polling** : Suivi d'état via `/taches/{id_tache}/statut` - **Pas de timeout** : Idéal pour gros fichiers ou validations lourdes  ## 🔒 Authentification  Toutes les requêtes nécessitent un **token JWT** dans le header Authorization : ``` Authorization: Bearer YOUR_JWT_TOKEN ```  ### Comment obtenir un token JWT ?  #### 🔑 Méthode 1 : API `/api/token/` (Recommandée)  **URL :** `https://www.factpulse.fr/api/token/`  Cette méthode est **recommandée** pour l'intégration dans vos applications et workflows CI/CD.  **Prérequis :** Avoir défini un mot de passe sur votre compte  **Pour les utilisateurs inscrits via email/password :** - Vous avez déjà un mot de passe, utilisez-le directement  **Pour les utilisateurs inscrits via OAuth (Google/GitHub) :** - Vous devez d'abord définir un mot de passe sur : https://www.factpulse.fr/accounts/password/set/ - Une fois le mot de passe créé, vous pourrez utiliser l'API  **Exemple de requête :** ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\"   }' ```  **Paramètre optionnel `client_uid` :**  Pour sélectionner les credentials d'un client spécifique (PA/PDP, Chorus Pro, certificats de signature), ajoutez `client_uid` :  ```bash curl -X POST https://www.factpulse.fr/api/token/ \\   -H \"Content-Type: application/json\" \\   -d '{     \"username\": \"votre_email@example.com\",     \"password\": \"votre_mot_de_passe\",     \"client_uid\": \"550e8400-e29b-41d4-a716-446655440000\"   }' ```  Le `client_uid` sera inclus dans le JWT et permettra à l'API d'utiliser automatiquement : - Les credentials AFNOR/PDP configurés pour ce client - Les credentials Chorus Pro configurés pour ce client - Les certificats de signature électronique configurés pour ce client  **Réponse :** ```json {   \"access\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\",  // Token d'accès (validité: 30 min)   \"refresh\": \"eyJ0eXAiOiJKV1QiLCJhbGc...\"  // Token de rafraîchissement (validité: 7 jours) } ```  **Avantages :** - ✅ Automatisation complète (CI/CD, scripts) - ✅ Gestion programmatique des tokens - ✅ Support du refresh token pour renouveler automatiquement l'accès - ✅ Intégration facile dans n'importe quel langage/outil  #### 🖥️ Méthode 2 : Génération via Dashboard (Alternative)  **URL :** https://www.factpulse.fr/dashboard/  Cette méthode convient pour des tests rapides ou une utilisation occasionnelle via l'interface graphique.  **Fonctionnement :** - Connectez-vous au dashboard - Utilisez les boutons \"Generate Test Token\" ou \"Generate Production Token\" - Fonctionne pour **tous** les utilisateurs (OAuth et email/password), sans nécessiter de mot de passe  **Types de tokens :** - **Token Test** : Validité 24h, quota 1000 appels/jour (gratuit) - **Token Production** : Validité 7 jours, quota selon votre forfait  **Avantages :** - ✅ Rapide pour tester l'API - ✅ Aucun mot de passe requis - ✅ Interface visuelle simple  **Inconvénients :** - ❌ Nécessite une action manuelle - ❌ Pas de refresh token - ❌ Moins adapté pour l'automatisation  ### 📚 Documentation complète  Pour plus d'informations sur l'authentification et l'utilisation de l'API : https://www.factpulse.fr/documentation-api/     

The version of the OpenAPI document: 1.0.0

Generated by: https://openapi-generator.tech
Generator version: 7.18.0-SNAPSHOT

=end

require 'date'
require 'time'

module FactPulse
  # Requête pour générer un certificat X.509 auto-signé de test.  ⚠️ ATTENTION : Ce certificat est destiné uniquement aux TESTS. NE PAS utiliser en production ! Niveau eIDAS : SES (Simple Electronic Signature)
  class GenerateCertificateRequest < ApiModelBase
    # Common Name (CN) - Nom du certificat
    attr_accessor :cn

    # Organisation (O)
    attr_accessor :organisation

    # Code pays ISO 2 lettres (C)
    attr_accessor :pays

    # Ville (L)
    attr_accessor :ville

    # Province/État (ST)
    attr_accessor :province

    attr_accessor :email

    # Durée de validité en jours
    attr_accessor :duree_jours

    # Taille de la clé RSA en bits
    attr_accessor :taille_cle

    attr_accessor :passphrase_cle

    # Générer aussi un fichier PKCS#12 (.p12)
    attr_accessor :generer_p12

    # Passphrase pour le fichier PKCS#12
    attr_accessor :passphrase_p12

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'cn' => :'cn',
        :'organisation' => :'organisation',
        :'pays' => :'pays',
        :'ville' => :'ville',
        :'province' => :'province',
        :'email' => :'email',
        :'duree_jours' => :'duree_jours',
        :'taille_cle' => :'taille_cle',
        :'passphrase_cle' => :'passphrase_cle',
        :'generer_p12' => :'generer_p12',
        :'passphrase_p12' => :'passphrase_p12'
      }
    end

    # Returns attribute mapping this model knows about
    def self.acceptable_attribute_map
      attribute_map
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      acceptable_attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'cn' => :'String',
        :'organisation' => :'String',
        :'pays' => :'String',
        :'ville' => :'String',
        :'province' => :'String',
        :'email' => :'String',
        :'duree_jours' => :'Integer',
        :'taille_cle' => :'Integer',
        :'passphrase_cle' => :'String',
        :'generer_p12' => :'Boolean',
        :'passphrase_p12' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'email',
        :'passphrase_cle',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `FactPulse::GenerateCertificateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `FactPulse::GenerateCertificateRequest`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'cn')
        self.cn = attributes[:'cn']
      else
        self.cn = 'Test Signature FactPulse'
      end

      if attributes.key?(:'organisation')
        self.organisation = attributes[:'organisation']
      else
        self.organisation = 'FactPulse Test'
      end

      if attributes.key?(:'pays')
        self.pays = attributes[:'pays']
      else
        self.pays = 'FR'
      end

      if attributes.key?(:'ville')
        self.ville = attributes[:'ville']
      else
        self.ville = 'Paris'
      end

      if attributes.key?(:'province')
        self.province = attributes[:'province']
      else
        self.province = 'Ile-de-France'
      end

      if attributes.key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.key?(:'duree_jours')
        self.duree_jours = attributes[:'duree_jours']
      else
        self.duree_jours = 365
      end

      if attributes.key?(:'taille_cle')
        self.taille_cle = attributes[:'taille_cle']
      else
        self.taille_cle = 2048
      end

      if attributes.key?(:'passphrase_cle')
        self.passphrase_cle = attributes[:'passphrase_cle']
      end

      if attributes.key?(:'generer_p12')
        self.generer_p12 = attributes[:'generer_p12']
      else
        self.generer_p12 = false
      end

      if attributes.key?(:'passphrase_p12')
        self.passphrase_p12 = attributes[:'passphrase_p12']
      else
        self.passphrase_p12 = 'changeme'
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if !@pays.nil? && @pays.to_s.length > 2
        invalid_properties.push('invalid value for "pays", the character length must be smaller than or equal to 2.')
      end

      if !@pays.nil? && @pays.to_s.length < 2
        invalid_properties.push('invalid value for "pays", the character length must be greater than or equal to 2.')
      end

      if !@duree_jours.nil? && @duree_jours > 3650
        invalid_properties.push('invalid value for "duree_jours", must be smaller than or equal to 3650.')
      end

      if !@duree_jours.nil? && @duree_jours < 1
        invalid_properties.push('invalid value for "duree_jours", must be greater than or equal to 1.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if !@pays.nil? && @pays.to_s.length > 2
      return false if !@pays.nil? && @pays.to_s.length < 2
      return false if !@duree_jours.nil? && @duree_jours > 3650
      return false if !@duree_jours.nil? && @duree_jours < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] pays Value to be assigned
    def pays=(pays)
      if pays.nil?
        fail ArgumentError, 'pays cannot be nil'
      end

      if pays.to_s.length > 2
        fail ArgumentError, 'invalid value for "pays", the character length must be smaller than or equal to 2.'
      end

      if pays.to_s.length < 2
        fail ArgumentError, 'invalid value for "pays", the character length must be greater than or equal to 2.'
      end

      @pays = pays
    end

    # Custom attribute writer method with validation
    # @param [Object] duree_jours Value to be assigned
    def duree_jours=(duree_jours)
      if duree_jours.nil?
        fail ArgumentError, 'duree_jours cannot be nil'
      end

      if duree_jours > 3650
        fail ArgumentError, 'invalid value for "duree_jours", must be smaller than or equal to 3650.'
      end

      if duree_jours < 1
        fail ArgumentError, 'invalid value for "duree_jours", must be greater than or equal to 1.'
      end

      @duree_jours = duree_jours
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          cn == o.cn &&
          organisation == o.organisation &&
          pays == o.pays &&
          ville == o.ville &&
          province == o.province &&
          email == o.email &&
          duree_jours == o.duree_jours &&
          taille_cle == o.taille_cle &&
          passphrase_cle == o.passphrase_cle &&
          generer_p12 == o.generer_p12 &&
          passphrase_p12 == o.passphrase_p12
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [cn, organisation, pays, ville, province, email, duree_jours, taille_cle, passphrase_cle, generer_p12, passphrase_p12].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      transformed_hash = {}
      openapi_types.each_pair do |key, type|
        if attributes.key?(attribute_map[key]) && attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = nil
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[attribute_map[key]].is_a?(Array)
            transformed_hash["#{key}"] = attributes[attribute_map[key]].map { |v| _deserialize($1, v) }
          end
        elsif !attributes[attribute_map[key]].nil?
          transformed_hash["#{key}"] = _deserialize(type, attributes[attribute_map[key]])
        end
      end
      new(transformed_hash)
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

  end

end
