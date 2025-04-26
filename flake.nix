{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_x64-linux";

      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations = {
        h81m = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system; };
          modules = [ ./maquinas/h81m/configuration.nix ];
        };
      };
    };
}
