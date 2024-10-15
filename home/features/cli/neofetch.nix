{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.cli.neofetch;
in
{
  options.features.cli.neofetch = {
    enable = mkEnableOption "enables neofetch";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ neofetch ];
  };
}
