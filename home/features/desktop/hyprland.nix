{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.desktop.hyprland;
in
{
  options.features.desktop.hyprland = {
    enable = mkEnableOption "enables desktop.hyprland";
  };

  config = mkIf cfg.enable {

  };
}
