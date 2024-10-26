{ lib, ... }:
{
  services.openssh = {
    enable = lib.mkDefault true;
    settings.PermitRootLogin = lib.mkDefault "no";
    allowSFTP = lib.mkDefault true;
  };
}
