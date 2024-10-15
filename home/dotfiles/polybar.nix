{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.polybar;

in
{
  options.dotfiles.polybar = {
    enable = mkEnableOption "enables polybar";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/polybar" = {
          source = "${inputs.dotfiles}/polybar";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/polybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/polybar";
      })
    ];
  };
}
