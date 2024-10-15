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
    enableZshIntegration = true;
  };

  programs.btop = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.thefuck = {
    enable = true;
    enableZshIntegration = true;
  };
}
