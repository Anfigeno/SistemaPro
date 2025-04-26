{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.CAMBIAR;
in {
  options.modulosNixos.CAMBIAR = {
    activar = lib.mkEnableOption "Activa el módulo de CAMBIAR";
  };

  config = lib.mkIf cfg.activar { };
}
