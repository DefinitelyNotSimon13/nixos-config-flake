{ pkgs }:

pkgs.writeShellScriptBin "editconfig" ''
  ${pkgs.neovim}/bin/nvim $HOME/dotfiles/nixos
''
