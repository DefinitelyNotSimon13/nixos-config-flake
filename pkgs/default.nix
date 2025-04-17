{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  custom-udev-rules = pkgs.callPackage ./udev { };
}
