{
  lib,
  config,
  home,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.other.declair;
in
{
  options.other.declair = {
    enable = mkEnableOption "enables packages";
  };

  config = mkIf cfg.enable {

    home.packages = with pkgs; [
      babashka
      gum
    ];

  };
}
