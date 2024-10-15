{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
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

    thefuck = {
      enable = true;
      enableZshIntegration = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    coreutils
    fd
    jq
    procs
    ripgrep
    tldr
    zip
    unzip
    nh
    tmux
  ];
}
