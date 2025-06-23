{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "git+https://github.com/DefinitelyNotSimon13/dotfiles.git";
      flake = false;
    };

    tokenize.url = "github:DefinitelyNotSimon13/tokenize";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        "nixos-desktop" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./hosts/nixos-desktop
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.catppuccin.nixosModules.catppuccin
            inputs.sops-nix.nixosModules.sops
          ];
        };
        "nixos-laptop" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./hosts/nixos-laptop
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.catppuccin.nixosModules.catppuccin
            inputs.sops-nix.nixosModules.sops
          ];
        };
        "iso-image" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./hosts/iso-image
            inputs.catppuccin.nixosModules.catppuccin
            inputs.sops-nix.nixosModules.sops
          ];
        };
      };
      homeConfigurations = {
        "simon@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./home/simon/nixos-desktop.nix
            inputs.catppuccin.homeModules.catppuccin
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
        "simon@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./home/simon/nixos-laptop.nix
            inputs.catppuccin.homeModules.catppuccin
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
        "simon@blsi153-workstation" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./home/simon/blsi153-workstation.nix
            inputs.catppuccin.homeModules.catppuccin
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
        "simon@iso-image" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./home/simon/iso-image.nix
            inputs.catppuccin.homeModules.catppuccin
          ];
        };
      };

    };
}
