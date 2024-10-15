{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.desktop.hypridle;
in
{
  options.features.desktop.hypridle = {
    enable = mkEnableOption "enables desktop.hypridle";
  };

  config = mkIf cfg.enable {

  };
}
