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
    inputs.home-manager.nixosModules.home-manager
  ];

  catppuccin = {
    enable = lib.mkDefault true;
    accent = "peach";
    flavor = "mocha";
  };

}
