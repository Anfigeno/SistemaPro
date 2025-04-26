{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.ulauncher;
in {
  options.modulosHomeManager.ulauncher = {
    activar = lib.mkEnableOption "Activa el módulo de ulauncher";
  };

  config = lib.mkIf cfg.activar { home.packages = with pkgs; [ ulauncher ]; };
}
