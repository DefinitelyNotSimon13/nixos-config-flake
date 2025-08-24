default:
    @just --list

rebuild-pre:
    git add .

package:
    nvim $HOME/dotfiles/nixos/home/other/packages.nix
    just rebuild

rebuild-post:
  #!/usr/bin/env bash
  generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')
  date=$(date '+%d.%m.%Y - %H:%M:%S')

  git commit -am "Gen: $generation - $date"
  echo "Commited: \"Gen: $generation - $date\""

rebuild: rebuild-pre && rebuild-post
  #!/usr/bin/env zsh
  if [[ $HOST == nixos-* ]]; then
    echo "Rebuilding OS"
    nh os switch
  else
    echo "Rebuilding HM"
    nh home switch
  fi

update-rebuild: update rebuild

update:
    nix flake update

diff:
    git diff ':!flake.lock'

check:
    nix flake check --impure --keep-going

build-iso: rebuild-pre && rebuild-post
    nix run nixpkgs#nixos-generators -- \
        --format iso \
        --flake "/home/simon/dotfiles/nixos#iso-image" \
        -o result
