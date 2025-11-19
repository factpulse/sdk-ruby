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
  # Résultat complet de la validation d'un PDF Factur-X.
  class ResultatValidationPDFAPI < ApiModelBase
    # True si le PDF est conforme à tous les critères (XML, PDF/A, XMP)
    attr_accessor :est_conforme

    # True si un XML Factur-X est embarqué dans le PDF
    attr_accessor :xml_present

    # True si le XML Factur-X est conforme aux règles Schematron
    attr_accessor :xml_conforme

    attr_accessor :profil_detecte

    # Liste des erreurs de validation XML
    attr_accessor :erreurs_xml

    # True si le PDF est conforme PDF/A
    attr_accessor :pdfa_conforme

    attr_accessor :version_pdfa

    # Méthode utilisée pour la validation PDF/A (metadata ou verapdf)
    attr_accessor :methode_validation_pdfa

    attr_accessor :regles_validees

    attr_accessor :regles_echouees

    # Liste des erreurs de conformité PDF/A
    attr_accessor :erreurs_pdfa

    # Liste des avertissements PDF/A
    attr_accessor :avertissements_pdfa

    # True si des métadonnées XMP sont présentes
    attr_accessor :xmp_present

    # True si les métadonnées XMP contiennent des informations Factur-X
    attr_accessor :xmp_conforme_facturx

    attr_accessor :profil_xmp

    attr_accessor :version_xmp

    # Liste des erreurs de métadonnées XMP
    attr_accessor :erreurs_xmp

    # Métadonnées XMP extraites du PDF
    attr_accessor :metadonnees_xmp

    # True si le PDF contient au moins une signature
    attr_accessor :est_signe

    # Nombre de signatures électroniques trouvées
    attr_accessor :nombre_signatures

    # Liste des signatures trouvées avec leurs informations
    attr_accessor :signatures

    # Liste des erreurs lors de l'analyse des signatures
    attr_accessor :erreurs_signatures

    # Message résumant le résultat de la validation
    attr_accessor :message_resume

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'est_conforme' => :'est_conforme',
        :'xml_present' => :'xml_present',
        :'xml_conforme' => :'xml_conforme',
        :'profil_detecte' => :'profil_detecte',
        :'erreurs_xml' => :'erreurs_xml',
        :'pdfa_conforme' => :'pdfa_conforme',
        :'version_pdfa' => :'version_pdfa',
        :'methode_validation_pdfa' => :'methode_validation_pdfa',
        :'regles_validees' => :'regles_validees',
        :'regles_echouees' => :'regles_echouees',
        :'erreurs_pdfa' => :'erreurs_pdfa',
        :'avertissements_pdfa' => :'avertissements_pdfa',
        :'xmp_present' => :'xmp_present',
        :'xmp_conforme_facturx' => :'xmp_conforme_facturx',
        :'profil_xmp' => :'profil_xmp',
        :'version_xmp' => :'version_xmp',
        :'erreurs_xmp' => :'erreurs_xmp',
        :'metadonnees_xmp' => :'metadonnees_xmp',
        :'est_signe' => :'est_signe',
        :'nombre_signatures' => :'nombre_signatures',
        :'signatures' => :'signatures',
        :'erreurs_signatures' => :'erreurs_signatures',
        :'message_resume' => :'message_resume'
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
        :'xml_present' => :'Boolean',
        :'xml_conforme' => :'Boolean',
        :'profil_detecte' => :'String',
        :'erreurs_xml' => :'Array<String>',
        :'pdfa_conforme' => :'Boolean',
        :'version_pdfa' => :'String',
        :'methode_validation_pdfa' => :'String',
        :'regles_validees' => :'Integer',
        :'regles_echouees' => :'Integer',
        :'erreurs_pdfa' => :'Array<String>',
        :'avertissements_pdfa' => :'Array<String>',
        :'xmp_present' => :'Boolean',
        :'xmp_conforme_facturx' => :'Boolean',
        :'profil_xmp' => :'String',
        :'version_xmp' => :'String',
        :'erreurs_xmp' => :'Array<String>',
        :'metadonnees_xmp' => :'Hash<String, Object>',
        :'est_signe' => :'Boolean',
        :'nombre_signatures' => :'Integer',
        :'signatures' => :'Array<InformationSignatureAPI>',
        :'erreurs_signatures' => :'Array<String>',
        :'message_resume' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'profil_detecte',
        :'version_pdfa',
        :'regles_validees',
        :'regles_echouees',
        :'profil_xmp',
        :'version_xmp',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `FactPulse::ResultatValidationPDFAPI` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      acceptable_attribute_map = self.class.acceptable_attribute_map
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!acceptable_attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `FactPulse::ResultatValidationPDFAPI`. Please check the name to make sure it's valid. List of attributes: " + acceptable_attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'est_conforme')
        self.est_conforme = attributes[:'est_conforme']
      else
        self.est_conforme = nil
      end

      if attributes.key?(:'xml_present')
        self.xml_present = attributes[:'xml_present']
      else
        self.xml_present = nil
      end

      if attributes.key?(:'xml_conforme')
        self.xml_conforme = attributes[:'xml_conforme']
      else
        self.xml_conforme = nil
      end

      if attributes.key?(:'profil_detecte')
        self.profil_detecte = attributes[:'profil_detecte']
      end

      if attributes.key?(:'erreurs_xml')
        if (value = attributes[:'erreurs_xml']).is_a?(Array)
          self.erreurs_xml = value
        end
      end

      if attributes.key?(:'pdfa_conforme')
        self.pdfa_conforme = attributes[:'pdfa_conforme']
      else
        self.pdfa_conforme = nil
      end

      if attributes.key?(:'version_pdfa')
        self.version_pdfa = attributes[:'version_pdfa']
      end

      if attributes.key?(:'methode_validation_pdfa')
        self.methode_validation_pdfa = attributes[:'methode_validation_pdfa']
      else
        self.methode_validation_pdfa = 'metadata'
      end

      if attributes.key?(:'regles_validees')
        self.regles_validees = attributes[:'regles_validees']
      end

      if attributes.key?(:'regles_echouees')
        self.regles_echouees = attributes[:'regles_echouees']
      end

      if attributes.key?(:'erreurs_pdfa')
        if (value = attributes[:'erreurs_pdfa']).is_a?(Array)
          self.erreurs_pdfa = value
        end
      end

      if attributes.key?(:'avertissements_pdfa')
        if (value = attributes[:'avertissements_pdfa']).is_a?(Array)
          self.avertissements_pdfa = value
        end
      end

      if attributes.key?(:'xmp_present')
        self.xmp_present = attributes[:'xmp_present']
      else
        self.xmp_present = nil
      end

      if attributes.key?(:'xmp_conforme_facturx')
        self.xmp_conforme_facturx = attributes[:'xmp_conforme_facturx']
      else
        self.xmp_conforme_facturx = nil
      end

      if attributes.key?(:'profil_xmp')
        self.profil_xmp = attributes[:'profil_xmp']
      end

      if attributes.key?(:'version_xmp')
        self.version_xmp = attributes[:'version_xmp']
      end

      if attributes.key?(:'erreurs_xmp')
        if (value = attributes[:'erreurs_xmp']).is_a?(Array)
          self.erreurs_xmp = value
        end
      end

      if attributes.key?(:'metadonnees_xmp')
        if (value = attributes[:'metadonnees_xmp']).is_a?(Hash)
          self.metadonnees_xmp = value
        end
      end

      if attributes.key?(:'est_signe')
        self.est_signe = attributes[:'est_signe']
      else
        self.est_signe = nil
      end

      if attributes.key?(:'nombre_signatures')
        self.nombre_signatures = attributes[:'nombre_signatures']
      else
        self.nombre_signatures = 0
      end

      if attributes.key?(:'signatures')
        if (value = attributes[:'signatures']).is_a?(Array)
          self.signatures = value
        end
      end

      if attributes.key?(:'erreurs_signatures')
        if (value = attributes[:'erreurs_signatures']).is_a?(Array)
          self.erreurs_signatures = value
        end
      end

      if attributes.key?(:'message_resume')
        self.message_resume = attributes[:'message_resume']
      else
        self.message_resume = nil
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

      if @xml_present.nil?
        invalid_properties.push('invalid value for "xml_present", xml_present cannot be nil.')
      end

      if @xml_conforme.nil?
        invalid_properties.push('invalid value for "xml_conforme", xml_conforme cannot be nil.')
      end

      if @pdfa_conforme.nil?
        invalid_properties.push('invalid value for "pdfa_conforme", pdfa_conforme cannot be nil.')
      end

      if @xmp_present.nil?
        invalid_properties.push('invalid value for "xmp_present", xmp_present cannot be nil.')
      end

      if @xmp_conforme_facturx.nil?
        invalid_properties.push('invalid value for "xmp_conforme_facturx", xmp_conforme_facturx cannot be nil.')
      end

      if @est_signe.nil?
        invalid_properties.push('invalid value for "est_signe", est_signe cannot be nil.')
      end

      if @message_resume.nil?
        invalid_properties.push('invalid value for "message_resume", message_resume cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      warn '[DEPRECATED] the `valid?` method is obsolete'
      return false if @est_conforme.nil?
      return false if @xml_present.nil?
      return false if @xml_conforme.nil?
      return false if @pdfa_conforme.nil?
      return false if @xmp_present.nil?
      return false if @xmp_conforme_facturx.nil?
      return false if @est_signe.nil?
      return false if @message_resume.nil?
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
    # @param [Object] xml_present Value to be assigned
    def xml_present=(xml_present)
      if xml_present.nil?
        fail ArgumentError, 'xml_present cannot be nil'
      end

      @xml_present = xml_present
    end

    # Custom attribute writer method with validation
    # @param [Object] xml_conforme Value to be assigned
    def xml_conforme=(xml_conforme)
      if xml_conforme.nil?
        fail ArgumentError, 'xml_conforme cannot be nil'
      end

      @xml_conforme = xml_conforme
    end

    # Custom attribute writer method with validation
    # @param [Object] pdfa_conforme Value to be assigned
    def pdfa_conforme=(pdfa_conforme)
      if pdfa_conforme.nil?
        fail ArgumentError, 'pdfa_conforme cannot be nil'
      end

      @pdfa_conforme = pdfa_conforme
    end

    # Custom attribute writer method with validation
    # @param [Object] xmp_present Value to be assigned
    def xmp_present=(xmp_present)
      if xmp_present.nil?
        fail ArgumentError, 'xmp_present cannot be nil'
      end

      @xmp_present = xmp_present
    end

    # Custom attribute writer method with validation
    # @param [Object] xmp_conforme_facturx Value to be assigned
    def xmp_conforme_facturx=(xmp_conforme_facturx)
      if xmp_conforme_facturx.nil?
        fail ArgumentError, 'xmp_conforme_facturx cannot be nil'
      end

      @xmp_conforme_facturx = xmp_conforme_facturx
    end

    # Custom attribute writer method with validation
    # @param [Object] est_signe Value to be assigned
    def est_signe=(est_signe)
      if est_signe.nil?
        fail ArgumentError, 'est_signe cannot be nil'
      end

      @est_signe = est_signe
    end

    # Custom attribute writer method with validation
    # @param [Object] message_resume Value to be assigned
    def message_resume=(message_resume)
      if message_resume.nil?
        fail ArgumentError, 'message_resume cannot be nil'
      end

      @message_resume = message_resume
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          est_conforme == o.est_conforme &&
          xml_present == o.xml_present &&
          xml_conforme == o.xml_conforme &&
          profil_detecte == o.profil_detecte &&
          erreurs_xml == o.erreurs_xml &&
          pdfa_conforme == o.pdfa_conforme &&
          version_pdfa == o.version_pdfa &&
          methode_validation_pdfa == o.methode_validation_pdfa &&
          regles_validees == o.regles_validees &&
          regles_echouees == o.regles_echouees &&
          erreurs_pdfa == o.erreurs_pdfa &&
          avertissements_pdfa == o.avertissements_pdfa &&
          xmp_present == o.xmp_present &&
          xmp_conforme_facturx == o.xmp_conforme_facturx &&
          profil_xmp == o.profil_xmp &&
          version_xmp == o.version_xmp &&
          erreurs_xmp == o.erreurs_xmp &&
          metadonnees_xmp == o.metadonnees_xmp &&
          est_signe == o.est_signe &&
          nombre_signatures == o.nombre_signatures &&
          signatures == o.signatures &&
          erreurs_signatures == o.erreurs_signatures &&
          message_resume == o.message_resume
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [est_conforme, xml_present, xml_conforme, profil_detecte, erreurs_xml, pdfa_conforme, version_pdfa, methode_validation_pdfa, regles_validees, regles_echouees, erreurs_pdfa, avertissements_pdfa, xmp_present, xmp_conforme_facturx, profil_xmp, version_xmp, erreurs_xmp, metadonnees_xmp, est_signe, nombre_signatures, signatures, erreurs_signatures, message_resume].hash
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
