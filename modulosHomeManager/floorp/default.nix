{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.floorp;
in {
  options.modulosHomeManager.floorp = {
    activar = lib.mkEnableOption "Activa el módulo de floorp";
  };

  config = lib.mkIf cfg.activar { programs.floorp = { enable = true; }; };
}
