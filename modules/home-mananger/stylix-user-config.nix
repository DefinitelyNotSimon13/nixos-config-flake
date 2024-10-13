{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "stylixUserConfig";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      targets = {
        neovim.enable = false;
        alacritty.enable = true;
      };
    };

  };
}
