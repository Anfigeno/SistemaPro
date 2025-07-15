{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.hyprland;
in {
  options.modulosHomeManager.hyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entoronoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = import ./paquetesExtra.nix { inherit pkgs; };

    wayland.windowManager.hyprland = {
      systemd.variables = [ "--all" ];
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = import ./config/atajos.nix { inherit pkgs; };
        exec-once = [
          "${pkgs.eww}/bin/eww open barra_de_tareas"
          "${pkgs.swww}/bin/swww-daemon"
        ];
        windowrule = [ "size 600 400, class:^(.*)$, title:^(.*)$" ];
        exec = [ "${pkgs.swww}/bin/swww img $HOME/fondo.png" ];
        input = {
          kb_layout = "latam";
          sensitivity = -0.4;
          scroll_factor = 0.8;
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
          gaps_in = 10;
          gaps_out = 10;
        };
      };
    };
  };
}
