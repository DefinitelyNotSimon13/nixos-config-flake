{ home, pkgs, ... }:
{
  imports =
    [
    ];

  home.packages = with pkgs; [
    mangohud
    protonup
  ];

  programs = {
    steam = {
      enable = true;
      gamescopeSession = true;
    };
    gamemode.enable = true;
  };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\\\${HOME}/.steam/root/compatibilitytools.d";
  };

}
