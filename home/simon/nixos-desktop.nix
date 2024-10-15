{ config, ... }:
{
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/stylix
  ];

  features = {
    cli = {
      zsh.enable = true;
      neofetch.enable = true;
      fzf.enable = true;
    };
    stylix.enable = true;
  };
}
