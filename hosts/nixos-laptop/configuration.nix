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

  nixpkgs.config = {
    allowUnfree = true;
    android_sdk.accept_license = true;
  };

  system.copySystemConfiguration = false;

  system.stateVersion = "24.05";

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };
  services.displayManager = {
    defaultSession = "none+i3";
  };

}
