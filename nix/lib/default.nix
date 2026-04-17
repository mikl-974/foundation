{ lib }:
{
  inherit (import ./mk-helpers.nix { inherit lib; })
    mkFoundationEnableOption;
}
