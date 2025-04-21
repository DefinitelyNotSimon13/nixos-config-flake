{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  custom-udev-rules = pkgs.callPackage ./udev { };
  direnv-flake = pkgs.callPackage ./scripts/direnv-flake.nix { };
  note = pkgs.callPackage ./scripts/note.nix { };
}
