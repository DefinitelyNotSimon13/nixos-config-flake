# Common configuration for all hosts
{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./users
    ./configs
    ./programs.nix
    ./secrets.nix
    ./nix-ld.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  nixpkgs.config.allowUnfree = true;

  system.copySystemConfiguration = false;

  system.stateVersion = "24.05";

  sopsConfig.enable = lib.mkDefault true;

  services.udev.extraRules = ''
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2e8a", MODE:="0666"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2341", MODE:="0666"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="1fc9", MODE:="0666"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="0525", MODE:="0666"
  '';

  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";

      }
    ];
    packages = [
      "io.github.zen_browser.zen"
      "com.discordapp.Discord"
    ];
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "hyprland"
        ];
        "org.gtk.Settings.FileChooser" = [
          "gtk"
        ];
      };
    };
  };

}
