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
  # Réponse de vérification réussie avec données unifiées.
  class ReponseVerificationSucces < ApiModelBase
    # True si aucun écart critique
    attr_accessor :est_conforme

    # Score de conformité (0-100%)
    attr_accessor :score_conformite

    # Nombre de champs vérifiés
    attr_accessor :champs_verifies

    # Nombre de champs conformes
    attr_accessor :champs_conformes

    # True si le PDF contient du XML Factur-X
    attr_accessor :est_facturx

    attr_accessor :profil_facturx

    # Liste des champs vérifiés avec valeurs, statuts et coordonnées PDF
    attr_accessor :champs

    # Notes obligatoires (PMT, PMD, AAB) avec localisation PDF
    attr_accessor :notes_obligatoires

    # Dimensions de chaque page du PDF (largeur, hauteur)
    attr_accessor :dimensions_pages

    # Avertissements non bloquants
    attr_accessor :avertissements

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'est_conforme' => :'est_conforme',
        :'score_conformite' => :'score_conformite',
        :'champs_verifies' => :'champs_verifies',
        :'champs_conformes' => :'champs_conformes',
        :'est_facturx' => :'est_facturx',
        :'profil_facturx' => :'profil_facturx',
        :'champs' => :'champs',
        :'notes_obligatoires' => :'notes_obligatoires',
        :'dimensions_pages' => :'dimensions_pages',
        :'avertissements' => :'avertissements'
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
        :'est_conforme' => :'Boolean',
        :'score_conformite' => :'Float',
        :'champs_verifies' => :'Integer',
        :'champs_conformes' => :'Integer',
        :'est_facturx' => :'Boolean',
        :'profil_facturx' => :'String',
        :'champs' => :'Array<ChampVerifieSchema>',
        :'notes_obligatoires' => :'Array<NoteObligatoireSchema>',
        :'dimensions_pages' => :'Array<DimensionPageSchema>',
        :'avertissements' => :'Array<String>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'profil_facturx',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `FactPulse::ReponseVerificationSucces` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `FactPulse::ReponseVerificationSucces`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'est_conforme')
        self.est_conforme = attributes[:'est_conforme']
      else
        self.est_conforme = nil
      end

      if attributes.key?(:'score_conformite')
        self.score_conformite = attributes[:'score_conformite']
      else
        self.score_conformite = nil
      end

      if attributes.key?(:'champs_verifies')
        self.champs_verifies = attributes[:'champs_verifies']
      else
        self.champs_verifies = 0
      end

      if attributes.key?(:'champs_conformes')
        self.champs_conformes = attributes[:'champs_conformes']
      else
        self.champs_conformes = 0
      end

      if attributes.key?(:'est_facturx')
        self.est_facturx = attributes[:'est_facturx']
      else
        self.est_facturx = false
      end

      if attributes.key?(:'profil_facturx')
        self.profil_facturx = attributes[:'profil_facturx']
      end

      if attributes.key?(:'champs')
        if (value = attributes[:'champs']).is_a?(Array)
          self.champs = value
        end
      end

      if attributes.key?(:'notes_obligatoires')
        if (value = attributes[:'notes_obligatoires']).is_a?(Array)
          self.notes_obligatoires = value
        end
      end

      if attributes.key?(:'dimensions_pages')
        if (value = attributes[:'dimensions_pages']).is_a?(Array)
          self.dimensions_pages = value
        end
      end

      if attributes.key?(:'avertissements')
        if (value = attributes[:'avertissements']).is_a?(Array)
          self.avertissements = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @est_conforme.nil?
        invalid_properties.push('invalid value for "est_conforme", est_conforme cannot be nil.')
      end

      if @score_conformite.nil?
        invalid_properties.push('invalid value for "score_conformite", score_conformite cannot be nil.')
      end

      if @score_conformite > 100.0
        invalid_properties.push('invalid value for "score_conformite", must be smaller than or equal to 100.0.')
      end

      if @score_conformite < 0.0
        invalid_properties.push('invalid value for "score_conformite", must be greater than or equal to 0.0.')
      end

      if !@champs_verifies.nil? && @champs_verifies < 0
        invalid_properties.push('invalid value for "champs_verifies", must be greater than or equal to 0.')
      end

      if !@champs_conformes.nil? && @champs_conformes < 0
        invalid_properties.push('invalid value for "champs_conformes", must be greater than or equal to 0.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @est_conforme.nil?
      return false if @score_conformite.nil?
      return false if @score_conformite > 100.0
      return false if @score_conformite < 0.0
      return false if !@champs_verifies.nil? && @champs_verifies < 0
      return false if !@champs_conformes.nil? && @champs_conformes < 0
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] est_conforme Value to be assigned
    def est_conforme=(est_conforme)
      if est_conforme.nil?
        fail ArgumentError, 'est_conforme cannot be nil'
      end

      @est_conforme = est_conforme
    end

    # Custom attribute writer method with validation
    # @param [Object] score_conformite Value to be assigned
    def score_conformite=(score_conformite)
      if score_conformite.nil?
        fail ArgumentError, 'score_conformite cannot be nil'
      end

      if score_conformite > 100.0
        fail ArgumentError, 'invalid value for "score_conformite", must be smaller than or equal to 100.0.'
      end

      if score_conformite < 0.0
        fail ArgumentError, 'invalid value for "score_conformite", must be greater than or equal to 0.0.'
      end

      @score_conformite = score_conformite
    end

    # Custom attribute writer method with validation
    # @param [Object] champs_verifies Value to be assigned
    def champs_verifies=(champs_verifies)
      if champs_verifies.nil?
        fail ArgumentError, 'champs_verifies cannot be nil'
      end

      if champs_verifies < 0
        fail ArgumentError, 'invalid value for "champs_verifies", must be greater than or equal to 0.'
      end

      @champs_verifies = champs_verifies
    end

    # Custom attribute writer method with validation
    # @param [Object] champs_conformes Value to be assigned
    def champs_conformes=(champs_conformes)
      if champs_conformes.nil?
        fail ArgumentError, 'champs_conformes cannot be nil'
      end

      if champs_conformes < 0
        fail ArgumentError, 'invalid value for "champs_conformes", must be greater than or equal to 0.'
      end

      @champs_conformes = champs_conformes
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          est_conforme == o.est_conforme &&
          score_conformite == o.score_conformite &&
          champs_verifies == o.champs_verifies &&
          champs_conformes == o.champs_conformes &&
          est_facturx == o.est_facturx &&
          profil_facturx == o.profil_facturx &&
          champs == o.champs &&
          notes_obligatoires == o.notes_obligatoires &&
          dimensions_pages == o.dimensions_pages &&
          avertissements == o.avertissements
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [est_conforme, score_conformite, champs_verifies, champs_conformes, est_facturx, profil_facturx, champs, notes_obligatoires, dimensions_pages, avertissements].hash
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
