# Configuration GitHub Actions

## Secret RubyGems requis

1. Allez sur https://github.com/factpulse/sdk-ruby/settings/secrets/actions
2. Cliquez sur "New repository secret"
3. Nom : `RUBYGEMS_API_KEY`
4. Valeur : Votre API key RubyGems (obtenue sur https://rubygems.org/profile/api_keys)

## Déploiement

Le workflow se déclenche automatiquement lors de la création d'un tag `v*` (exemple : `v1.0.0`).
