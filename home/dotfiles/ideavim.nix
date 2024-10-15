{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.ideavim;

in
{
  options.dotfiles.ideavim = {
    enable = mkEnableOption "enables ideavim";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".ideavimrc" = {
          source = "${inputs.dotfiles}/ideavimrc";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/ideavimrc";
      })
    ];
  };
}
