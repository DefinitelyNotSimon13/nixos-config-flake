{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.oh-my-posh;

in
{
  options.dotfiles.oh-my-posh = {
    enable = mkEnableOption "enables oh-my-posh";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/oh-my-posh" = {
          source = "${inputs.dotfiles}/oh-my-posh";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/oh-my-posh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/oh-my-posh";
      })
    ];
  };
}
