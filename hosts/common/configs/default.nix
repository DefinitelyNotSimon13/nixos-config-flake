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
  ];

  grub = {
    enable = lib.mkDefault true;
  };

  consoleConfig.enable = lib.mkDefault true;
  networkConfig = {
    enable = lib.mkDefault true;
  };

  stylixConfig.enable = lib.mkDefault false;
  catppuccinConfig.enable = lib.mkDefault true;
}
