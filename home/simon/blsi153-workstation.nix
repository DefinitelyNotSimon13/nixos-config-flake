{ pkgs, ... }: {
  imports = [ ./home.nix ../dotfiles ../common ../features ../other ];

  features = { desktop.hyprland = { enable = true; }; };

  other = {
    packages = { enable = false; };
    declair = { enable = false; };
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    git-credential-manager
    neovim
    bat
    ncdu
    quickshell
    ghostty
    just
    cava
    cliphist
    matugen
    xh
    zarf
    chromium
    minio-client
    trivy
    nixd
    zotero
    ollama
    bun
  ];

  wayland.windowManager.hyprland = {
    settings = {
      monitor =
        [ "DP-6, 2560x1440@60, 1920x0, 1" "DP-7, 1920x1080@60, 0x0, 1" ];

      workspace = [
        "1, monitor:DP-6, default:true"
        "2, monitor:DP-6"
        "3, monitor:DP-6"
        "4, monitor:DP-6"
        "5, monitor:DP-6"
      ];
    };
  };

}
