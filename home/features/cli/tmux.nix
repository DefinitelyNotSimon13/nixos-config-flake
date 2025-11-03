{ lib, config, ... }:
with lib;
let cfg = config.features.cli.tmux;
in {
  options.features.cli.tmux = { enable = mkEnableOption "enables tmux"; };

  config = mkIf cfg.enable { programs.tmux = { enable = false; }; };
}
