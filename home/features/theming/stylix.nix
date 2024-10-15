{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.theming.stylix;
in
{
  options.features.theming.stylix = {
    enable = mkEnableOption "enables stylix";
  };

  config = mkIf cfg.enable {
    stylix = {
      enable = true;
      targets = {
        neovim.enable = false;
        rofi.enable = false;
        waybar.enable = false;
        tmux.enable = false;
      };
    };

  };
}
