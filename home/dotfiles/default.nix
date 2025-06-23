{ lib, inputs, ... }:
{
  imports = [
    ./nvim.nix
    ./alacritty.nix
    ./dunst.nix
    ./i3.nix
    ./ideavim.nix
    ./kitty.nix
    ./neofetch.nix
    ./oh-my-posh.nix
    ./picom.nix
    ./polybar.nix
    ./rofi.nix
    ./tmux.nix
    ./wallpapers.nix
    ./zathura.nix
    ./ghostty.nix
  ];

  dotfiles = {
    alacritty = {
      enable = lib.mkDefault true;
    };
    dunst = {
      enable = lib.mkDefault true;
    };
    picom = {
      enable = lib.mkDefault false;
    };
    polybar = {
      enable = lib.mkDefault false;
    };
    i3 = {
      enable = lib.mkDefault false;
    };
    ideavim = {
      enable = lib.mkDefault true;
    };
    kitty = {
      enable = lib.mkDefault true;
    };
    neofetch = {
      enable = lib.mkDefault true;
    };
    oh-my-posh = {
      enable = lib.mkDefault true;
    };
    rofi = {
      enable = lib.mkDefault true;
    };
    tmux = {
      enable = lib.mkDefault true;
    };
    wallpapers = {
      enable = lib.mkDefault true;
    };
    zathura = {
      enable = lib.mkDefault true;
    };
    nvim = {
      enable = lib.mkDefault true;
      symlink = lib.mkDefault true;
    };
    ghostty = {
      enable = lib.mkDefault true;
    };
  };

  home.file.".config/firefox/import.json".source = "${inputs.dotfiles}/firefox/import.json";
}
