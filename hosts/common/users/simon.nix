{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
    users.defaultUserShell = pkgs.zsh;

    users.users.simon = {
      initialHashedPassword = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8";
      isNormalUser = true;
      description = "simon";
      extraGroups = [
        "wheel"
        "networkmanager"
        "flatpak"
        "audio"
        "video"
        "input"
      ];
      useDefaultShell = true;
      packages = [inputs.home-manager.packages.${pkgs.system}.default];
    };
  home-manager.users.simon =
    import ../../../home/simon/${config.networking.hostName}.nix;
}
