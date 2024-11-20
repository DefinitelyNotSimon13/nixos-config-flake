{
  imports = [
    ../common
    ./configuration.nix
  ];

  sops.age.keyFile = "/home/simon/.config/sops/age/keys.txt";
  minecraftServer.enable = true;
  gaming.enable = true;

  fileSystems."/home/simon/vwi" = {
    device = "ud04_266@ud04.udmedia.de:/home/ud04_266";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      "IdentityFile=/home/simon/.ssh/id_ed25519"
      "Port=2222"
    ];
  };
}
