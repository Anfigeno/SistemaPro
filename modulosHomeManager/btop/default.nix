{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.btop;
in {
  options.modulosHomeManager.btop = {
    activar = lib.mkEnableOption "Activa el módulo de btop";
  };

  config = lib.mkIf cfg.activar { programs.btop.enable = true; };
}
