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

    nixpkgs.config = {
      allowUnfree = true;
    };

    home.packages = with pkgs; [
      cliphist
      firefox
      tree-sitter
      docker-compose
      gcc
      prismlauncher
      nspr
      gh
      viu
      wev
      ghostty
      go
      gimp
      alsa-lib
      mesa
      raylib
      chafa
      rustup
      cmake
      ueberzugpp
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
      azure-cli
      chromium
      networkmanagerapplet
      nixd
      nixfmt-rfc-style
      openssl
      pass
      pinentry-tty
      plantuml
      python3
      ripgrep
      sl
      sops
      viewnior
      vscode
      wget
      xdg-utils
      xorg.xrandr
      zathura
      zk
      nautilus
    ];

  };
}
