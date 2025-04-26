{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.CAMBIAR;
in {
  options.modulosHomeManager.CAMBIAR = {
    activar = lib.mkEnableOption "Activa el módulo de CAMBIAR";
  };

  config = lib.mkIf cfg.activar { };
}
