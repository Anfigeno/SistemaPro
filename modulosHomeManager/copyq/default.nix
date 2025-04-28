{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.copyq;
in {
  options.modulosHomeManager.copyq = {
    activar = lib.mkEnableOption "Activa el módulo de copyq";
  };

  config = lib.mkIf cfg.activar { services.copyq.enable = true; };
}
