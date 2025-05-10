{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.eza;
in {
  options.modulosHomeManager.eza = {
    activar = lib.mkEnableOption "Activa el módulo de eza";
  };

  config = lib.mkIf cfg.activar { programs.eza.enable = true; };
}
