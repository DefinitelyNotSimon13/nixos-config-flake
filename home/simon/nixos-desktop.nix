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
    };
    stylix.enable = true;
  };
}
