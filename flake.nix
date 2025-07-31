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
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      maquinas = [ "l470" "h81m" ];
      usuario = "anfitrion";
    in {
      nixosConfigurations = builtins.listToAttrs (map (maquina: {
        name = maquina;
        value = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs system pkgs maquina usuario; };
          modules = [
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            ./maquinas/configuracionPorDefecto.nix
          ];
        };
      }) maquinas);

      devShells.${system}.default = import ./shell.nix { inherit pkgs; };
    };
}
