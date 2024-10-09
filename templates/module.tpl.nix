{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "$MODULE_NAME$";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {

  };
}
