{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.desktop.hyprland;
in
{
  options.features.desktop.hyprland = {
    enable = mkEnableOption "enables desktop.hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {

        monitor = [
          ",preferred,auto,auto"
          "eDP-1, preferred, auto, 1.2"
          "DP-1, 1920x1080@60, 0x0, 1"
          "DP-2 , 1920x1080@60, -1920x0000, 1"
          "DP-3, 1920x1080@60, 1920x-700, 1, transform, 3"
        ];
        xwayland = {
          force_zero_scaling = true;
        };
        exec-once = [
          "waybar"
          "dunst"
          "hypridle"
          "hyprpaper"
          "wl-paste --watch cliphist store"
        ];

        env = [
          "XCURSOR_SIZE,32"
          "WLR_NO_HARDWARE_CURSORS,1"
        ];

        input = {
          kb_layout = "de";
          kb_variant = "";
          kb_model = "";
          kb_rules = "";
          kb_options = "caps:swapescape";
          follow_mouse = 1;
          touchpad.natural_scroll = true;
          sensitivity = 0;
        };

        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 2;
          "col.active_border" = lib.mkForce "rgb (fab387)";
          "col.inactive_border" = lib.mkForce "rgb (595959)";
          layout = "dwindle";
          resize_on_border = true;
        };

        cursor = {
          inactive_timeout = 3;
        };

        decoration = {
          rounding = 0;
          blur = {
            enabled = true;
            size = 8;
            passes = 3;
            new_optimizations = true;
          };
          drop_shadow = false;
          shadow_range = 0;
          shadow_render_power = 0;
          "col.shadow" = lib.mkForce "rgba(1a1a1aee)";
        };

        animations = {
          enabled = false;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
          no_gaps_when_only = 0;
        };

        master = { };

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, RETURN, exec, kitty"
          "$mainMod SHIFT, RETURN, exec, alacritty -e tmux"
          "$mainMod, Q, exec, zen-browser"
          "$mainMod, C, killactive,"
          "$mainMod SHIFT, P, exec, ~/.bin/powermenu"
          "$mainMod SHIFT, M, exit,"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          "$mainMod, P, pseudo,"
          "$mainMod, R, exec, exec ~/.bin/runner"
          "$mainMod, A, exec, exec ~/.bin/drawer"
          "$mainMod, S, exec, exec ~/.bin/screenshot"
          "$mainMod, J, togglesplit,"
          "$mainMod, F, fullscreen, 0"
          "$mainMod SHIFT, S, exec, spotify-launcher"
          "$mainMod SHIFT, V, exec, $HOME/.bin/volume"
          "$mainMod, B, exec, $HOME/.bin/brightness"
          "$mainMod SHIFT, B, exec, $HOME/.bin/battery"
          "$mainMod, M, exec, $HOME/.bin/mpd"
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
          ", code:123, exec, playerctl volume 0.1+"
          "$mainMod, code:123, exec, playerctl volume 1"
          ", code:122, exec, playerctl volume 0.1-"
          ", code:121, exec, playerctl volume 0"
          ", code:172, exec, playerctl play-pause"
          ", code:171, exec, playerctl next"
          ", code:173, exec, playerctl previous"
          ", code:174, exec, playerctl shuffle Toggle"
        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindr = [
          "$mainMod, SUPER_L, exec, ~/.bin/launcher"
        ];

        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 4;
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          focus_on_activate = true;
          new_window_takes_over_fullscreen = 2;
        };
      };

    };
  };
}
