{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.desktop.hyprpaper;
in
{
  options.features.desktop.hyprpaper = {
    enable = mkEnableOption "enables desktop.hyprpaper";
  };

  config = mkIf cfg.enable {

  };
}
