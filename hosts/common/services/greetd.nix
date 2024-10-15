{ pkgs, ... }:
{
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
    };
  };
}
