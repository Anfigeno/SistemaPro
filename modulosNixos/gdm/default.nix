{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.gdm;
in {
  options.modulosNixos.gdm = {
    activar = lib.mkEnableOption "Activa el módulo de gdm";
  };

  config = lib.mkIf cfg.activar {
    services.displayManager.gdm.enable = true;
  };
}
