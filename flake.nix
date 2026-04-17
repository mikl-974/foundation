{
  description = "Shared foundation for reusable Nix modules, devShells, and conventions";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];

      foundationLib = import ./nix/lib {
        inherit lib;
      };

      nixosModules = import ./nix/modules;
      devShells = import ./nix/devshells {
        inherit nixpkgs systems;
      };
    in
    {
      lib = foundationLib;
      inherit nixosModules devShells;
    };
}
