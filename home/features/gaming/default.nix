{ home, pkgs, ... }:
{
  imports =
    [
    ];

  home.packages = with pkgs; [
    mangohud
    protonup
  ];

}
