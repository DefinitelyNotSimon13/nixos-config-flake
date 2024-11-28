{ pkgs, lib, ... }:
{
  imports = [
    ../common
    ./configuration.nix
  ];

  sops.age.keyFile = "/home/simon/.config/sops/age/keys.txt";

  gaming.enable = true;

  services.xserver = {
    enable = lib.mkForce true;
    autorun = false;
  };

  systemd.user.services.xdg-desktop-portal-gtk = {
    wantedBy = [ "xdg-desktop-portal.service" ];
    before = [ "xdg-desktop-portal.service" ];
  };
}
