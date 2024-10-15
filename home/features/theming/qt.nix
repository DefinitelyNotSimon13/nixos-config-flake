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
      enable = true;
      platformTheme.name = "kvantum";
      style = {
        name = "kvantum";
        catppuccin = {
          enable = true;
          accent = "green";
          flavor = "mocha";
          apply = true;
        };
      };
    };

  };
}
