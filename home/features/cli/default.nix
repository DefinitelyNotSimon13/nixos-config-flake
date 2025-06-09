{ pkgs, lib, ... }:
{
  imports = [
    ./zsh.nix
    ./neofetch.nix
    ./fzf.nix
    ./tmux.nix
  ];

  programs = {
    helix = {
      enable = true;
      settings = {
        theme = lib.mkForce "catppuccin_mocha";
        editor.cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        editor.indent-guides = {
          render = true;
        };
      };
      languages.language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
      ];
    };
    wezterm = {
      enable = true;
      enableZshIntegration = true;
      extraConfig = # lua
        ''
          return {
            enable_wayland = false
          }
        '';
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      enableTransience = true;
      # settings = lib.mkForce # toml
      #   '''';
    };

    oh-my-posh = {
      enable = false;
      enableZshIntegration = false;
    };

    eza = {
      enable = true;
      enableZshIntegration = true;
    };

    yazi = {
      enable = true;
      enableZshIntegration = true;
    };

    bat = {
      enable = true;
    };

    btop = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    coreutils-full
    fd
    jq
    procs
    ripgrep
    tldr
    killall
    zip
    unzip
    nh
  ];
}
