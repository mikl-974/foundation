{ lib, config, ... }:
let
  cfg = config.foundation.base;
in
{
  options.foundation.base = {
    enable = lib.mkEnableOption "foundation base settings";

    enableNixCommand = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable the nix-command CLI feature.";
    };

    enableFlakes = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable flake support in Nix.";
    };
  };

  config = lib.mkIf cfg.enable {
    nix.settings.experimental-features = lib.mkDefault (
      lib.optional cfg.enableNixCommand "nix-command"
      ++ lib.optional cfg.enableFlakes "flakes"
    );
  };
}
