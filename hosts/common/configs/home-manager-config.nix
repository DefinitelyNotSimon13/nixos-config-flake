{ inputs, outputs, ... }:
{
  home-manager = {
    useUserPackages = true;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };
}
