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
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    cliphist
    cmake
    curl
    dunst
    edit-config
    eza
    firefox
    fzf
    gcc
    gh
    git-credential-manager
    gnumake
    gnupg
    grim
    hyprcursor
    hypridle
    hyprpaper
    jetbrains-toolbox
    kitty
    lazygit
    nh
    nixd
    nixfmt-rfc-style
    pass
    pinentry-tty
    plantuml
    python3
    rebuild
    ripgrep
    sl
    slurp
    spotify
    testscript
    thefuck
    tldr
    tmux
    unzip
    viewnior
    vim
    vscode
    wget
    wl-clipboard
    xdg-utils
    xorg.xrandr
    yazi
    zathura
    zoxide
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/simon/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # wayland.windowManager.hyprland.enable = true;
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

  gtk.enable = true;
  qt.enable = true;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
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

    btop.enable = true;
    waybar.enable = true;
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
    };

  };

}
