{ lib, config, ... }:
let
  cfg = config.foundation.containers.docker;
in
{
  options.foundation.containers.docker = {
    enable = lib.mkEnableOption "Docker shared foundation module";

    rootless = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Docker rootless mode.";
    };

    daemonSettings = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Additional Docker daemon settings.";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      rootless.enable = lib.mkDefault cfg.rootless;
      daemon.settings = cfg.daemonSettings;
    };
  };
}
