{
  base = import ./base;

  networking = import ./networking;
  networkingTailscale = import ./networking/tailscale.nix;
  networkingCloudflared = import ./networking/cloudflared.nix;

  containers = import ./containers;
  containersDocker = import ./containers/docker.nix;

  security = import ./security;
  securitySsh = import ./security/ssh.nix;

  users = import ./users;
  usersAdmin = import ./users/admin.nix;
}
