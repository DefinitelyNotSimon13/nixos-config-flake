# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networkConfig.hostName = "nixos-laptop";

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
  };
  services.displayManager = {
    enable = true;
  };
  services.desktopManager.plasma6.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  system.copySystemConfiguration = false;

  system.stateVersion = "24.05";

  services.xserver = {
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };

}
