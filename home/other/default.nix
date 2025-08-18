{ lib, ... }:
{
  imports = [
    ./packages.nix
  ];

  other = {
    packages = {
      enable = lib.mkDefault true;
      nixOsMode = lib.mkDefault true;
      archMode = lib.mkDefault false;
    };
  };

}
