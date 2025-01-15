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
    ./nix-ld.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  services.nginx = {
    enable = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
    virtualHosts."localhost" = {
      locations."/" = {
        proxyPass = "http://localhost:3000";
      };
    };
    virtualHosts."test.org" = {
      locations."/" = {
        proxyPass = "http://localhost:3000";
      };
    };
  };
  systemd.services.nginx.serviceConfig.ReadWritePaths = [
    "/var/log/nginx/"
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  environment.systemPackages = with pkgs; [
    neovim
    git
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
      "com.discordapp.Discord"
      "com.spotify.Client"
    ];
  };
  xdg.portal = {
    wlr.enable = true;
    config.common.default = "*";
  };

  boot.supportedFilesystems = [ "ntfs" ];
}
