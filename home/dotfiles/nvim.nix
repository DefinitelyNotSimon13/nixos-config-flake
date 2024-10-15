{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.nvim;

in
{
  options.dotfiles.nvim = {
    enable = mkEnableOption "enables nvim";

    symlink = mkOption {
      description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
      default = false;
      type = lib.types.bool;
    };
  };

  config = mkIf cfg.enable {
    home.file = mkMerge [
      (mkIf (!cfg.symlink) {
        ".config/nvim" = {
          source = "${inputs.dotfiles}/nvim";
          recursive = true;
        };
      })
      (mkIf (cfg.symlink) {
        ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
      })
    ];
  };
}
