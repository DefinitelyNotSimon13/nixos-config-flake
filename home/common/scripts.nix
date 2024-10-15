{
  pkgs,
  lib,
  config,
  home,
  ...
}:
let
  moduleName = "scripts";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (import ../../pkgs { inherit pkgs; })
    ];

  };
}
