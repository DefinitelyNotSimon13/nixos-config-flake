{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.ghostty;

in
{
  options.dotfiles.ghostty = {
    enable = mkEnableOption "enables ghostty";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/ghostty" = {
          source = "${inputs.dotfiles}/ghostty";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/ghostty".source =
          config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/ghostty";
      })
    ];
  };
}
