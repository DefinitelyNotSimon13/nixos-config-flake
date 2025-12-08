{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.hyprland;
  mkIfElse = p: yes: no: mkMerge [ (mkIf p yes) (mkIf (!p) no) ];
in
{
  options.features.desktop.hyprland = {
    enable = mkEnableOption "enables desktop.hyprland";
    packagelessMode = mkEnableOption "dont use a nixpkg";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprcursor
    ];

    home.file.".local/share/icons/catppuccin-mocha-dark-cursors" = {
      source = "${pkgs.catppuccin-cursors.mochaDark}/share/icons/catppuccin-mocha-dark-cursors";
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
      extraConfig = ''
        windowrulev2=noblur,class:^()$,title:^()$
      '';
      settings = {
        cursor = {
          inactive_timeout = 3;
          no_hardware_cursors = true;
        };

        xwayland = {
          force_zero_scaling = true;
        };
        exec-once = [
          "waybar"
          "dunst"
          "hypridle"
          "hyprpaper"
          "wl-paste --watch cliphist store"
          "hyprctl setcursor catppuccin-mocha-dark-cursors 24"
          "goxlr-daemon"
        ];

        env = [
          "WLR_NO_HARDWARE_CURSORS,1"
          "LIBVA_DRIVER_NAME,nvidia"
          "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        ];

        input = {
          kb_layout = "de";
          kb_options = "caps:swapescape";
          follow_mouse = 1;
          touchpad.natural_scroll = true;
          sensitivity = 0;
        };

        general = {
          gaps_in = 0;
          gaps_out = 0;
          border_size = 2;
          "col.active_border" = lib.mkForce "rgba(fab387ff)";
          "col.inactive_border" = lib.mkForce "rgba(595959ff)";
          layout = "dwindle";
          resize_on_border = true;
        };

        decoration = {
          rounding = 0;
          blur = {
            enabled = true;
            size = 8;
            passes = 3;
            new_optimizations = true;
          };
        };

        animations = {
          enabled = false;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        master = { };

        "$mainMod" = "SUPER";

        bind = [
          "$mainMod, RETURN, exec, ghostty"
          "$mainMod SHIFT, RETURN, exec, alacritty -e tmux"
          "$mainMod, Q, exec, io.github.zen_browser.zen"
          "$mainMod, C, killactive,"
          "$mainMod SHIFT, P, exec, ~/.config/rofi/bin/powermenu.sh"
          "$mainMod SHIFT, M, exit,"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating,"
          "$mainMod, P, pseudo,"
          "$mainMod, R, exec, exec ~/.config/rofi/bin/runner.sh"
          "$mainMod, A, exec, exec ~/.config/rofi/bin/drawer.sh"
          "$mainMod, S, exec, exec ~/.config/rofi/bin/screenshot.sh"
          "$mainMod, J, togglesplit,"
          "$mainMod, F, fullscreen, 0"
          "$mainMod SHIFT, S, exec, spotify"
          "$mainMod SHIFT, V, exec, ~/.config/rofi/bin/volume.sh"
          "$mainMod, B, exec, ~/.config/rofi/bin/brightness"
          "$mainMod SHIFT, B, exec, ~/.config/rofi/bin/battery.sh"
          "$mainMod, M, exec, ~/.config/rofi/bin/mpd.sh"
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

        ];

        bindm = [
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"
        ];

        bindr = [
          "$mainMod, SUPER_L, exec, ~/.config/rofi/bin/launcher.sh"
        ];

        # gestures = {
        #   workspace_swipe = true;
        #   workspace_swipe_fingers = 4;
        # };

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
