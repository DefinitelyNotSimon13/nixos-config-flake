{ pkgs, ... }:
{
  imports = [
    ./home.nix
    ../dotfiles
    ../common
    ../features
    ../other
  ];

  targets.genericLinux.enable = true;

  features = {
    theming.catppuccin.enable = false;
    desktop.hyprland = {
      enable = true;
    };
  };

  other.packages.nixOsMode = false;

  dotfiles.i3 = {
    enable = false;
  };

  home.packages = with pkgs; [
    neovim
  ];

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-6, 2560x1440@60, 1920x0, 1"
        "DP-7, 1920x1080@60, 0x0, 1"
      ];

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
