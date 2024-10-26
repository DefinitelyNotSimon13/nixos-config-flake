{
  imports = [
    ../common
    ./configuration.nix
  ];

  catppuccinConfig.enable = true;
  consoleConfig.enable = true;
  greetdConfig.enable = false;
  grub.enable = false;
  networkConfig = {
    enable = true;
    hostName = "iso-image";
  };

  sopsConfig.enable = false;
  cosmicDesktop.enable = false;
  docker.enable = false;
  gaming.enable = false;
  libvirtd.enable = false;
  stylixConfig.enable = false;
}
