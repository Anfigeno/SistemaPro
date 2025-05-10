{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.yazi;
in {
  options.modulosHomeManager.yazi = {
    activar = lib.mkEnableOption "Activa el módulo de yazi";
  };

  config = lib.mkIf cfg.activar { programs.yazi.enable = true; };
}
