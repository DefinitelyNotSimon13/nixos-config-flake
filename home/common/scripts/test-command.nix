{ pkgs, ... }:
pkgs.writeShellScriptBin "test-command" ''

  echo "Hello there!" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat

''
