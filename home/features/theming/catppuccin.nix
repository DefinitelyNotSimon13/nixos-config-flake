{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.theming.catppuccin;
in
{
  options.features.theming.catppuccin = {
    enable = mkEnableOption "enables catppuccin theming";
  };

  config = mkIf cfg.enable {
    catppuccin = {
      enable = true;
      accent = "peach";
      flavor = "mocha";
    };

  };
}
