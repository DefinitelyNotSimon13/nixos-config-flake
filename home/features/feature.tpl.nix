{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.PLACEHOLDER;
in
{
  options.features.PLACEHOLDER = {
    enable = mkEnableOption "enables PLACEHOLDER";
  };

  config = mkIf cfg.enable {

  };
}
