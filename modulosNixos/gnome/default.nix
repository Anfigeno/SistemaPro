{ pkgs, lib, config, ... }:
let cfg = config.modulosNixos.gnome;
in {
  options.modulosNixos.gnome = {
    activar = lib.mkEnableOption "Activa el módulo de gnome";
  };

  config = lib.mkIf cfg.activar {
    environment.systemPackages = with pkgs.gnomeExtensions; [
      blur-my-shell
      appindicator
    ];

    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
  };
}
