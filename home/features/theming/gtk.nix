{ lib, config, pkgs, ... }:
with lib;
let cfg = config.features.theming.gtk;
in {
  options.features.theming.gtk = {
    enable = mkEnableOption "enables gtk theming";
  };

  config = mkIf cfg.enable {
    gtk = {
      # enable = true;
      # theme = {
      #   name = "Gruvbox-Dark";
      #   package = pkgs.gruvbox-material-gtk-theme;
      # };
    };

  };
}
