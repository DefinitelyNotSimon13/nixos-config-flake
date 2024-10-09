{
  lib,
  config,
  pkgs,
  ...
}:
let
  catppuccin = pkgs.fetchFromGitHub {
    owner = "DefinitelyNotSimon13";
    repo = "grub-catppuccin";
    rev = "ece429379561b387da08eb4604ae2338650d16ac";
    sha256 = "sha256-7kXbYL0n2XQ8zGUsfmo/LBiLmtlRAtuQw3aP0nFMK+Q=";
  };

  cfg = config.grub;
in
{
  options.grub = {
    enable = lib.mkEnableOption "enable grub module";
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        device = "nodev";
        theme = catppuccin;
      };
    };
  };
}
