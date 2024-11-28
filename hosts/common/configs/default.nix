{ lib, ... }:
{
  imports = [
    ./console-config.nix
    ./sddm.nix
    ./grub-config.nix
    ./home-manager-config.nix
    ./locale-config.nix
    ./minecraft-server.nix
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
    ./cosmic-desktop.nix
    ./gaming.nix
  ];

  catppuccinConfig.enable = lib.mkDefault true;
  consoleConfig.enable = lib.mkDefault true;
  cosmicDesktop.enable = lib.mkDefault false;
  docker.enable = lib.mkDefault true;
  gaming.enable = lib.mkDefault false;
  greetdConfig.enable = lib.mkDefault true;
  grub.enable = lib.mkDefault true;
  libvirtd.enable = lib.mkDefault true;
  networkConfig.enable = lib.mkDefault true;
  stylixConfig.enable = lib.mkDefault false;
  minecraftServer.enable = lib.mkDefault false;
}
