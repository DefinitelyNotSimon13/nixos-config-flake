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
      enable = true;
      image = ../assets/nice-blue-background.png;
      polarity = "dark";
      base16Scheme = "${pkgs.base-16-schemes}/share/themes/catppuccin-mocha.yaml";
    };

  };
}
