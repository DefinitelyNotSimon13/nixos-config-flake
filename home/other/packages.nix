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
    nixOsMode = mkEnableOption "running in NixOs mode";
  };

  config = mkIf cfg.enable {

    nixpkgs.config = {
      allowUnfree = true;
    };

    home.packages =
      with pkgs;
      [
        # local pkgs
        custom-udev-rules
        direnv-flake
        note
        # tokenize

        remmina
        freerdp

        # nix-pkgs
        alsa-lib
        brave
        chafa
        cliphist
        mprocs
        xh
        cmake
        docker-compose
        firefox
        i3lock
        poppler-utils
        keepass
        google-chrome
        minikube
        kubectl
        diff-so-fancy
        gcc
        arduino-ide
        gh
        gimp
        git-credential-manager
        gnumake
        gnupg
        go
        grim
        hyprcursor
        jetbrains-toolbox
        just
        libreoffice-qt
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
        montserrat
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
        zotero
        wev
        wget
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
        xdg-utils
        xorg.xrandr
        zathura
      ]
      ++ optionals config.other.packages.nixOsMode [
        ghostty
      ];

  };
}
