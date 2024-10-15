{ pkgs, ... }:
{
  # Define your custom packages here
  #  my-package = pkgs.callPackage ./my-package {};
  test-command = pkgs.callPackage ./test-command { };
}
