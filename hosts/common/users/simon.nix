{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{

  users.users.simon = {
    initialPassword = null;
    isNormalUser = true;
    description = "simon";
    extraGroups = [
      "wheel"
      "kvm"
      "networkmanager"
      "flatpak"
      "audio"
      "video"
      "input"
    ];
    useDefaultShell = true;
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };
  home-manager.users.simon = import ../../../home/simon/${config.networking.hostName}.nix;
}
