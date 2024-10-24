{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./neofetch.nix
    ./fzf.nix
    ./tmux.nix
  ];

  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
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
