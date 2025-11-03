{ lib, config, ... }:
with lib;
let cfg = config.features.theming.qt;
in {
  options.features.theming.qt = {
    enable = mkEnableOption "enables qt theming";
  };

  config = mkIf cfg.enable {
    # home.packages = [
    #   pkgs.gruvbox-kvantum
    # ];
    #
    # qt = {
    #   enable = true;
    #   platformTheme.name = "qtct";
    #   style = {
    #     name = "kvantum";
    #   };
    # };
    #
    # xdg.configFile = {
    #   "Kvantum/kvantum.config".text = ''
    #     [General]
    #     theme=Gruvbox-Dark-Blue
    #   '';
    # };

  };
}
