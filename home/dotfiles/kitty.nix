{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.kitty;

in
{
  options.dotfiles.kitty = {
    enable = mkEnableOption "enables kitty";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/kitty" = {
          source = "${inputs.dotfiles}/kitty";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/kitty";
      })
    ];
  };
}
