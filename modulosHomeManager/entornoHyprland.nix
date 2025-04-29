{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.entornoHyprland;
in {
  options.modulosHomeManager.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entornoHyprland";
  };

  config.modulosHomeManager = lib.mkIf cfg.activar {
    hyprland.activar = true;
    gtk.activar = true;
    dunst.activar = true;
    wofi.activar = true;
    copyq.activar = true;
    eww.activar = true;
  };
}
