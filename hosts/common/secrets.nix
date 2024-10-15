{ inputs, ... }:
{
  imports =
    [
    ];

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.secrets = {
    "myservice/mysubdir/my_secret" = { };
    "myotherservice/another_secret" = { };
  };

}
