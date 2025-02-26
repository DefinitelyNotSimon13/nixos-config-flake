{ lib, ... }:
with lib;
{
  imports = [
    ./cli
    ./desktop
    ./theming
    ./gaming
  ];

  features = {
    
    cli = {
      zsh.enable = mkDefault true;
      neofetch.enable = mkDefault true;
      fzf.enable = mkDefault true;
      tmux.enable = mkDefault true;
    };

    desktop = {
      wayland.enable = mkDefault true;
      waybar.enable = mkDefault true;
      hyprland.enable = mkDefault true;
      hyprpaper.enable = mkDefault true;
      hypridle.enable = mkDefault true;
      hyprlock.enable = mkDefault true;
      fonts.enable = mkDefault true;
    };

    theming = {
      catppuccin.enable = mkDefault true;
      qt.enable = mkDefault true;
      gtk.enable = mkDefault true;
    };

  };
}
