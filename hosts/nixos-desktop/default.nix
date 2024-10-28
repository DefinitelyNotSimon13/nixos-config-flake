{
  imports = [
    ../common
    ./configuration.nix
  ];

  sops.age.keyFile = "/home/simon/.config/sops/age/keys.txt";
  minecraftServer.enable = true;
  gaming.enable = true;
}
