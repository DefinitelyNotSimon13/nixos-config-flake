# Common configuration for all hosts

{
  inputs,
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

}
