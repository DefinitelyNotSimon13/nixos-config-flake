{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.theming.qt;
in
{
  options.features.theming.qt = {
    enable = mkEnableOption "enables qt theming";
  };

  config = mkIf cfg.enable {
    qt = {
      enable = false;
      platformTheme.name = "kvantum";
      style = {
        name = "kvantum";
      };
    };

  };
}
