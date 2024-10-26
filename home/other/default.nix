{ lib, ... }:
{
  imports = [
    ./packages.nix
  ];

  other = {
    packages.enable = lib.mkDefault true;
  };

}
