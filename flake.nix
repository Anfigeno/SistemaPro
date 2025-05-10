{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations = {
        h81m = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [ ./maquinas/h81m/configuration.nix ];
        };
        l470 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            ./maquinas/l470/configuration.nix
          ];
        };
      };

      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
    };
}
