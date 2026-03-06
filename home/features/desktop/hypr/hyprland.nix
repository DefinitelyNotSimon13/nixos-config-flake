{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.features.desktop.hyprland;
  mkIfElse = p: yes: no: mkMerge [ (mkIf p yes) (mkIf (!p) no) ];
in {
  options.features.desktop.hyprland = {
    enable = mkEnableOption "enables desktop.hyprland";
    packagelessMode = mkEnableOption "dont use a nixpkg";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [ hyprcursor ];

    home.file.".local/share/icons/catppuccin-mocha-dark-cursors" = {
      source =
        "${pkgs.catppuccin-cursors.mochaDark}/share/icons/catppuccin-mocha-dark-cursors";
      recursive = true;
    };

    wayland.windowManager.hyprland = {
      package = null;
      # package = mkIfElse cfg.packagelessMode {
      #   null
      # } {
      #   pkgs.hyprland
      #   };
      enable = true;
      extraConfig = "";
      settings = {
        cursor = {
          inactive_timeout = 3;
          no_hardware_cursors = true;
        };

        xwayland = { force_zero_scaling = true; };
        exec-once = [
          "quickshell"
          "hypridle"
          "hyprpaper"
          "wl-paste --watch cliphist store"
          "hyprctl setcursor catppuccin-mocha-dark-cursors 24"
          "GTK_IM_MODULE=simple nixGL ghostty"
          "goxlr-daemon"
          "ibus start --type wayland"
          "udiskie"
        ];

        env = [ "WLR_NO_HARDWARE_CURSORS,1" "QT_QPA_PLATFORMTHEME,qt6ct" ];

        input = {
          kb_layout = "de";
          kb_options = "caps:swapescape";
          follow_mouse = 1;
          touchpad.natural_scroll = true;
          sensitivity = 0;
        };

        general = {
          allow_tearing = false;
          gaps_workspaces = 0;
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          # "col.inactive_border" = lib.mkForce "rgba(707070ff)";
          # "col.active_border" = lib.mkForce "rgba(d0d0d0ff)";
          layout = "dwindle";
          resize_on_border = true;
        };

        decoration = {
          rounding = 20;
          rounding_power = 2;
          active_opacity = 1.0;
          inactive_opacity = 0.98;
          blur = {
            enabled = true;
            size = 3;
            passes = 2;
            vibrancy = 0.1696;
          };

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            # offset = "0 5";
            color = lib.mkForce "rgba(1a1a1aee)";
          };
        };

        layerrule = {
          name = "noctalia";
          "match:namespace" = "noctalia-background-.*$";
          ignore_alpha = 0.5;
          blur = true;
          blur_popups = true;
        };

        animations = {
          enabled = true;
          animation = [
            "windowsIn, 1, 3, default"
            "windowsOut, 1, 3, default"
            "workspaces, 1, 5, default"
            "windowsMove, 1, 4, default"
            "fade, 1, 3, default"
            "border, 1, 3, default"
          ];
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = { };

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, RETURN, exec, ghostty +new-window"
          "$mainMod, SPACE, exec, qs -c noctalia-shell ipc call controlCenter toggle"
          "$mainMod, comma, exec, qs -c noctalia-shell ipc call settings toggle"
          "$mainMod SHIFT, V, exec, qs -c noctalia-shell ipc call launcher clipboard"
          "$mainMod SHIFT, E, exec, qs -c noctalia-shell ipc call launcher emoji"
          "$mainMod SHIFT, P, exec, qs -c noctalia-shell ipc call sessionMenu toggle"
          "$mainMod, L, exec, qs -c noctalia-shell ipc call lockScreen lock"
          "$mainMod, Q, exec, brave"
          "$mainMod, C, killactive,"
          "$mainMod SHIFT, M, exit,"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          "$mainMod, P, pseudo,"
          "$mainMod, J, togglesplit,"
          "$mainMod, F, fullscreen, 0"
          "$mainMod SHIFT, S, exec, spotify"
          "$mainMod, h, movefocus, l"
          "$mainMod, l, movefocus, r"
          "$mainMod, k, movefocus, u"
          "$mainMod, j, movefocus, d"
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"
          "$mainMod, 0, workspace, 10"
          "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
          "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
          "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
          "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
          "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
          "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
          "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
          "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
          "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
          "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"
          "$mainMod SHIFT, H, movewindow, l"
          "$mainMod SHIFT, L, movewindow, r"
          "$mainMod SHIFT, K, movewindow, u"
          "$mainMod SHIFT, J, movewindow, d"
          "$mainMod SHIFT, right, resizeactive, 10 0"
          "$mainMod SHIFT, left, resizeactive, -10 0"
          "$mainMod SHIFT, up, resizeactive, 0 -10"
          "$mainMod SHIFT, down, resizeactive, 0 10"
          "$mainMod, code:123, exec, playerctl volume 1"

          ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86MonBrightnessUp, exec, brightnessctl --class=backlight set +5%"
          ", XF86MonBrightnessDown, exec, brightnessctl --class=backlight set 5%-"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioStop, exec, playerctl stop"
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPrev, exec, playerctl previous"

        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindr = [
          "$mainMod, SUPER_L, exec, qs -c noctalia-shell ipc call launcher toggle"
        ];

        # gestures = {
        #   workspace_swipe = true;
        #   workspace_swipe_fingers = 4;
        # };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          focus_on_activate = true;
          vrr = 1;
        };

      };

    };
  };
}
