{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "git+https://github.com/DefinitelyNotSimon13/dotfiles.git";
      flake = false;
    };

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
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        "nixos-desktop" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./hosts/nixos-desktop
            inputs.stylix.nixosModules.stylix
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
            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.nixosModules.catppuccin
            inputs.sops-nix.nixosModules.sops
          ];
        };
      };
      homeConfigurations = {
        "simon@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./home/simon/nixos-desktop.nix
            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.homeManagerModules.catppuccin
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
        "simon@nixos-laptop" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            ./home/simon/nixos-laptop.nix
            inputs.stylix.nixosModules.stylix
            inputs.catppuccin.homeManagerModules.catppuccin
            inputs.sops-nix.homeManagerModules.sops
          ];
        };
      };
    };
}
