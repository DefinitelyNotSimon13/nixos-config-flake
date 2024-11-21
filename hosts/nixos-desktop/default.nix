{
  imports = [
    ../common
    ./configuration.nix
  ];

  sops.age.keyFile = "/home/simon/.config/sops/age/keys.txt";
  minecraftServer.enable = false;
  gaming.enable = false;

  virtualisation.oci-containers.containers = {
    plantuml = {
      image = "plantuml/plantuml-server:jetty";
      ports = [ "8091:8080" ];
    };
  };
}
