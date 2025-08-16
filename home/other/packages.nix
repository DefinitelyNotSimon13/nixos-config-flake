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
        ###### local pkgs ######
        custom-udev-rules
        direnv-flake
        note
        docker-clean
        # tokenize

        ###### nix-pkgs ######
        alsa-lib
        arduino-ide
        brave
        chafa
        cliphist
        cmake
        diff-so-fancy
        docker-compose
        firefox
        freerdp
        gcc
        gh
        gimp
        git-credential-manager
        gnumake
        gnupg
        go
        google-chrome
        grim
        hyprcursor
        i3lock
        jetbrains-toolbox
        just
        keepass
        keepass
        kubectl
        libreoffice-qt
        minikube
        montserrat
        mprocs
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
        poppler-utils
        python3
        remmina
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
        xh
        xh
        xorg.xrandr
        zathura
        zotero
      ]
      ++ optionals config.other.packages.nixOsMode [
        ghostty
      ];

  };
}
