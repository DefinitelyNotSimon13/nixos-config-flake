{ ... }:
{
  imports = [
    ./xserver.nix
    ./pipewire.nix
    ./auto-upgrade.nix
    ./goxlr.nix
    ./greetd.nix
    ./openssh.nix
    ./pscd.nix
    ./virtualisation-docker.nix
  ];
}
