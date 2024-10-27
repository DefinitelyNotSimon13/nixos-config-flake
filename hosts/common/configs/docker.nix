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
    programs.dconf.enable = true;
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    virtualisation.podman = {
      enable = true;
      dockerCompat = false;
    };

    environment.systemPackages = [
      pkgs.distrobox
    ];

  };
}
