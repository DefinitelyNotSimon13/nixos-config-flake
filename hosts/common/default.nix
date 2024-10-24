# Common configuration for all hosts

{
  inputs,
  lib,
  ...
}:
{
  imports = [
    ./users
    ./services
    ./configs
    ./programs.nix
    ./secrets.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-cosmic.nixosModules.default
  ];

  greetdConfig.enable = false;

  services.desktopManager.cosmic.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.flatpak.enable = true;

}
