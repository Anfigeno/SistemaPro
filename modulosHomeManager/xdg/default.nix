{ pkgs, lib, config, ... }:
let cfg = config.modulosHomeManager.xdg;
in {
  options.modulosHomeManager.xdg = {
    activar = lib.mkEnableOption "Activa el módulo de xdg";
  };

  config = lib.mkIf cfg.activar {
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
      config.common.default = [ "hyrpland" ];
    };
  };
}
