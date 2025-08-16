{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.desktop.hyprpaper;
in
{
  options.features.desktop.hyprpaper = {
    enable = mkEnableOption "enables desktop.hyprpaper";
  };

  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "/home/simon/Pictures/wallpapers/misc/lonely-fish.png"
          "/home/simon/Pictures/wallpapers/monitor2.jpg"
          "/home/simon/Pictures/wallpapers/airbus/A350.jpg"
          "/home/simon/Pictures/wallpapers/airbus/A400M.jpg"
        ];

        wallpaper = [
          "DP-1,/home/simon/Pictures/wallpapers/misc/lonely-fish.png"
          "DP-2,/home/simon/Pictures/wallpapers/misc/lonely-fish.png"
          "DP-3, /home/simon/Pictures/wallpapers/monitor2.jpg"
          "DP-6, /home/simon/Pictures/wallpapers/airbus/A400M.jpg"
          "DP-7, /home/simon/Pictures/wallpapers/airbus/A350.jpg"
          "HDMI-A-1, /home/simon/Pictures/wallpapers/monitor2.jpg"
          "eDP-1,/home/simon/Pictures/wallpapers/misc/lonely-fish.png"
        ];

        splash = false;

      };
    };

  };
}
