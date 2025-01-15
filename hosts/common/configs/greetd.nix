{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "greetdConfig";
  cfg = config."${moduleName}";
in
{

  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = ''
            ${pkgs.greetd.tuigreet}/bin/tuigreet \
              --time \
              --remember \
              --greeting "Welcome to NixOS!" \
              --greet-align center \
              --cmd Hyprland \
              --theme "border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black"
          '';
          user = "greeter";
        };
        initial_session = {
          command = "Hyprland";
          user = "simon";

        };
      };
    };
  };
}
