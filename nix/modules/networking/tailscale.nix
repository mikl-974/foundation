{ lib, config, ... }:
let
  cfg = config.foundation.networking.tailscale;
in
{
  options.foundation.networking.tailscale = {
    enable = lib.mkEnableOption "Tailscale shared foundation module";

    useRoutingFeatures = lib.mkOption {
      type = lib.types.enum [ "none" "client" "server" "both" ];
      default = "client";
      description = "Routing mode passed to services.tailscale.useRoutingFeatures.";
    };

    extraSetFlags = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      description = "Extra flags passed to tailscale set via services.tailscale.extraSetFlags.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.tailscale = {
      enable = true;
      useRoutingFeatures = lib.mkDefault cfg.useRoutingFeatures;
      extraSetFlags = cfg.extraSetFlags;
    };
  };
}
