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

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
  };
}
