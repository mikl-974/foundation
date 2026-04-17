# Conventions Foundation

## Ce qui va dans foundation

- modules Nix réellement réutilisables;
- devShells transverses (outillage commun);
- helpers/lib partagés;
- templates de base;
- documentation de conventions.

## Ce qui n'y va pas

- configuration d'un host concret;
- logique métier d'un seul repo;
- stacks applicatives couplées à un contexte précis;
- secrets et données d'environnement local.

## Règle de non-couplage fort

Toute brique ajoutée doit pouvoir être consommée sans dépendre de `homelab` ou `workstation`.
Si une option ne sert qu'un seul repo, elle reste dans ce repo.

## Discipline de taille

- garder les modules courts et explicites;
- éviter la sophistication inutile;
- retirer ce qui n'est plus partagé ou plus utile.
