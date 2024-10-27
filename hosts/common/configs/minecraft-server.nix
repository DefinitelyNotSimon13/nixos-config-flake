{
  pkgs,
  lib,
  config,
  home,
  inputs,
  ...
}:
let
  moduleName = "minecraftServer";
  cfg = config."${moduleName}";
in
{

  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];

  options."${moduleName}" = {
    enable = lib.mkEnableOption "enables ${moduleName}";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
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
