{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.hyprland;
in {
  options.modulosHomeManager.hyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entoronoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ xdg-utils ulauncher dconf ];

    wayland.windowManager.hyprland = {
      systemd.variables = [ "--all" ];
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = import ./config/atajos.nix { inherit pkgs; };
        input = {
          kb_layout = "latam";
          sensitivity = -0.6;
          scroll_factor = 0.4;
          touchpad = { natural_scroll = true; };
        };
        decoration = {
          rounding = 10;
          blur = {
            enabled = true;
            passes = 1;
            size = 3;
          };
        };
        general = {
          border_size = 1;
          "col.active_border" = "rgba(313749ff)";
          "col.inactive_border" = "rgba(1e1f2aff)";
        };
      };
    };
  };
}
