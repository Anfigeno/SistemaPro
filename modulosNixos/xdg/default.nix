{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.xdg;
in {
  options.modulosNixos.xdg = {
    activar = lib.mkEnableOption "Activa el módulo de xdg";
  };

  config = lib.mkIf cfg.activar {
    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}
