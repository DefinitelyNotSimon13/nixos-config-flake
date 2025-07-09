{
  pkgs ? import <nixpkgs> { },
  inputs,
  ...
}:
{
  custom-udev-rules = pkgs.callPackage ./udev { };
  direnv-flake = pkgs.callPackage ./scripts/direnv-flake.nix { };
  note = pkgs.callPackage ./scripts/note.nix { };
  tokenize = pkgs.callPackage "${inputs.ownpkgs}/tokenize.nix" { };
}
