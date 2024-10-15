{ pkgs }:

pkgs.writeShellScriptBin "testscript" ''
  echo "Hello there, I am working!" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat
''
