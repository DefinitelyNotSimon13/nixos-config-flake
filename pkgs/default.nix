{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  testscript = pkgs.callPackage ./testscript { };
  rebuild = pkgs.callPackage ./util-scripts/rebuild.nix { };
  edit-config = pkgs.callPackage ./util-scripts/edit-config.nix { };
}
