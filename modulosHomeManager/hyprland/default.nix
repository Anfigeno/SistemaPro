{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.hyprland;
in {
  options.modulosHomeManager.hyprland = {
    activar = lib.mkEnableOption "Activa el módulo de Hyprland";
  };

  config = lib.mkIf cfg.activar {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = import ./atajos.nix ++ import ./navegacion.nix;
        exec-once = import ./alInicio.nix;
        input = { kb_layout = "latam"; };
      };
    };
  };
}
