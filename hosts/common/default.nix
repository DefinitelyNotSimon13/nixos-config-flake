# Common configuration for all hosts

{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./users
    ./configs
    ./programs.nix
    ./secrets.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-cosmic.nixosModules.default
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  environment.systemPackages = with pkgs; [
    neovim
    git
    inputs.ghostty.packages.x86_64-linux.default
  ];

  nixpkgs.config.allowUnfree = true;

  system.copySystemConfiguration = false;

  system.stateVersion = "24.05";

  sopsConfig.enable = lib.mkDefault true;

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";

      }
    ];
    packages = [
      "io.github.zen_browser.zen"
      "com.spotify.Client"
    ];
  };
  xdg.portal = {
    wlr.enable = true;
    config.common.default = "*";
  };

  boot.supportedFilesystems = [ "ntfs" ];
}
