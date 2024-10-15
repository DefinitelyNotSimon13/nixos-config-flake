{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.i3;

in
{
  options.dotfiles.i3 = {
    enable = mkEnableOption "enables i3";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/i3" = {
          source = "${inputs.dotfiles}/i3";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/i3".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/i3";
      })
    ];

    dotfiles = {
      picom.enable = mkDefault true;
      polybar.enable = mkDefault true;
    };
  };
}
