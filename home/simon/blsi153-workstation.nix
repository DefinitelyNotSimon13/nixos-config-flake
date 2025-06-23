{ pkgs, ... }:
{
  imports = [
    ./home.nix
    ../dotfiles
    ../common
    ../features
    ../other
  ];

  targets.genericLinux.enable = true;

  features.theming.catppuccin.enable = false;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    neovim
  ];

  dotfiles.i3 = {
    enable = false;
  };

}
