{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.entornoHyprland;
in {
  options.modulosHomeManager.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entoronoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ xdg-utils ulauncher ];

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
