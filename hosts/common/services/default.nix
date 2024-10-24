{ lib, ... }:
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
    ./docker.nix
    ./libvirtd.nix
  ];

  docker.enable = lib.mkDefault true;
  libvirtd.enable = lib.mkDefault true;

}
