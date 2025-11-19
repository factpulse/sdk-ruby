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
  # Informations sur le fournisseur qui émet la facture.
  class Fournisseur < ApiModelBase
    attr_accessor :adresse_electronique

    attr_accessor :id_fournisseur

    attr_accessor :code_coordonnees_bancaires_fournisseur

    attr_accessor :id_service_fournisseur

    attr_accessor :nom

    attr_accessor :siren

    attr_accessor :siret

    attr_accessor :numero_tva_intra

    attr_accessor :iban

    attr_accessor :adresse_postale

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'adresse_electronique' => :'adresseElectronique',
        :'id_fournisseur' => :'idFournisseur',
        :'code_coordonnees_bancaires_fournisseur' => :'codeCoordonneesBancairesFournisseur',
        :'id_service_fournisseur' => :'idServiceFournisseur',
        :'nom' => :'nom',
        :'siren' => :'siren',
        :'siret' => :'siret',
        :'numero_tva_intra' => :'numeroTvaIntra',
        :'iban' => :'iban',
        :'adresse_postale' => :'adressePostale'
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
        :'adresse_electronique' => :'AdresseElectronique',
        :'id_fournisseur' => :'Integer',
        :'code_coordonnees_bancaires_fournisseur' => :'Integer',
        :'id_service_fournisseur' => :'Integer',
        :'nom' => :'String',
        :'siren' => :'String',
        :'siret' => :'String',
        :'numero_tva_intra' => :'String',
        :'iban' => :'String',
        :'adresse_postale' => :'AdressePostale'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'code_coordonnees_bancaires_fournisseur',
        :'id_service_fournisseur',
        :'nom',
        :'siren',
        :'siret',
        :'numero_tva_intra',
        :'iban',
        :'adresse_postale'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `FactPulse::Fournisseur` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `FactPulse::Fournisseur`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'adresse_electronique')
        self.adresse_electronique = attributes[:'adresse_electronique']
      else
        self.adresse_electronique = nil
      end

      if attributes.key?(:'id_fournisseur')
        self.id_fournisseur = attributes[:'id_fournisseur']
      else
        self.id_fournisseur = nil
      end

      if attributes.key?(:'code_coordonnees_bancaires_fournisseur')
        self.code_coordonnees_bancaires_fournisseur = attributes[:'code_coordonnees_bancaires_fournisseur']
      end

      if attributes.key?(:'id_service_fournisseur')
        self.id_service_fournisseur = attributes[:'id_service_fournisseur']
      end

      if attributes.key?(:'nom')
        self.nom = attributes[:'nom']
      end

      if attributes.key?(:'siren')
        self.siren = attributes[:'siren']
      end

      if attributes.key?(:'siret')
        self.siret = attributes[:'siret']
      end

      if attributes.key?(:'numero_tva_intra')
        self.numero_tva_intra = attributes[:'numero_tva_intra']
      end

      if attributes.key?(:'iban')
        self.iban = attributes[:'iban']
      end

      if attributes.key?(:'adresse_postale')
        self.adresse_postale = attributes[:'adresse_postale']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      warn '[DEPRECATED] the `list_invalid_properties` method is obsolete'
      invalid_properties = Array.new
      if @adresse_electronique.nil?
        invalid_properties.push('invalid value for "adresse_electronique", adresse_electronique cannot be nil.')
      end

      if @id_fournisseur.nil?
        invalid_properties.push('invalid value for "id_fournisseur", id_fournisseur cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @adresse_electronique.nil?
      return false if @id_fournisseur.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] adresse_electronique Value to be assigned
    def adresse_electronique=(adresse_electronique)
      if adresse_electronique.nil?
        fail ArgumentError, 'adresse_electronique cannot be nil'
      end

      @adresse_electronique = adresse_electronique
    end

    # Custom attribute writer method with validation
    # @param [Object] id_fournisseur Value to be assigned
    def id_fournisseur=(id_fournisseur)
      if id_fournisseur.nil?
        fail ArgumentError, 'id_fournisseur cannot be nil'
      end

      @id_fournisseur = id_fournisseur
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          adresse_electronique == o.adresse_electronique &&
          id_fournisseur == o.id_fournisseur &&
          code_coordonnees_bancaires_fournisseur == o.code_coordonnees_bancaires_fournisseur &&
          id_service_fournisseur == o.id_service_fournisseur &&
          nom == o.nom &&
          siren == o.siren &&
          siret == o.siret &&
          numero_tva_intra == o.numero_tva_intra &&
          iban == o.iban &&
          adresse_postale == o.adresse_postale
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [adresse_electronique, id_fournisseur, code_coordonnees_bancaires_fournisseur, id_service_fournisseur, nom, siren, siret, numero_tva_intra, iban, adresse_postale].hash
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
