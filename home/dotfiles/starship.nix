{
  lib,
  config,
  inputs,
  ...
}:
with lib;
let
  cfg = config.dotfiles.starship;

in
{
  # options.dotfiles.starship = {
  #   enable = mkEnableOption "enables starship";
  #
  #   symlink = mkOption {
  #     description = "wether file is symlinked from config.home.homeDirectory/dotfiles or not";
  #     default = false;
  #     type = lib.types.bool;
  #   };
  # };
  #
  # config = mkIf cfg.enable {
  #   home.file = mkMerge [
  #     (mkIf (!cfg.symlink) {
  #       ".config/starship.toml" = {
  #         source = "${inputs.dotfiles}/starship.toml";
  #       };
  #     })
  #     (mkIf (cfg.symlink) {
  #       ".config/starship.toml".source =
  #         config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/starship.toml";
  #     })
  #   ];
  # };
}
