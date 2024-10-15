{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "shells";
  cfg = config."${moduleName}";
in
{

  imports = [
    ./shell/zsh-config.nix
  ];

  options."${moduleName}" = {
    zshConfig = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "enables the zsh config";
    };
  };

  config = lib.mkIf cfg.zshConfig {
    zshConfig.enable = true;
  };
}
