{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.entornoHyprland;
in {
  imports = [ ./paquetesExtraEntornoHyprland.nix ];

  options.modulosHomeManager.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entornoHyprland";
  };

  config.modulosHomeManager = lib.mkIf cfg.activar {
    hyprland.activar = true;
    dunst.activar = true;
    wofi.activar = true;
    eww.activar = true;
    desktopEntries.activar = true;
    cliphist.activar = true;
    stylix.activar = true;
    paquetesExtraEntornoHyprland.activar = true;
  };
}
