{
  pkgs,
  lib,
  config,
  home,
  ...
}:
let
  moduleName = "minecraftServer";
  cfg = config."${moduleName}";
in
{
  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    services.minecraft-server = {
      enable = true;
      eula = true;
      declarative = true;

      serverProperties = {
        "rcon.password" = "password";
        difficulty = "normal";
        enable-rcon = true;
        gamemode = "survival";
        max-players = 161;
        motd = "NixOS Minecraft server!";
        server-port = 25565;
        view-distance = 10;
        white-list = true;
      };

      whitelist = {
        UnicornLiotox = "795e503e-4155-4ad5-9ca0-27d62e3eaf2b";
      };
    };

  };
}
