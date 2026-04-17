{ nixpkgs, systems }:
let
  lib = nixpkgs.lib;
in
lib.genAttrs systems (
  system:
  let
    pkgs = import nixpkgs { inherit system; };
    dotnet = import ./dotnet.nix { inherit pkgs; };
  in
  {
    default = dotnet;
    inherit dotnet;
  }
)
