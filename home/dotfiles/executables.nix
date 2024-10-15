{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.executables;

in
{
  options.dotfiles.executables = {
    enable = mkEnableOption "enables executables";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".bin" = {
          source = "${inputs.dotfiles}/executables";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".bin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/executables";
      })
    ];
  };
}
