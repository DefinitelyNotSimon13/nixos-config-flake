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
    networking.hostName = cfg.hostName; # Define your hostname.
    # Pick only one of the below networking options.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

    networking.firewall.enable = lib.mkForce false;
    # networking.firewall.allowedTCPPorts = [ 22 ];
  };
}
