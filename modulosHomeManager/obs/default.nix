{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.obs;
in {
  options.modulosHomeManager.obs = {
    activar = lib.mkEnableOption "Activa el módulo de obs";
  };

  config = lib.mkIf cfg.activar {
    programs.obs-studio.enable = true;
  };
}
