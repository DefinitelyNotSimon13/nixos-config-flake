{ pkgs, ... }:
{
  imports = [
    ../common
    ./configuration.nix
  ];

  sops.age.keyFile = "/home/simon/.config/sops/age/keys.txt";

  gaming.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
