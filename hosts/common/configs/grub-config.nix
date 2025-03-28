{
  lib,
  config,
  ...
}:
let
  # catppuccin = pkgs.fetchFromGitHub {
  #   owner = "DefinitelyNotSimon13";
  #   repo = "grub-catppuccin";
  #   rev = "ece429379561b387da08eb4604ae2338650d16ac";
  #   sha256 = "sha256-7kXbYL0n2XQ8zGUsfmo/LBiLmtlRAtuQw3aP0nFMK+Q=";
  # };

  cfg = config.grub;
in
{
  options.grub = {
    enable = lib.mkEnableOption "enable grub module";
    # enableTheme = lib.mkOption {
    #   description = "set theme or not";
    #   default = true;
    #   type = lib.types.bool;
    # };
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = lib.mkForce true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
      };
    };
  };
}
