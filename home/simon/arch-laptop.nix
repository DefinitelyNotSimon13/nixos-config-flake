{ pkgs, ... }: {
  imports = [ ./home.nix ../dotfiles ../common ../features ../other ];

  features = {
    desktop.hyprland = { enable = true; };
    theming = { };
  };

  other = {
    packages = { enable = false; };
    declair = { enable = false; };
  };

  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [ "eDP-1, preferred, auto, 1.2" ", preferred, auto, 1" ];

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
