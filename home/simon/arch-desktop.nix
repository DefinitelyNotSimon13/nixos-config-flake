{ pkgs, ... }:
{
  imports = [
    ./home.nix
    ../dotfiles
    ../common
    ../features
    ../other
  ];

  features = {
    theming.catppuccin.enable = false;
    desktop.hyprland = {
      enable = true;
    };
  };

  other.packages.nixOsMode = false;
  other.packages.archMode = true;

  home.packages = with pkgs; [
    neovim
  ];

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-1, 2560x1440@164.84, 1920x0, 1"
        "HDMI-A-1, 1920x1080@60, 0x0, 1"
        "DP-3, 1920x1080@60, 4480x-700, 1, transform, 3"
      ];

      workspace = [
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-1"
        "7, monitor:DP-1"
      ];
    };
  };
}
