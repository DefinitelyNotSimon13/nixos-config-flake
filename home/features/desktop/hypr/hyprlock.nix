{ lib, config, ... }:
with lib;
let cfg = config.features.desktop.hyprlock;
in {
  options.features.desktop.hyprlock = {
    enable = mkEnableOption "enables desktop.hyprlock";
  };

  config = mkIf cfg.enable {
    programs.hyprlock = {
      #   enable = true;
      #   settings = {
      #     background = {
      #       path = "${config.home.homeDirectory}/Pictures/wallpapers/landscapes/evening-sky.png";
      #       color = "rgba(255, 1, 1, 1.0)";
      #     };
      #     input-field = {
      #       size = "200, 50";
      #       outline_thickness = 2;
      #       dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
      #       dots_spacing = 0.15; # ; Scale of dot's absolute size, 0.0 - 1.0
      #       outer_color = "rgba(250, 179, 135, 1.0)";
      #       inner_color = "rgba(30, 30, 46, 1.0)";
      #       font_color = "rgba(205, 214, 244, 1.0)";
      #       fade_on_empty = true;
      #       placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
      #       hide_input = false;
      #
      #       position = "0, -20";
      #       halign = "center";
      #       valign = "center";
      #     };
      #     label = {
      #       text = "Hey there, $USER!";
      #       color = "rgba(205, 214, 244, 1.0)";
      #       font_size = 25;
      #       font_family = "Noto Sans";
      #
      #       position = "0, 40";
      #       halign = "center";
      #       valign = "center";
      #     };
      #     auth = {
      #       "pam:enabled" = true;
      #     };
      #   };
    };
  };
}
