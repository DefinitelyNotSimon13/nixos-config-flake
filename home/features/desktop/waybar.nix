{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.desktop.waybar;
in
{
  options.features.desktop.waybar = {
    enable = mkEnableOption "enables desktop.waybar";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainbar = {
          layer = "top";
          output = [
            "DP-1"
            "eDP-1"
          ];
          position = "bottom";
          margin = "0 0";
          margin-bottom = 0;
          margin-top = 0;
          modules-left = [
            "clock"
            "user#1"
            "custom/updates"
            "custom/media"
            "hyprland/workspaces"
            "hyprland/window"
          ];
          modules-center = [ ];
          modules-right = [
            "tray"
            "pulseaudio"
            "network"
            "cpu"
            "temperature"
            "memory"
            "battery"
            "backlight"
            "keyboard-state"
            "custom/power"
          ];

          "keyboard-state" = {
            numlock = true;
            capslock = false;
            format = "{icon} {name}";
            format-icons = {
              "locked" = "";
              "unlocked" = "";
            };
            on-click = "eww open dropdown";
            on-click-right = "eww close dropdown";
          };
          "custom/updates" = {
            format = " {}";
            tooltip = false;
            interval = 3600;
            exec = "exec $HOME/.config/waybar/scripts/checkupdate.sh";
            onclick = "kitty --hold pacman -Qu";
          };
          "custom/media" = {
            format = "{icon} {}";
            returntype = "json";
            max-length = 40;
            format-icons = {
              "spotify" = "";
              "default" = "󰎈";
            };
            escape = true;
            exec = "$HOME/.config/waybar/scripts/mediaplayer.py 2> /dev/null";
            onclick = "$HOME/.bin/mpd";
          };
          "hyprland/workspaces" = {
            format = "{icon}";
            on-click = "activate";
            on-scroll-up = "hyprctl dispatch workspace e+1";
            on-scroll-down = "hyprctl dispatch workspace e-1";
            format-icons = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "urgent" = "";
              "default" = "-";
            };
            sort-by-number = true;
          };
          "hyprland/window" = {
            format = "➡ {}";
            separate-outputs = true;
          };
          "clock" = {
            tooltip-format = "<big>{=%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{=%Y-%m-%d}";
          };
          "cpu" = {
            format = " {usage}%";
            tooltip = false;
          };
          "memory" = {
            format = "{}% ";
          };
          "temperature" = {
            critical-threshold = 80;
            format-critical = "{temperatureC}°C {icon}";
            format = "{icon} {temperatureC}°C";
            format-icons = [
              ""
              ""
              ""
            ];
          };
          "battery" = {
            states = {
              "good" = 95;
              "warning" = 30;
              "critical" = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = [
              "󰁺"
              "󰁼"
              "󰁿"
              "󰂁"
              "󰁹"
            ];
            on-click = "$HOME/.bin/battery";
          };
          "network" = {
            format-wifi = "  {essid} ({signalStrength}%)";
            format-ethernet = " 󰈀 Connected";
            tooltip-format = "󰙨 {ifname} via {gwaddr}";
            format-linked = "󰙨 {ifname} (No IP)";
            format-disconnected = "⚠ Disconnected";
            format-alt = "{ifname}= {ipaddr}/{cidr}";
            on-click = "nm-applet";
          };
          "pulseaudio" = {
            format = "{icon}  {volume}%";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "" # " {volume}%"
            ;
            format-source-muted = "";
            reverse-scrolling = true;
            format-icons = {
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = [
                ""
                ""
                ""
              ];
            };
            on-click = "$HOME/.bin/volume";
          };
          "user#1" = {
            format = " {user}";
            interval = 60;
            height = 30;
            width = 30;
            icon = true;
          };
          "custom/power" = {
            format = "⏻";
            tooltip = true;
            tooltip-format = "Powermenu";
            on-click = "$HOME/.bin/powermenu";
          };
          "tray" = {
            show-passive-items = true;
            icon-size = 12;
            spacing = 8;
          };
          "backlight" = {
            format = "{icon} {percent}%";
            format-icons = [ "󰃞" ];
            on-click = "$HOME/.bin/brightness";
          };
        };
      };

      style = # css
        ''
          @define-color base   #1e1e2e;
          @define-color mantle #181825;
          @define-color crust  #11111b;

          @define-color text     #cdd6f4;
          @define-color subtext0 #a6adc8;
          @define-color subtext1 #bac2de;

          @define-color surface0 #313244;
          @define-color surface1 #45475a;
          @define-color surface2 #585b70;

          @define-color overlay0 #6c7086;
          @define-color overlay1 #7f849c;
          @define-color overlay2 #9399b2;

          @define-color blue      #89b4fa;
          @define-color lavender  #b4befe;
          @define-color sapphire  #74c7ec;
          @define-color sky       #89dceb;
          @define-color teal      #94e2d5;
          @define-color green     #a6e3a1;
          @define-color yellow    #f9e2af;
          @define-color peach     #fab387;
          @define-color maroon    #eba0ac;
          @define-color red       #f38ba8;
          @define-color mauve     #cba6f7;
          @define-color pink      #f5c2e7;
          @define-color flamingo  #f2cdcd;
          @define-color rosewater #f5e0dc;


          * {
          font-family: JetBrains Mono Nerd Font;
          font-size: 14px;
          }

          window#waybar {
          background-color: @surface0;
          color: #ffffff;
          transition-property: background-color;
          transition-duration: 0s;
          }

          window#waybar.hidden {
          opacity: 0.2;
          }


          window#waybar.termite {
          }

          window#waybar.chromium {
          border: none;
          }

          button {
          box-shadow: inset 0 -3px transparent;
          border: none;
          border-radius: 0;
          }

          #workspaces button {
          padding: 0 5px;
          color: @peach;
          margin: 2px;
          font-weight: bold;
          }

          #workspaces button.active {
          background-color: @peach;
          color: @base;
          }
          #workspaces button:hover {
          background-color: @peach;
          color: @base;
          }
          #workspaces button.active:hover {
          color: @peach;
          }
          #workspaces button.hidden {
          color: @pink;
          }

          #clock,
          #battery,
          #cpu,
          #memory,
          #temperature,
          #network,
          #pulseaudio,
          #keyboard-state,
          #mpd,
          #backlight {
          padding: 0 8px;
          color: @peach;
          font-weight: bold;
          }

          #network {
          color: @sky;
          }

          #backlight {
          color: @green;
          }

          #memory {
          color: @yellow;
          }

          #custom-power {
          color: @red;
          font-weight: bold;
          padding: 0 15px;
          margin: 0 5px;
          }

          #user,
          #window,
          #workspaces,
          #custom-updates,
          #custom-media {
          margin: 0 4px;
          background-color: transparent;
          font-weight: bold;
          padding: 0 10px;
          color: @peach;
          }

          #user,
          #window,
          #custom-updates {
          }

          #user {
          color: @green;
          }

          #user.1 {
          margin-right: 0;
          padding-right: 5px;
          }

          #custom-updates {
          margin-left: 0;
          padding-left: 5px;
          color: @sky;
          }

          #custom-media {
          min-width: 100px;
          color: @mauve;
          }

          /* If workspaces is the leftmost module, omit left margin */
          .modules-left > widget:first-child > #workspaces {
          margin-left: 0;
          }

          /* If workspaces is the rightmost module, omit right margin */
          .modules-right > widget:last-child > #workspaces {
          margin-right: 0;
          }

          #clock {
          color: @sky;
          }

          @keyframes blink {
          to {
          background-color: #ffffff;
          color: #000000;
          }
          }

          label:focus {
          }

          #network.disconnected {
          background-color: #f53c3c;
          }

          #pulseaudio {
          padding-right: 0;
          color: @pink;
          }

          #pulseaudio.muted {
          background-color: #90b1b1;
          color: #2a5c45;
          }

          #temperature.critical {
          background-color: #eb4d4b;
          }

          #temperature {
          color: @green;
          }

          #keyboard-state {
          padding: 0 0px;
          min-width: 16px;
          color: @mauve;
          }

          #keyboard-state > label {
          padding: 0 5px;
          }

          #tray {
          padding: 0 10px;
          margin: 0 5px;
          }

          #tray.empty {
          background-color: transparent;
          }
        '';

    };

  };
}
