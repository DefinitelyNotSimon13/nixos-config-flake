{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "catppuccinConfig";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    catppuccin = {
      grub.enable = true;
      enable = lib.mkDefault true;
      accent = "peach";
      flavor = "mocha";
    };
  };
}
