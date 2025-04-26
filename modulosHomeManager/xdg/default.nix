{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.xdg;
in {
  options.modulosHomeManager.xdg = {
    activar = lib.mkEnableOption "Activa el módulo de xdg";
  };

  config = lib.mkIf cfg.activar { home.packages = with pkgs; [ xdg-utils ]; };
}
