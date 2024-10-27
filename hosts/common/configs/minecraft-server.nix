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
    services.minecraft-servers = {
      enable = true;
      eula = true;

      servers = {
        vanilla-server = {
          enable = true;
          package = pkgs.minecraftServers.vanilla-1_21_1;

          serverProperties = {
            "rcon.password" = "password";
            difficulty = "normal";
            enable-rcon = true;
            gamemode = "survival";
            max-players = 161;
            motd = "NixOS Vanilla Minecraft server!";
            server-port = 25565;
            view-distance = 10;
            white-list = true;
          };

          whitelist = {
            UnicornLiotox = "795e503e-4155-4ad5-9ca0-27d62e3eaf2b";
          };
        };

        vanilla-server-2 = {
          enable = true;
          package = pkgs.minecraftServers.vanilla-1_8_3;

          serverProperties = {
            "rcon.password" = "password";
            difficulty = "normal";
            enable-rcon = true;
            gamemode = "creative";
            max-players = 5;
            motd = "Second Vanilla Minecraft server!";
            server-port = 25566;
            rconf-port = 25576;
            view-distance = 10;
            white-list = false;
          };
        };

        fabric-server1 = {
          enable = true;
          package = pkgs.fabricServers.fabric-1_20_1.override { loaderVersion = "0.16.7"; };

          serverProperties = {
            server-port = 25567;
          };

          symlinks =
            let
              modpack = (
                pkgs.fetchPackwizModpack {
                  url = "http://localhost:8080/pack.toml";
                  packHash = "+xyYgot/owkaDQAX2d+rx3SprT6gQz7JNrAz+jHZxQI=";
                }
              );
            in
            {
              "mods" = "${modpack}/mods";

            };
        };

      };
    };

  };
}
