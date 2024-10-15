{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.neofetch;

in
{
  options.dotfiles.neofetch = {
    enable = mkEnableOption "enables neofetch";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/neofetch" = {
          source = "${inputs.dotfiles}/neofetch";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/neofetch".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/neofetch";
      })
    ];
  };
}
