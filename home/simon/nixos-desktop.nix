{ config, ... }:
{
  imports = [
    ./home.nix
    ../common
    ../features
  ];

  features = {
    cli = {
      zsh.enable = true;
    };
    stylix.enable = true;
  };
}
