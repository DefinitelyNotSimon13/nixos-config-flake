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
    };

    stylix.enable = true;
  };
}
