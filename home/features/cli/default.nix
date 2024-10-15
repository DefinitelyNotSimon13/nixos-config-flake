{ pkgs, ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.bat = {
    enable = true;
  };

  programs.btop = {
    enable = true;
  };

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    coreutils
    fd
    jq
    procs
    ripgrep
    tldr
    zip
  ];
}
