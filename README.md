# foundation

`foundation` est un socle partagé pour extraire et maintenir des briques réutilisables entre plusieurs repos (notamment `homelab` et `workstation`).

## Contenu autorisé

- modules Nix génériques;
- devShells partagés;
- helpers/lib Nix;
- templates de base;
- conventions et documentation.

## Contenu interdit

- hosts concrets;
- stacks applicatives spécifiques;
- secrets réels;
- logique métier couplée à un seul repo.

## Structure

- `nix/modules/` : modules NixOS partagés;
- `nix/devshells/` : shells de développement transverses;
- `nix/lib/` : helpers Nix partagés;
- `scripts/` : scripts partagés (futur);
- `templates/` : templates de démarrage (futur);
- `docs/` : règles et guidelines.

## Utilisation via flake input

Dans `homelab` ou `workstation`:

```nix
{
  inputs.foundation.url = "github:mikl-974/foundation";

  outputs = { self, nixpkgs, foundation, ... }: {
    nixosConfigurations.my-host = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        foundation.nixosModules.base
        foundation.nixosModules.networkingTailscale
        foundation.nixosModules.securitySsh
      ];
    };
  };
}
```

DevShell:

```bash
nix develop github:mikl-974/foundation#dotnet
```
