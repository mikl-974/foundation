{ lib, config, ... }:
let
  cfg = config.foundation.security.ssh;
in
{
  options.foundation.security.ssh = {
    enable = lib.mkEnableOption "OpenSSH shared foundation module";

    passwordAuthentication = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Allow password-based SSH authentication.";
    };

    permitRootLogin = lib.mkOption {
      type = lib.types.enum [ "yes" "prohibit-password" "forced-commands-only" "no" ];
      default = "no";
      description = "Value for services.openssh.settings.PermitRootLogin.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = cfg.passwordAuthentication;
        PermitRootLogin = cfg.permitRootLogin;
      };
    };
  };
}
