{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "note";

  runtimeInputs = with pkgs; [
    bash
  ];

  text = ''
    #!/usr/bin/env bash

    NOTES_DIR="$HOME/notes"

    title=$(date +%Y_%m_%e-%H_%M_%S)

    while getopts "t:" arg; do
        case $arg in
            t)
                title="$title-$OPTARG"
                ;;
            *)
                echo "Warning: Invalid flag used!"
                ;;
        esac
    done

    title="$title.md"
    full_path="$NOTES_DIR/$title"

    mkdir -p "$NOTES_DIR"
    touch "$full_path"
    "$EDITOR" "$full_path"
    echo "Note saved in $full_path"
  '';
}
