# FactPulse SDK Ruby

Client Ruby officiel pour l'API FactPulse - Facturation électronique française.

## 🎯 Fonctionnalités

- **Factur-X** : Génération et validation de factures électroniques (profils MINIMUM, BASIC, EN16931, EXTENDED)
- **Chorus Pro** : Intégration avec la plateforme de facturation publique française
- **AFNOR PDP/PA** : Soumission de flux conformes à la norme XP Z12-013
- **Signature électronique** : Signature PDF (PAdES-B-B, PAdES-B-T, PAdES-B-LT)
- **Client simplifié** : Authentification JWT et polling intégrés via `helpers`
- **Ruby 2.7+** : Compatible avec les versions modernes de Ruby

## 🚀 Installation

```bash
gem install factpulse
```

Ou dans votre Gemfile :

```ruby
gem 'factpulse'
```

## 📖 Démarrage rapide

### Méthode recommandée : Client simplifié avec helpers

Le module `helpers` offre une API simplifiée avec authentification et polling automatiques :

```ruby
require 'factpulse'
require 'factpulse/helpers'

# Créer le client (authentification automatique)
client = Factpulse::Helpers::FactPulseClient.new(
  email: 'votre_email@example.com',
  password: 'votre_mot_de_passe'
)

# Données de la facture
facture_data = {
  numero_facture: 'FAC-2025-001',
  date_facture: '2025-01-15',
  fournisseur: {
    nom: 'Mon Entreprise SAS',
    siret: '12345678901234',
    adresse_postale: {
      ligne_un: '123 Rue Example',
      code_postal: '75001',
      nom_ville: 'Paris',
      pays_code_iso: 'FR'
    }
  },
  destinataire: {
    nom: 'Client SARL',
    siret: '98765432109876',
    adresse_postale: {
      ligne_un: '456 Avenue Test',
      code_postal: '69001',
      nom_ville: 'Lyon',
      pays_code_iso: 'FR'
    }
  },
  montant_total: {
    montant_ht_total: '1000.00',
    montant_tva: '200.00',
    montant_ttc_total: '1200.00',
    montant_a_payer: '1200.00'
  },
  lignes_de_poste: [{
    numero: 1,
    denomination: 'Prestation de conseil',
    quantite: '10.00',
    unite: 'PIECE',
    montant_unitaire_ht: '100.00'
  }]
}

# Lire le PDF source
pdf_source = File.binread('facture_source.pdf')

# Générer le PDF Factur-X (polling automatique)
pdf_bytes = client.generer_facturx(
  facture_data,
  pdf_source,
  profil: 'EN16931',
  format_sortie: 'pdf',
  sync: true  # Attend le résultat automatiquement
)

# Sauvegarder
File.binwrite('facture_facturx.pdf', pdf_bytes)
```

### Méthode alternative : SDK brut

Pour un contrôle total, utilisez le SDK généré directement :

```ruby
require 'factpulse'
require 'net/http'
require 'json'

# 1. Obtenir le token JWT
uri = URI('https://factpulse.fr/api/token/')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/json' })
request.body = {
  username: 'votre_email@example.com',
  password: 'votre_mot_de_passe'
}.to_json

response = http.request(request)
token = JSON.parse(response.body)['access']

# 2. Configurer le client
Factpulse.configure do |config|
  config.host = 'https://factpulse.fr/api/facturation'
  config.access_token = token
end

# 3. Appeler l'API
api = Factpulse::TraitementFactureApi.new
response = api.generer_facture_api_v1_traitement_generer_facture_post(
  facture_data.to_json,
  'EN16931',
  'pdf',
  File.open('facture_source.pdf', 'rb')
)

# 4. Polling manuel pour récupérer le résultat
task_id = response.id_tache
# ... (implémenter le polling)
```

## 🔧 Avantages des helpers

| Fonctionnalité | SDK brut | helpers |
|----------------|----------|---------|
| Authentification | Manuelle | Automatique |
| Refresh token | Manuel | Automatique |
| Polling tâches async | Manuel | Automatique (backoff) |
| Retry sur 401 | Manuel | Automatique |

## 🔑 Options d'authentification

### Client UID (multi-clients)

Si vous gérez plusieurs clients :

```ruby
client = Factpulse::Helpers::FactPulseClient.new(
  email: 'votre_email@example.com',
  password: 'votre_mot_de_passe',
  client_uid: 'identifiant_client'  # UID du client cible
)
```

### Configuration avancée

```ruby
client = Factpulse::Helpers::FactPulseClient.new(
  email: 'votre_email@example.com',
  password: 'votre_mot_de_passe',
  api_url: 'https://factpulse.fr',  # URL personnalisée
  polling_interval: 2.0,  # Intervalle de polling initial (secondes)
  polling_timeout: 120.0,  # Timeout de polling (secondes)
  max_retries: 2  # Tentatives en cas de 401
)
```

## 💡 Formats de montants acceptés

L'API accepte plusieurs formats pour les montants :

```ruby
# String (recommandé pour la précision)
montant = '1234.56'

# Float
montant = 1234.56

# Integer
montant = 1234

# BigDecimal
require 'bigdecimal'
montant = BigDecimal('1234.56')

# Helper de formatage
montant_formate = Factpulse::Helpers::FactPulseClient.format_montant(1234.5)  # => "1234.50"
```

## 📚 Ressources

- **Documentation API** : https://factpulse.fr/api/facturation/documentation
- **Code source** : https://github.com/factpulse/sdk-ruby
- **Issues** : https://github.com/factpulse/sdk-ruby/issues
- **Support** : contact@factpulse.fr

## 📄 Licence

MIT License - Copyright (c) 2025 FactPulse
