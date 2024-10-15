{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.theming.gtk;
  accent = "mauve";
  flavor = "mocha";
in
{
  options.features.theming.gtk = {
    enable = mkEnableOption "enables gtk theming";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      catppuccin = {
        enable = true;
        accent = accent;
        flavor = flavor;
        icon = {
          enable = true;
          accent = accent;
          flavor = flavor;
        };
      };
    };

  };
}
