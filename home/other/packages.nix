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
      # local pkgs
      custom-udev-rules
      direnv-flake
      note
      # tokenize

      # nix-pkgs
      synology-drive-client
      libreoffice
      alsa-lib
      brave
      chafa
      cliphist
      cmake
      docker-compose
      firefox
      gcc
      arduino-ide
      gh
      ghostty
      gimp
      git-credential-manager
      gnumake
      gnupg
      go
      grim
      hyprcursor
      jetbrains-toolbox
      just
      nautilus
      ncdu
      networkmanagerapplet
      nixd
      nixfmt-rfc-style
      nodejs
      nspr
      openssl
      pass
      pavucontrol
      pinentry-tty
      plantuml
      python3
      ripgrep
      rustup
      sl
      sops
      spotify
      sqlitebrowser
      tree-sitter
      ueberzugpp
      viewnior
      vistafonts
      viu
      vscode
      wev
      wget
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-utils
      xorg.xrandr
      zathura
    ];

  };
}
