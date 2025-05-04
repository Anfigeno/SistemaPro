{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.bat;
in {
  options.modulosHomeManager.bat = {
    activar = lib.mkEnableOption "Activa el módulo de bat";
  };

  config = lib.mkIf cfg.activar {
    programs.bat.enable = true;
  };
}
