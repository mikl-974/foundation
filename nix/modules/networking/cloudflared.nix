{ lib, config, ... }:
let
  cfg = config.foundation.networking.cloudflared;
in
{
  options.foundation.networking.cloudflared = {
    enable = lib.mkEnableOption "cloudflared shared foundation module";

    tunnels = lib.mkOption {
      type = lib.types.attrs;
      default = { };
      description = "Tunnel definitions forwarded to services.cloudflared.tunnels.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.cloudflared = {
      enable = true;
      tunnels = cfg.tunnels;
    };
  };
}
