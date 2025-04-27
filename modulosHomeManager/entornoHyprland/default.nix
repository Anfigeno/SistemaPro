{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.entornoHyprland;
in {
  options.modulosHomeManager.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entoronoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ xdg-utils ulauncher ];

    services.dunst.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = import ./config/hyprland/atajos.nix { inherit pkgs; };
        exec-once = import ./config/hyprland/alInicio.nix;
        input = { kb_layout = "latam"; };
      };
    };
  };
}
