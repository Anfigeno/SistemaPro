{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.vesktop;
in {
  options.modulosHomeManager.vesktop = {
    activar = lib.mkEnableOption "Activa el módulo de vesktop";
  };

  config = lib.mkIf cfg.activar {
    programs.vesktop.enable = true;
  };
}
