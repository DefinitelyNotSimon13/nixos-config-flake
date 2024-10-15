{ pkgs, ... }:
{
  imports = [
    ./wayland.nix
    ./waybar.nix
    ./hypr/hyprland.nix
    ./hypr/hypridle.nix
    ./hypr/hyprpaper.nix
    ./hypr/hyprlock.nix
  ];

  home.packages =
    with pkgs;
    [
    ];
}
