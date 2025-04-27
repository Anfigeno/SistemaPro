{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.entornoHyprland;
in {
  options.modulosHomeManager.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entoronoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ xdg-utils ulauncher dconf ];

    # # # # # # #
    # Hyprland
    # # # # # # #
    wayland.windowManager.hyprland = {
      systemd.variables = [ "--all" ];
      enable = true;
      settings = {
        "$mod" = "SUPER";
        bind = import ./config/hyprland/atajos.nix { inherit pkgs; };
        exec-once = import ./config/hyprland/alInicio.nix;
        input = { kb_layout = "latam"; };
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
          "col.active_border" = "rgba(ff5263ff)";
          "col.inactive_border" = "rgba(1e1f2aff)";
        };
      };
    };

    # # # #
    # GTK
    # # # #
    gtk = {
      enable = true;
      theme = {
        package = pkgs.tokyonight-gtk-theme;
        name = "Tokyonight-Dark";
      };
      iconTheme = {
        package = pkgs.papirus-icon-theme;
        name = "Papirus-Dark";
      };
      font = {
        name = "Ubuntu";
        size = 10;
      };
    };

    # # # # #
    # Dunst
    # # # # #
    services.dunst = {
      enable = true;
      settings = {
        global = {
          width = 300;
          height = 100;
          offset = "30x50";
          origin = "top-right";
          padding = 20;
          gap_size = 8;
          corner_radius = 10;
          frame_color = "#313749";
          frame_width = 1;
          font = "Ubuntu 10";
        };
        urgency_normal = {
          background = "#242734";
          foreground = "#bbc3e8";
          timeout = 4;
        };
        urgency_critical = {
          frame_color = "#ff7d81";
          background = "#ff5263";
          foreground = "#1e1f2a";
          timeout = 10;
        };
      };
    };
  };
}
