{ pkgs, ... }:
pkgs.writeShellApplication {
  name = "docker-clean";

  runtimeInputs = with pkgs; [
    bash
  ];

  text = ''
    #!/usr/bin/env bash

    docker ps | tail -n +2 | awk '{print $1}' | xargs -I {} bash -c "docker kill {} > /dev/null; docker rm {}"

    echo -e "\n\e[1;32mCleaned up containers!\e[0m"
  '';
}
