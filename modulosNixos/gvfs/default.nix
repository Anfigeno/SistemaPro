{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.gvfs;
in {
  options.modulosNixos.gvfs = {
    activar = lib.mkEnableOption "Activa el módulo de gvfs";
  };

  config = lib.mkIf cfg.activar { services.gvfs.enable = true; };
}
