{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "stylixConfig";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      image = ../../assets/nice-blue-background.png;
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    };

  };
}
