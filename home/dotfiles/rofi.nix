{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.rofi;

in
{
  options.dotfiles.rofi = {
    enable = mkEnableOption "enables rofi";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/rofi" = {
          source = "${inputs.dotfiles}/rofi";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/rofi";
      })
    ];
  };
}
