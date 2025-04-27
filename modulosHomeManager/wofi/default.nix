{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.wofi;
in {
  options.modulosHomeManager.wofi = {
    activar = lib.mkEnableOption "Activa el módulo de wofi";
  };

  config = lib.mkIf cfg.activar { programs.wofi = { enable = true; }; };
}
