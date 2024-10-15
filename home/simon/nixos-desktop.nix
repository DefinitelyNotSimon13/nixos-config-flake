{ config, ... }:
{
  imports = [
    ./home.nix
    ../common
    ../features
  ];
}
