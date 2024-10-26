{ lib, ... }:
{
  imports = [
    ./console-config.nix
    ./grub-config.nix
    ./home-manager-config.nix
    ./locale-config.nix
    ./network-config.nix
    ./network-config.nix
    ./nix-config.nix
    ./nixpkgs-config.nix
    ./stylix-config.nix
    ./catppuccin-config.nix
    ./xserver.nix
    ./pipewire.nix
    ./auto-upgrade.nix
    ./goxlr.nix
    ./greetd.nix
    ./openssh.nix
    ./pscd.nix
    ./docker.nix
    ./libvirtd.nix
  ];

  greetdConfig.enable = lib.mkDefault true;
  docker.enable = lib.mkDefault true;
  libvirtd.enable = lib.mkDefault true;
  grub.enable = lib.mkDefault true;
  consoleConfig.enable = lib.mkDefault true;
  networkConfig.enable = lib.mkDefault true;
  stylixConfig.enable = lib.mkDefault false;
  catppuccinConfig.enable = lib.mkDefault true;
}
