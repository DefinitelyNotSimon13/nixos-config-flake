{ lib, ... }:
{
  imports = [
    ./cli
    ./desktop
    ./stylix
  ];

  features = {
    cli = {
      zsh.enable = lib.mkDefault true;
      neofetch.enable = lib.mkDefault true;
      fzf.enable = lib.mkDefault true;
      tmux.enable = lib.mkDefault true;
    };

    desktop = {
      wayland.enable = lib.mkDefault true;
      waybar.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      hyprpaper.enable = lib.mkDefault true;
      hypridle.enable = lib.mkDefault true;
      hyprlock.enable = lib.mkDefault true;
      fonts.enable = lib.mkDefault true;
    };

    stylix.enable = lib.mkDefault true;
  };
}
