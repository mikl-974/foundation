{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    dotnet-sdk
    git
    curl
    jq
    openssl
    pkg-config
  ];
}
