{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.tmux;

in
{
  options.dotfiles.tmux = {
    enable = mkEnableOption "enables tmux";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/tmux" = {
          source = "${inputs.dotfiles}/tmux";
          recursive = true;
        };

        ".tmux/plugins/tpm" = {
          source = "${inputs.dotfiles}/dot-tmux/tpm";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/tmux".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/tmux";
        ".tmux/plugins/tpm".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homDirectory/dotfiles/dot-tmux/tpm}";
      })
    ];
  };
}
