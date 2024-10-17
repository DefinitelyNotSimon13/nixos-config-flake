{
  lib,
  config,
  pkgs,
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
      theme = {
        name = "Tokyonight-Dark";
        package = pkgs.tokyonight-gtk-theme;
      };
    };

  };
}
