{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "direnv-flake";

  runtimeInputs = with pkgs; [
    bash
    direnv
    git
  ];

  text = ''
    #!/usr/bin/env bash

    template="github:DefinitelyNotSimon13/flake-templates"


    while getopts "t:" arg; do
        case $arg in
            t)
                template="$template#$OPTARG"
                ;;
            *)
                echo "Warning: Invalid flag used!"
                ;;
        esac
    done

    nix flake init -t "$template"

    echo ".direnv" >> .gitignore
    echo ".cache" >> .gitignore

    if [ ! -d ".git" ]; then
        git init
        git add .
    fi

    direnv allow
  '';
}
