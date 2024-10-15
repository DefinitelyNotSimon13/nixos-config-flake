{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.REPLACE;

in
{
  options.dotfiles.REPLACE = {
    enable = mkEnableOption "enables REPLACE";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = true;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/REPLACE" = {
          source = "${inputs.dotfiles}/REPLACE";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/REPLACE" = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/REPLACE";
      })
    ];
  };
}
