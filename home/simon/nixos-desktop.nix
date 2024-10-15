{ config, ... }:
{
  imports = [
    ./home.nix
    ../dotfiles
    ../common
    ../features/cli
    ../features/stylix
    ../features/desktop
  ];

  features = {
    cli = {
      zsh.enable = true;
      neofetch.enable = true;
      fzf.enable = true;
      tmux.enable = true;
    };

    desktop = {
      wayland.enable = true;
      waybar.enable = true;
      hyprland.enable = true;
      hyprpaper.enable = true;
      hypridle.enable = true;
      hyprlock.enable = true;
      fonts.enable = true;
    };

    stylix.enable = true;
  };

  dotfiles = {
    alacritty = {
      enable = true;
    };
    dunst = {
      enable = true;
    };
    executables = {
      enable = true;
    };
    i3 = {
      enable = false;
    };
    ideavim = {
      enable = true;
    };
    kitty = {
      enable = true;
    };
    neofetch = {
      enable = true;
    };
    oh-my-posh = {
      enable = true;
    };
    rofi = {
      enable = false;
    };
    tmux = {
      enable = true;
    };
    wallpapers = {
      enable = true;
    };
    zathura = {
      enable = true;
    };
    nvim = {
    	enable = true;
    };
  };

  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        "DP-1, 1920x1080@60, 0x0, 1"
        "DP-2 , 1920x1080@60, -1920x0000, 1"
        "DP-3, 1920x1080@60, 1920x-700, 1, transform, 3"
      ];

      workspace = [
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-2"
        "5, monitor:DP-1"
        "6, monitor:DP-2"
        "7, monitor:DP-2"
      ];
    };
  };
}
