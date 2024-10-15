{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.picom;

in
{
  options.dotfiles.picom = {
    enable = mkEnableOption "enables picom";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/picom" = {
          source = "${inputs.dotfiles}/picom";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/picom".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/picom";
      })
    ];
  };
}
