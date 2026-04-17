# Guidelines de modules partagés

## Principes

- un module = une responsabilité claire;
- activation explicite via une option `enable`;
- valeurs par défaut sobres et sûres;
- aucune hypothèse sur un host concret.

## Structure recommandée

- `options.foundation.<domaine>.<module>` pour les options;
- `config = lib.mkIf cfg.enable { ... };` pour l'activation;
- commentaires/docstrings uniquement si utiles.

## Anti-patterns à éviter

- options trop nombreuses sans besoin réel;
- valeurs hardcodées spécifiques à un environnement;
- logique métier applicative dans foundation;
- effets de bord cachés.
