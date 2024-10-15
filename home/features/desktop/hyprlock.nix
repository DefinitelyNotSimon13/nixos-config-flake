{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.desktop.hyprlock;
in
{
  options.features.desktop.hyprlock = {
    enable = mkEnableOption "enables desktop.hyprlock";
  };

  config = mkIf cfg.enable {

  };
}
