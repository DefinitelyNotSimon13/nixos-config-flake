{ lib, ... }:
{
  imports = [
    ./packages.nix
    ./declair.nix
  ];

  other = {
    packages = {
      enable = lib.mkDefault true;
      nixOsMode = lib.mkDefault true;
      archMode = lib.mkDefault false;
    };
    declair = {
      enable = lib.mkDefault true;
    };
  };

}
