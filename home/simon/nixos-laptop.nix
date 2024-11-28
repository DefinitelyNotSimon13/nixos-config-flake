{ pkgs, ... }:
{
  imports = [
    ./home.nix
    ../dotfiles
    ../common
    ../features
    ../other
  ];

  dotfiles.i3.enable = true;

  home.packages = with pkgs; [
    i3
    polybar
    picom
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      gaps = {
        inner = 0;
        outer = 0;
      };
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "eDP-1, preferred, auto, 1.2"
      ];

      workspace = [
        "1, monitor:eDP-1, default:true"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
      ];
    };
  };
}
