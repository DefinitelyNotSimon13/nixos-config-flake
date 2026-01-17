{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

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

    ownpkgs = {
      url = "github:DefinitelyNotSimon13/pkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        "nixos-desktop" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nixos-desktop
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.sops-nix.nixosModules.sops
          ];
        };
        "nixos-laptop" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nixos-laptop
            inputs.nix-flatpak.nixosModules.nix-flatpak
            inputs.sops-nix.nixosModules.sops
          ];
        };
        "iso-image" = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/iso-image inputs.sops-nix.nixosModules.sops ];
        };
      };
      homeConfigurations = {
        "simon@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/simon/nixos-desktop.nix
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
        "simon@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/simon/nixos-laptop.nix
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
        "simon@blsi153-workstation" =
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = { inherit inputs outputs; };
            modules = [
              ./home/simon/blsi153-workstation.nix
              inputs.sops-nix.homeManagerModules.sops
            ];
          };
        "simon-arch@arch-desktop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/simon-arch/arch-desktop.nix
            inputs.sops-nix.homeManagerModules.sops
            inputs.stylix.homeModules.stylix
          ];
        };
        "simon@arch-laptop" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/simon/arch-laptop.nix
            inputs.sops-nix.homeManagerModules.sops
            inputs.stylix.homeModules.stylix
          ];
        };
        "simon@iso-image" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/simon/iso-image.nix ];
        };
      };

    };
}
