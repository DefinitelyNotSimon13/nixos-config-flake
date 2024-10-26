{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "networkConfig";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";

    hostName = lib.mkOption {
      description = ''
        host name
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    networking = {
      hostName = cfg.hostName; # Define your hostname.

      networkmanager.enable = true; # Easiest to use and most distros use this by default.
      wireless.enable = false; # Enables wireless support via wpa_supplicant.

      firewall.enable = true;
      firewall.allowedTCPPorts = [ 22 ];
    };
  };
}
