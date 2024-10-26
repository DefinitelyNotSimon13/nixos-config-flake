{
  lib,
  config,
  home,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.other.packages;
in
{
  options.other.packages = {
    enable = mkEnableOption "enables packages";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      libreoffice-qt
      cliphist
      edit-config
      sops
      fzf
      gcc
      gh
      git-credential-manager
      gnumake
      gnupg
      openssl
      grim
      hyprcursor
      jetbrains-toolbox
      kitty
      nixd
      mycli
      docker-compose
      nixfmt-rfc-style
      pass
      networkmanagerapplet
      pinentry-tty
      plantuml
      python3
      just
      rebuild
      ripgrep
      sl
      spotify
      testscript
      viewnior
      vscode
      wget
      xdg-utils
      xorg.xrandr
      mariadb
      zathura
    ];

  };
}
