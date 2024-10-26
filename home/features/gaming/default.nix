{ home, pkgs, ... }:
{
  imports =
    [
    ];

  home.packages = with pkgs; [
    mangohud
    protonup
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

}
