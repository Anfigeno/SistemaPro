{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.entornoDeDesarrollo;
in {
  imports = [ ./paquetesExtraDesarrollo.nix ];

  options.modulosHomeManager.entornoDeDesarrollo = {
    activar = lib.mkEnableOption "Activa el módulo de entornoDeDesarrollo";
  };

  config.modulosHomeManager = lib.mkIf cfg.activar {
    neovim.activar = true;
    kitty.activar = true;
    fish.activar = true;
    zed.activar = true;
    fuentes.activar = true;
    git.activar = true;
    paquetesExtraDesarrollo.activar = true;
  };
}
