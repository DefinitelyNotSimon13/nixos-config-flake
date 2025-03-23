{
  imports = [
    ../common
    ./configuration.nix
  ];

  sops.age.keyFile = "/home/simon/.config/sops/age/keys.txt";
  minecraftServer.enable = false;
  gaming.enable = false;

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      plantuml = {
        image = "plantuml/plantuml-server:jetty";
        ports = [ "8091:8080" ];
      };
      dividi = {
        image = "definitelynotsimon13/dividi:latest";
        ports = [ "8005:8000" ];
      };
    };
  };
}
