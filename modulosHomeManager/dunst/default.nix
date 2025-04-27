{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.dunst;
in {
  options.modulosHomeManager.dunst = {
    activar = lib.mkEnableOption "Activa el módulo de dunst";
  };

  config = lib.mkIf cfg.activar {
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
