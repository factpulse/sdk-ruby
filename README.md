# FactPulse SDK Ruby

Client Ruby officiel pour l'API FactPulse - Facturation électronique française.

## Fonctionnalités

- **Factur-X** : Génération et validation de factures électroniques (profils MINIMUM, BASIC, EN16931, EXTENDED)
- **Chorus Pro** : Intégration avec la plateforme de facturation publique française
- **AFNOR PDP/PA** : Soumission de flux conformes à la norme XP Z12-013
- **Signature électronique** : Signature PDF (PAdES-B-B, PAdES-B-T, PAdES-B-LT)
- **Client simplifié** : Authentification JWT et polling intégrés via `helpers`

## Installation

```bash
gem install factpulse
```

Ou dans votre Gemfile :

```ruby
gem 'factpulse'
```

## Démarrage rapide

Le module `helpers` offre une API simplifiée avec authentification et polling automatiques :

```ruby
require 'factpulse'
require 'factpulse/helpers'

include Factpulse::Helpers

# Créer le client
client = FactPulseClient.new(
  'votre_email@example.com',
  'votre_mot_de_passe'
)

# Construire la facture avec les helpers
facture_data = {
  numeroFacture: 'FAC-2025-001',
  dateFacture: '2025-01-15',
  fournisseur: fournisseur(
    'Mon Entreprise SAS',
    '12345678901234',
    '123 Rue Example',
    '75001',
    'Paris'
  ),
  destinataire: destinataire(
    'Client SARL',
    '98765432109876',
    '456 Avenue Test',
    '69001',
    'Lyon'
  ),
  montantTotal: montant_total(1000.00, 200.00, 1200.00, 1200.00),
  lignesDePoste: [
    ligne_de_poste(1, 'Prestation de conseil', 10, 100.00, 1000.00)
  ],
  lignesDeTva: [
    ligne_de_tva(1000.00, 200.00)
  ]
}

# Générer le PDF Factur-X
pdf_bytes = client.generer_facturx(facture_data, 'facture_source.pdf', 'EN16931')

File.binwrite('facture_facturx.pdf', pdf_bytes)
```

## Helpers disponibles (module Factpulse::Helpers)

### montant(value)

Convertit une valeur en string formaté pour les montants monétaires.

```ruby
include Factpulse::Helpers

montant(1234.5)      # "1234.50"
montant('1234.56')   # "1234.56"
montant(nil)         # "0.00"
```

### montant_total(ht, tva, ttc, a_payer, ...)

Crée un objet MontantTotal complet.

```ruby
total = montant_total(
  1000.00,        # ht
  200.00,         # tva
  1200.00,        # ttc
  1200.00,        # a_payer
  50.00,          # remise_ttc (optionnel)
  'Fidélité',     # motif_remise (optionnel)
  100.00          # acompte (optionnel)
)
```

### ligne_de_poste(numero, denomination, quantite, montant_unitaire_ht, montant_total_ligne_ht, ...)

Crée une ligne de facturation.

```ruby
ligne = ligne_de_poste(
  1,
  'Prestation de conseil',
  5,
  200.00,
  1000.00,  # montant_total_ligne_ht requis
  'S',      # categorie_tva: S, Z, E, AE, K
  'HEURE',  # unite: FORFAIT, PIECE, HEURE, JOUR...
  {
    taux_tva: 'TVA20',        # Ou taux_tva_manuel: '20.00'
    reference: 'REF-001'
  }
)
```

### ligne_de_tva(montant_base_ht, montant_tva, ...)

Crée une ligne de ventilation TVA.

```ruby
tva = ligne_de_tva(
  1000.00,    # montant_base_ht
  200.00,     # montant_tva
  'S',        # categorie: S, Z, E, AE, K
  { taux: 'TVA20' }  # Ou taux_manuel: '20.00'
)
```

### adresse_postale(ligne1, code_postal, ville, ...)

Crée une adresse postale structurée.

```ruby
adresse = adresse_postale(
  '123 Rue de la République',
  '75001',
  'Paris',
  'FR',           # pays (défaut: 'FR')
  'Bâtiment A'    # ligne2 (optionnel)
)
```

### fournisseur(nom, siret, adresse_ligne1, code_postal, ville, options)

Crée un fournisseur complet avec calcul automatique du SIREN et TVA intra.

```ruby
f = fournisseur(
  'Ma Société SAS',
  '12345678901234',
  '123 Rue Example',
  '75001',
  'Paris',
  { iban: 'FR7630006000011234567890189' }
)
# SIREN et TVA intracommunautaire calculés automatiquement
```

### destinataire(nom, siret, adresse_ligne1, code_postal, ville, options)

Crée un destinataire (client) avec calcul automatique du SIREN.

```ruby
d = destinataire(
  'Client SARL',
  '98765432109876',
  '456 Avenue Test',
  '69001',
  'Lyon'
)
```

## Mode Zero-Trust (Chorus Pro / AFNOR)

Pour passer vos propres credentials sans stockage côté serveur :

```ruby
include Factpulse::Helpers

chorus_creds = ChorusProCredentials.new(
  'votre_client_id',
  'votre_client_secret',
  'votre_login',
  'votre_password',
  true  # sandbox
)

afnor_creds = AFNORCredentials.new(
  'https://api.pdp.fr/flow/v1',
  'https://auth.pdp.fr/oauth/token',
  'votre_client_id',
  'votre_client_secret'
)

client = FactPulseClient.new(
  'votre_email@example.com',
  'votre_mot_de_passe',
  nil,  # api_url
  nil,  # client_uid
  chorus_creds,
  afnor_creds
)
```

## Ressources

- **Documentation API** : https://factpulse.fr/api/facturation/documentation
- **Support** : contact@factpulse.fr

## Licence

MIT License - Copyright (c) 2025 FactPulse
