{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.wallpapers;

in
{
  options.dotfiles.wallpapers = {
    enable = mkEnableOption "enables wallpapers";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        "Pictures/wallpapers" = {
          source = "${inputs.dotfiles}/wallpapers";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        "Pictures/wallpapers".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wallpapers";
      })
    ];
  };
}
