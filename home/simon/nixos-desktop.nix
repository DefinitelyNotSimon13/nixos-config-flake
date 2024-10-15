{ config, ... }:
{
  imports = [
    ./home.nix
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
    };

    stylix.enable = true;
  };
}
