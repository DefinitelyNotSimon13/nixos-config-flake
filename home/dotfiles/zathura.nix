{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.zathura;

in
{
  options.dotfiles.zathura = {
    enable = mkEnableOption "enables zathura";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/zathura" = {
          source = "${inputs.dotfiles}/zathura";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/zathura".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zathura";
      })
    ];
  };
}
