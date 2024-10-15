{ pkgs }:

pkgs.writeShellScriptBin "rebuild" ''
  set -e
  pushd $HOME/dotfiles/nixos

  git add .
  git diff -U0

  ${pkgs.nh}/bin/nh os switch || (echo "An error occurred! Aborting..." && false)

  generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')
  date=$(date '+%d.%m.%Y - %H:%M:%S')

  echo "Commiting changes..."

  git commit -am "Gen: $generation - $date"
  echo "Commit: \"Gen: $generation - $date\""
  popd
''
