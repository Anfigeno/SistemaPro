{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.entornoHyprland;
in {
  options.modulosHomeManager.entornoHyprland = {
    activar = lib.mkEnableOption "Activa el módulo de entoronoHyprland";
  };

  config = lib.mkIf cfg.activar {
    home.packages = with pkgs; [ xdg-utils ulauncher dconf ];

    services.dunst.enable = true;

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
  };
}
