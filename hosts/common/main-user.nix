{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable main-user module";

    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };

    initialPassword = lib.mkOption {
      default = "password";
      description = ''
        initial password
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.defaultUserShell = pkgs.zsh;

    users.users.${cfg.userName} = {
      initialPassword = "${cfg.initialPassword}";
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
      ]; # Enable ‘sudo’ for the user.
      useDefaultShell = true;
    };
  };
}
