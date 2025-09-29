{
  inputs,
  lib,
  config,
  ...
}:
let
  moduleName = "sopsConfig";
  cfg = config."${moduleName}";
in
{

  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    sops.defaultSopsFile = ../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.secrets = {
    };

  };

}
