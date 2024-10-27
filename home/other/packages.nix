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
      cliphist
      jdk22
      rconc
      docker-compose
      edit-config
      fzf
      gcc
      prismlauncher
      gh
      git-credential-manager
      gnumake
      gnupg
      grim
      hyprcursor
      jetbrains-toolbox
      just
      kitty
      libreoffice-qt
      mariadb
      mycli
      ncdu
      networkmanagerapplet
      nixd
      nixfmt-rfc-style
      openssl
      pass
      pinentry-tty
      plantuml
      python3
      rebuild
      ripgrep
      sl
      sops
      spotify
      testscript
      viewnior
      vscode
      wget
      xdg-utils
      xorg.xrandr
      zathura
    ];

  };
}
