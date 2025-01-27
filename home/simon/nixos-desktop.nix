{ ... }:
{
  imports = [
    ./home.nix
    ../dotfiles
    ../common
    ../features
    ../other
  ];

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-1, preferred, 0x0, 1"
        "DP-2 , 1920x1080@60, -1920x0000, 1"
        "DP-3, 1920x1080@60, 1920x-700, 1, transform, 3"
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
