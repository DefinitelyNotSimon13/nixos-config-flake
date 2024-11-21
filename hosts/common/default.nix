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

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  sopsConfig.enable = lib.mkDefault true;

  services.flatpak.enable = true;
  xdg.portal.wlr.enable = true;

  boot.supportedFilesystems = [ "ntfs" ];
}
