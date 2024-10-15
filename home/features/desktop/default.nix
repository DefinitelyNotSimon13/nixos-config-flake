{ pkgs, ... }:
{
  imports = [
    ./wayland.nix
    ./waybar.nix
    ./fonts.nix
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
