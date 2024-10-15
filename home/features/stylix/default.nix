{
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.features.stylix;
in
{
  options.features.stylix = {
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
