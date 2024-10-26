{
  pkgs,
  lib,
  config,
  home,
  ...
}:
let
  moduleName = "cosmicDesktop";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {

    greetdConfig.enable = lib.mkForce true;

    services.desktopManager.cosmic.enable = false;
    services.displayManager.cosmic-greeter.enable = false;

  };
}
