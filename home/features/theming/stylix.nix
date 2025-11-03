{ lib, config, pkgs, ... }:
with lib;
let cfg = config.features.theming.stylix;
in {
  options.features.theming.stylix = {
    enable = mkEnableOption "enable stylix";
  };

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      base16Scheme =
        "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

      targets = { tmux.enable = false; };
    };
  };
}
