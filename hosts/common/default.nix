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
    recommendedProxySettings = false;
    recommendedTlsSettings = false;
    virtualHosts."localhost" = {
      addSSL = false;
      listen = [
        {
          addr = "127.0.0.1";
          port = 80;
          ssl = false;
        }
      ];

      # sslCertificate = "/home/simon/2_Uni/webengineering/project/certs/server_insecure.crt";
      # sslCertificateKey = "/home/simon/2_Uni/webengineering/project/certs/server_insecure.key";

      root = "/home/simon/2_Uni/webengineering/project/public";

      locations."/" = {
        index = "index.html";
        tryFiles = "$uri $uri/ @nodejs";
      };

      locations."@nodejs" = {
        proxyPass = "http://localhost:3000";
        # recommendedProxySettings = true;
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
    ];
  };
  xdg.portal = {
    wlr.enable = true;
    config.common.default = "*";
  };

  boot.supportedFilesystems = [ "ntfs" ];
}
