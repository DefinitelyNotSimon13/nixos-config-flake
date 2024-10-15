{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ../common
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  home.username = "simon";
  home.homeDirectory = "/home/simon";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    cliphist
    dunst
    edit-config
    firefox
    fzf
    gcc
    gh
    git-credential-manager
    gnumake
    gnupg
    grim
    hyprcursor
    jetbrains-toolbox
    kitty
    lazygit
    nixd
    nixfmt-rfc-style
    pass
    pinentry-tty
    plantuml
    python3
    rebuild
    ripgrep
    sl
    spotify
    testscript
    viewnior
    vscode
    wget
    xdg-utils
    xorg.xrandr
    zathura
  ];

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/dotfiles/nixos";
  };

  gtk.enable = true;
  qt.enable = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager = {
      enable = true;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
      viAlias = true;
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };

    waybar.enable = true;
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };

  };

}
