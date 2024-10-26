# Common configuration for all hosts

{
  inputs,
  lib,
  ...
}:
{
  imports = [
    ./users
    ./configs
    ./programs.nix
    ./secrets.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.nixos-cosmic.nixosModules.default
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

}
