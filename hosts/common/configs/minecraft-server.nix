{
  pkgs,
  lib,
  config,
  home,
  ...
}:
let
  moduleName = "minecraftServer";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    services.minecraft-server = {
      enable = true;
      eula = true;

    };

  };
}
