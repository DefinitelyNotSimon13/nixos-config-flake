{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.alacritty;

in
{
  options.dotfiles.alacritty = {
    enable = mkEnableOption "enables alacritty";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/alacritty" = {
          source = "${inputs.dotfiles}/alacritty";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/alacritty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/alacritty";
      })
    ];
  };
}
