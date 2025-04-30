{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.cliphist;
in {
  options.modulosHomeManager.cliphist = {
    activar = lib.mkEnableOption "Activa el módulo de cliphist";
  };

  config = lib.mkIf cfg.activar {
    services.cliphist = {
      enable = true;
      allowImages = true;
    };
  };
}
