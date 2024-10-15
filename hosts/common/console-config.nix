{
  pkgs,
  lib,
  config,
  ...
}:
let
  moduleName = "consoleConfig";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    console = {
      earlySetup = true;
      packages = with pkgs; [ terminus_font ];
      font = "ter-u28n";
      useXkbConfig = true; # use xkb.options in tty.
      colors = [
        "1e1e2e"
        "f38ba8"
        "fab387"
        "a6e3a1"
        "89b4fa"
        "cba6f7"
        "89dceb"
        "cdd6f4"
        "313244"
        "eba0ac"
        "f9e2af"
        "94e2d5"
        "74c7ec"
        "b4befe"
        "94e2d5"
        "bac2de"
      ];
    };

  };
}
