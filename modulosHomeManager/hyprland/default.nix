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
        windowrule = import ./config/reglasDeVentana.nix { inherit lib; };
        exec-once = import ./config/alIniciar.nix { inherit pkgs; };
        exec = [ "${pkgs.swww}/bin/swww img $HOME/fondo.png" ];
        input = {
          kb_layout = "latam";
          sensitivity = -0.4;
          scroll_factor = 0.8;
          touchpad = { natural_scroll = true; };
        };
        bindm = import ./config/atajosDelMouse.nix;
        decoration = {
          shadow = {
            enabled = true;
            range = 40;
            offset = "0, 0";
            render_power = 3;
            color = "rgba(00000080)";
            color_inactive = "rgba(00000055)";
          };

          rounding = 10;

          blur = {
            enabled = true;
            size = 6;
            passes = 3;
            new_optimizations = true;
            ignore_opacity = true;
          };

          active_opacity = 1.0;
          inactive_opacity = 0.95;

          bezier = [
            "easeInOutQuart, 0.76, 0, 0.24, 1"
            "easeOutQuart, 0.25, 1, 0.5, 1"
          ];

          animation = [
            "windows, 1, 5, easeInOutQuart, slide"
            "border, 1, 5, easeOutQuart"
            "fade, 1, 5, easeOutQuart"
            "workspaces, 1, 3, easeInOutQuart, slidevert"
          ];
        };
        misc = {
          disable_hyprland_logo = true;

          vfr = true;
          vrr = 1;

          mouse_move_enables_dpms = true;
          key_press_enables_dpms = true;
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
