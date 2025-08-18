{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.dunst;

in
{
  options.dotfiles.dunst = {
    enable = mkEnableOption "enables dunst";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/dunst" = {
          source = "${inputs.dotfiles}/dunst";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/dunst".source =
          config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/dunst";
      })
    ];
  };
}
