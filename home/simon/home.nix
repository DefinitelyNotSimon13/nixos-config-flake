{
  config,
  pkgs,
  inputs,
  ...
}:
let
  firefoxAddon = inputs.firefox-addons.packages."x86_64-linux";
in
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
  home.packages = with pkgs; [
    cliphist
    edit-config
    sops
    fzf
    gcc
    gh
    git-credential-manager
    gnumake
    gnupg
    openssl
    grim
    hyprcursor
    jetbrains-toolbox
    kitty
    nixd
    docker-compose
    nixfmt-rfc-style
    pass
    networkmanagerapplet
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

  services = {
    dunst = {
      enable = true;
    };
  };

  programs = {
    # Let Home Manager install and manage itself.
    home-manager = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    firefox = {
      enable = true;
      profiles.simon = {
        bookmarks = { };

        settings = { };

        extensions = with firefoxAddon; [
          ublock-origin
          firefox-color
          stylus
        ];

        search.engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
        };
        search.force = true;
      };
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

    lazygit = {
      enable = true;
      catppuccin = {
        enable = true;
        accent = "peach";
        flavor = "mocha";
      };
    };

  };

}
