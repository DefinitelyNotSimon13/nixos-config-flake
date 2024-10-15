{
  pkgs ? import <nixpkgs> { },
  ...
}:
{
  # Define your custom packages here
  #  my-package = pkgs.callPackage ./my-package {};
  testscript = pkgs.callPackage ./testscript { };
}
