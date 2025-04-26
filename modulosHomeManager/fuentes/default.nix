{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.fuentes;
in {
  options.modulosHomeManager.fuentes = {
    activar = lib.mkEnableOption "Activa el módulo de fuentes";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [
      monaspace
      ubuntu_font_family
    ];
  };
}
