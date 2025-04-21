{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  custom-udev-rules = pkgs.callPackage ./udev { };
  direnv-flake = ./scripts/direnv-flake.nix;
}
