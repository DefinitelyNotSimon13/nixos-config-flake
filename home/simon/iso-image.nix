{ ... }:
{
  imports = [
    ./home.nix
    ../dotfiles
    ../common
    ../features
    ../other
  ];

  services = {
    dunst.enable = false;
  };

  programs = {
    firefox.enable = false;
  };

  other.packages.enable = false;

  dotfiles = {
    alacritty = {
      enable = false;
    };
    dunst = {
      enable = false;
    };
    ideavim = {
      enable = false;
    };
    kitty = {
      enable = false;
    };
    rofi = {
      enable = false;
    };
    wallpapers = {
      enable = false;
    };
    zathura = {
      enable = false;
    };
  };

  features = {
    desktop = {
      wayland.enable = false;
      waybar.enable = false;
      hyprland.enable = false;
      hyprpaper.enable = false;
      hypridle.enable = false;
      hyprlock.enable = false;
      fonts.enable = false;
    };
  };

}
