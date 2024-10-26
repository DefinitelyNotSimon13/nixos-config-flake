{
  config,
  pkgs,
  inputs,
lib,
  ...
}:
{
  imports = [
    ../common
    inputs.catppuccin.homeManagerModules.catppuccin
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

  home.sessionVariables = {
    FLAKE = "${config.home.homeDirectory}/dotfiles/nixos";
  };

  services = {
    dunst = {
      enable = lib.mkDefault true;
    };
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager = {
      enable = lib.mkDefault true;
    };

    direnv = {
      enable = lib.mkDefault true;
      enableZshIntegration = lib.mkDefault true;
      nix-direnv.enable = lib.mkDefault true;
    };

    firefox = {
      enable = lib.mkDefault true;
    };

    neovim = {
      enable = lib.mkDefault true;
      defaultEditor = lib.mkDefault true;
      vimAlias = lib.mkDefault true;
      viAlias = lib.mkDefault true;
      withNodeJs = lib.mkDefault true;
      withPython3 = lib.mkDefault true;
      withRuby = lib.mkDefault true;
    };

    lazygit = {
      enable = lib.mkDefault true;
      catppuccin = {
        enable = lib.mkDefault true;
        accent = "peach";
        flavor = "mocha";
      };
    };

  };

}
