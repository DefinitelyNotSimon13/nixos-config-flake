{
  lib,
  config,
  pkgs,
  ...
}:
let
  moduleName = "docker";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = false;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    environment.systemPackages = [
      pkgs.distrobox
    ];

  };
}
