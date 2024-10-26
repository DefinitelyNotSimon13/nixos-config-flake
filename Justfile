default:
    @just --list

rebuild-pre:
    git add *.nix

rebuild-post:
  #!/usr/bin/env bash
  generation=$(nixos-rebuild list-generations | grep current | awk '{print $1}')
  date=$(date '+%d.%m.%Y - %H:%M:%S')

  git commit -am "Gen: $generation - $date"
  echo "Commited: \"Gen: $generation - $date\""


rebuild: rebuild-pre && rebuild-post
    nh os switch

diff:
    git diff ':!flake.lock'


check:
    nix flake check --impure --keep-going
