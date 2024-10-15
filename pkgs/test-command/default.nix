{ pkgs }:

pkgs.writeShellScriptBin "testscript" ''
  echo "Hello, World!" | ${pkgs.cowsay}/bin/cowsay | ${pkgs.lolcat}/bin/lolcat
''
